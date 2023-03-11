#!/bin/bash
bh=10

rm -rf outdata
mkdir -p outdata

lat_csv='outdata/2.csv'

echo "" > $lat_csv

cat_0_cmd='cat /sys/fs/cgroup/dsid/dsid.dsid-cp'
cat_1_cmd='cat /sys/fs/cgroup/dsid/test-1/dsid.dsid-cp'
cat_2_cmd='cat /sys/fs/cgroup/dsid/test-2/dsid.dsid-cp'

for i in {1..25}
do
{
    echo run$i
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-before
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-before
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-before
    echo $(date +%s%N) > outdata/$i-time-before
    redis-benchmark -t set -n 4000 -c 6 -h 10.30.12.$bh --csv > 1.csv
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-after
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-after
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-after
    echo $(date +%s%N) > outdata/$i-time-after
    tail -1 1.csv | awk -F, '{print $7}' | sed 's/\"//g' >> $lat_csv
}
done

echo "add dwarf: md5 sort wordcount md5_a @ 10.30.12.$bh"
ssh root@10.30.12.$bh "~/scripts/swim.sh"

echo "dwarf started"

for i in {26..50}
do
{
    echo run$i
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-before
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-before
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-before
    echo $(date +%s%N) > outdata/$i-time-before
    redis-benchmark -t set -n 4000 -c 6 -h 10.30.12.$bh --csv > 1.csv
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-after
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-after
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-after
    echo $(date +%s%N) > outdata/$i-time-after
    tail -1 1.csv | awk -F, '{print $7}' | sed 's/\"//g' >> $lat_csv
}
done

echo "add cache control @ 10.30.12.$bh"
ssh root@10.30.12.$bh "~/scripts/addcontrol_cacheonly.sh"

for i in {51..75}
do
{
    echo run$i
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-before
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-before
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-before
    echo $(date +%s%N) > outdata/$i-time-before
    redis-benchmark -t set -n 4000 -c 6 -h 10.30.12.$bh --csv > 1.csv
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-after
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-after
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-after
    echo $(date +%s%N) > outdata/$i-time-after
    tail -1 1.csv | awk -F, '{print $7}' | sed 's/\"//g' >> $lat_csv
}
done

echo "add full control @ 10.30.12.$bh"
ssh root@10.30.12.$bh "~/scripts/addcontrol_dsid.sh"

for i in {76..100}
do
{
    echo run$i
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-before
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-before
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-before
    echo $(date +%s%N) > outdata/$i-time-before
    redis-benchmark -t set -n 4000 -c 6 -h 10.30.12.$bh --csv > 1.csv
    ssh root@10.30.12.$bh $cat_0_cmd > outdata/$i-id0-after
    ssh root@10.30.12.$bh $cat_1_cmd > outdata/$i-id1-after
    ssh root@10.30.12.$bh $cat_2_cmd > outdata/$i-id2-after
    echo $(date +%s%N) > outdata/$i-time-after
    tail -1 1.csv | awk -F, '{print $7}' | sed 's/\"//g' >> $lat_csv
}
done

echo "kill swim @ 10.30.12.$bh"
ssh root@10.30.12.$bh "~/scripts/killswim.sh"