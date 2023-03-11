import os
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import ticker

def generate_eval2_png(
    lat_data,
    cp_data,
    outpath
):
    # 设置字体
    font2 = {
    'weight': 'normal',
    'size': 18,
    }
    fig = plt.figure()
    subfigure_width = 0.81
    subfigure_higt = 0.22
    subfigure_higt_interval = 0.02

    left_space = 0.15
    bottom_space = 0.06
    ax1 = fig.add_axes( [left_space, bottom_space + (subfigure_higt+subfigure_higt_interval)*2, subfigure_width, subfigure_higt], xticklabels=[], xlim=(0,100))
    ax2 = fig.add_axes( [left_space, bottom_space + (subfigure_higt+subfigure_higt_interval)*1, subfigure_width, subfigure_higt], xlim=(0,100), ylim=(0, 1), xticklabels=[])
    ax3 = fig.add_axes( [left_space, bottom_space + (subfigure_higt+subfigure_higt_interval)*0, subfigure_width, subfigure_higt], xlim=(0,100))
    # 画第一个图
    line_arr=[]
    line_arr += ax1.plot(lat_data, markevery=1, ms=3 , ls='-',color = '#008685', linewidth=2.5,label='Latency')
    ax1.set_ylabel(f"(a) 99th Latency\n(ms)", fontsize=12, linespacing=1)
    ax1.grid(axis='y')
    ax1.yaxis.set_major_locator(ticker.MultipleLocator(20))
    ax1.tick_params(labelsize=12)

    # ax1.set_xlabel("Seconds (s)", fontsize=11, linespacing=0.7)
    x = np.arange(0, 100, 1, dtype=int)
    line_arr += ax2.stackplot(x, cp_data['l2_pro']['LC'], cp_data['l2_pro']['BE'],
        labels=['LC_L2', 'BE_L2'], colors=['#B40F0F','#F6903D'])
    ax2.set_ylabel("(b) L2 cacpacity\nportion", fontsize=12, linespacing=1)
    ax2.yaxis.set_major_formatter(ticker.PercentFormatter(xmax=1, decimals=0))
    ax2.yaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax2.tick_params(labelsize=12)
    ax2.grid(axis='y')

    line_arr +=  ax3.plot(cp_data['l1_bw']['LC'], markevery=1, ls='-',color='#5B8FF9',linewidth=2.5,ms=3,label="LC_L1BW")
    line_arr +=  ax3.plot(cp_data['l1_bw']['BE'], markevery=1, ls='-',color='#F08BB4',linewidth=2.5,ms=3,label="BE_L1BW")
    ax3.set_ylabel("(c) L1 BW\n(MB)", fontsize=12, linespacing=1)
    ax3.yaxis.set_major_locator(ticker.MultipleLocator(50))
    ax3.tick_params(labelsize=12)
    ax3.grid(axis='y')
    ax3.set_xticklabels([])
    ax3.set_xlabel("Timeline", fontsize=11, linespacing=0.7)


    # ax1.yaxis.set_label_coords(-0.1,0.5)
    # ax2.yaxis.set_label_coords(-0.1,0.5)
    # ax3.yaxis.set_label_coords(-0.1,0.5)

    line_arr1 = [line_arr[0],line_arr[3], line_arr[1],line_arr[4],line_arr[2],]
    lines_label1 = [line.get_label() for line in line_arr1]
    ax1.legend(line_arr1, lines_label1, shadow=0, fontsize = 12, bbox_to_anchor=(-0.01,1.3,0,0), loc = 'upper left',  \
        borderaxespad=0.2, ncol = 5, columnspacing=0.5, labelspacing=0.1)

    fig.set_size_inches(8, 8)
    # fig.tight_layout()
    # plt.show()
    plt.savefig(os.path.join(outpath,"line25_xtick.png"), dpi = 600)

    # 格式
    # plt.legend(shadow=0,handlelength=3,handleheight=1,loc = 'best',fontsize=12)
    # y1.xlabel(r'Scaling Factor',font2)
    # plt.ylabel("Accuracy Loss",font2)
# generate_eval2_png()