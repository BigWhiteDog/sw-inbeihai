import os
import sys
from os.path import join as pjoin
import re
import json
from copy import deepcopy
from time import time
import pandas as pd
import numpy as np

from draw_evalation import generate_eval2_png

standard_targets = [
    '(l1_traffic):',
    '(l2_capacity):',
]

def gen_patterns(targets:list):
    patterns = {}
    meta_pattern = re.compile('.*\((\w.+)\).*')
    for t in targets:
        meta = meta_pattern.search(t).group(1)
        patterns[meta] = re.compile(t+'\s+(\w+)')
    return patterns

def get_stats(file: str, patterns:dict) -> dict:
    with open(file) as f:
        lines_buffs = f.readlines()
    stats = {}
    for line in lines_buffs:
        for k in patterns:
            m = patterns[k].search(line)
            if m:
                stats[m.group(1)] = int(m.group(2),base=16)
    return stats

def get_time_diff_us(file_start:str, file_end:str) -> int:
    with open(file_start) as f_s, open(file_end) as f_e:
        lines_s = f_s.readline()
        lines_e = f_e.readline()
        time_s = int(lines_s)
        time_e = int(lines_e)
    assert(time_s < time_e)
    return (time_e - time_s) // 1000

def get_time_us(file_start:str) -> int:
    with open(file_start) as f_s:
        lines_s = f_s.readline()
        time_s = int(lines_s)
    return time_s // 1000

def get_all_data(dir:str, targets:list) -> dict:
    patterns = gen_patterns(targets)
    stats = {}
    for f in os.listdir(dir):
        idxs = f.split('-')
        if len(idxs) == 3:
            idx = int(idxs[0])
            type = idxs[1]
            flag = idxs[2]
            if stats.get(idx) is None:
                stats[idx] = {}
            if stats[idx].get(type) is None:
                stats[idx][type] = {}
            statfile = pjoin(dir, f)
            if type == 'time':
                stats[idx][type][flag] = get_time_us(statfile)
            else:
                stats[idx][type][flag] = get_stats(statfile, patterns)

    data = {}
    times = {}
    for idx in stats:
        data[idx] = {}
        for type in stats[idx]:
            if type == 'time':
                times[idx] = stats[idx][type]['after'] - stats[idx][type]['before']
            else:
                if data[idx].get(type) is None:
                    data[idx][type] = {}
                for key in stats[idx][type]['before']:
                    if key == 'l1_traffic':
                        if stats[idx][type]['after'][key] < stats[idx][type]['before'][key]:
                            stats[idx][type]['after'][key] += 0x100000000
                        data[idx][type][key] = stats[idx][type]['after'][key] - stats[idx][type]['before'][key]
                    elif key == 'l2_capacity':
                        data[idx][type][key] = stats[idx][type]['after'][key]
    k = list(data.keys())
    k.sort()
    new_data = {}
    for idx in k:
        for type in data[idx]:
            for key in data[idx][type]:
                if new_data.get(key) is None:
                    new_data[key] = {}
                if new_data[key].get(type) is None:
                    new_data[key][type] = []
                if key == 'l1_traffic':
                    new_data[key][type].append(data[idx][type][key] *64 / times[idx])
                elif key == 'l2_capacity':
                    new_data[key][type].append(data[idx][type][key] / 0x8000)
    # print(json.dumps(new_data, indent=4, sort_keys=True))
    add_data = {}
    add_data['l1_bw'] = {}
    add_data['l1_bw']['LC'] = np.array(new_data['l1_traffic']['id0']) + np.array(new_data['l1_traffic']['id2'])
    add_data['l1_bw']['BE'] = np.array(new_data['l1_traffic']['id1'])
    add_data['l2_pro'] = {}
    add_data['l2_pro']['LC'] = np.array(new_data['l2_capacity']['id0']) + np.array(new_data['l2_capacity']['id2'])
    add_data['l2_pro']['BE'] = 1 - add_data['l2_pro']['LC']
    return add_data

if __name__ == "__main__":
    outdata_dir = '/home/zcq/beihai/beihai/sw/sw-inbeihai/outdata'
    cp_data = get_all_data(outdata_dir, standard_targets)
    lat_data = []
    with open(pjoin(outdata_dir, '2.csv')) as f:
        lines = f.readlines()
    for line in lines:
        if line.strip() == '':
            continue
        lat_data.append(float(line))
    # print(json.dumps(data, indent=4, sort_keys=True))
    generate_eval2_png(lat_data=lat_data,cp_data=cp_data,outpath='/home/zcq/beihai/beihai/sw/sw-inbeihai/')