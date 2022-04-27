# This script is design to plot the mmpbsa calculate results
# fork from Lewisbase's script
# Date: 2021.03.26

import os
import sys
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
import seaborn as sns
# from brokenaxes import brokenaxes
matplotlib.rcParams['font.size'] = 15
matplotlib.rcParams['font.family'] = 'Times New Roman'
# plt.style.use('science')
from rich.console import Console
cs = Console()


def read_mmpbsa_dat(file_path):
    with open(file_path) as file:
        # TODO: control time manually
        # if frame > 5:
        #     return
        if file_path.endswith('_pid~MMPBSA.dat'):
            lines = file.readlines()
            entropy = float(lines[-3].split()[2])
            text = [lines[0].replace('\n', '') + '   |  -TdS \n']

            for line in lines:
                if line.startswith('_pid~'):
                    frame = line.split()[0].replace('_pid~', '').replace('ns', '')
                    binding = float(line.split()[1])  # + entropy
                    binding_DH = float(line.split()[2])  # + entropy
                    new_line = str(frame) + ' ' + str(binding) + ' ' + str(binding_DH) + ' | ' + line.split('|', 1)[1]
                    text.append(new_line.replace('\n', '') + '   |  ' + str(entropy) + '\n')
        else:
            text = file.readlines()
    index = []
    data = np.zeros([len(text) - 1, len(text[0].split()) - 1])  # [columns, rows], a number table
    for i in range(1, len(text)):  # start with 2nd line
        index.append(float(text[i].split()[0].replace('_pid~', '').replace('ns', '')))  # L P R
        for j in range(1, len(text[i].split())):  # start with 2nd elem
            if text[i].split()[j] == '|':
                data[i - 1][j - 1] = np.nan  # start at 0 0 for date table
            else:
                try:
                    data[i - 1][j - 1] = float(text[i].split()[j]) / 4.184  # caste to kcal/mol
                except ValueError:
                    print(text[i].split()[j])
                    print(file_path, i, j)
    column_names = text[0].split()[1:]  # name of columns
    dataframe = pd.DataFrame(data=data, index=index, columns=column_names).sort_index()
    return dataframe.sort_index()


def entropy_cal(mm):
    KT = 0.001985875 * 298.15
    # RT2KJ = 8.314462618*298.15/1E3
    fm = []
    entropy_list = []
    for e in mm:
        fm.append(e)
        mean = np.mean(fm)
        internal = np.mean([np.exp((e - mean) / KT) for e in fm])
        entropy = KT * np.log(internal)
        entropy_list.append(entropy)
    return entropy_list


def plot_mmpbsa_curves(df):
    """mmpbsa"""
    # df = df.iloc[20:, :]
    x = df.index.tolist()
    # y = np.squeeze(df[['Binding_DH']].values.tolist())
    mm = np.squeeze(df[['MM_DH']].values.tolist())
    pb = np.squeeze(df[['PB']].values.tolist())
    sa = np.squeeze(df[['SA']].values.tolist())
    # entropy = np.squeeze(df[['-TdS']].values.tolist())
    entropy = entropy_cal(mm)
    y = mm + pb + sa
    mm_small = [e for e in mm]
    pb_small = [e for e in pb]

    "plot mmpbsa"
    fig, ax = plt.subplots()
    ax.plot(x, y, label='SUM', color='tab:red')
    ax.plot(x, mm_small, label='MM/10', color='tab:cyan')
    ax.plot(x, pb_small, label='PB/10', color='tab:green')
    ax.plot(x, sa, label='SA', color='tab:pink')
    ax.plot(x, entropy, label='-TdS', color='tab:orange')
    ax.set_xlabel('Time (ps)')
    ax.set_ylabel('Energy (kcal/mol)')
    ax.set_title('Normally MMPBSA')
    xmin, xmax = ax.get_xlim()
    ax.set_xticks(np.round(np.linspace(xmin, xmax, 10), 2))
    # ax.legend(loc='lower right')
    # ax.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05),
    #            fancybox=True, shadow=True, ncol=5)

    # Shrink current axis by 20%
    box = ax.get_position()
    ax.set_position([box.x0, box.y0, box.width * 0.8, box.height])
    # Put a legend to the right of the current axis
    ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))

    # with pd.option_context('display.max_rows', None, 'display.max_columns', None):
    print(df.iloc[:, 0:11])
    print('\n entropy:  \n', entropy)
    cs.print('---------\ndE=', y.mean(), ' -TdS=', entropy[-1], ' dG=', y.mean() + entropy[-1], style=f'red')
    print('mm=', mm.mean(), ' pb=', pb.mean(), ' sa=', sa.mean())
    # print('---------\npearson R=', spearmanr([float(e) for e in mm], [float(e) for e in lhoh_num]))

    plt.xticks(rotation=70)
    fig.tight_layout()  # otherwise the right y-label is slightly clipped
    # plt.show()


def plot_heatmap(df, selection='AA'):
    """
    :param selection: RAA, LAA
    """
    # df = df.iloc[:195, :]
    r_exist = df.columns.str.contains('R~')

    if selection == 'RAA':
        df_plot = df.loc[:, r_exist]
    elif selection == 'LAA':
        df_plot = df.loc[:, r_exist ^ True]

    # with pd.option_context('display.max_rows', None, 'display.max_columns', None):
    #     print(df_plot.T)
    #     print(df_plot.T.min(axis=1))
    fig, ax = plt.subplots(figsize=(3, 10))
    sns.heatmap(df_plot.T, linewidth=0.1, cmap='coolwarm', annot=False, cbar=True, cbar_kws={'shrink': 0.5},
                center=0, square=False)

    ax.set_xlabel('time (ns)')
    ax.set_ylabel('index')
    ax.set_title('MM energy decomposition')
    plt.xticks(rotation=70)
    plt.show()


if __name__ == '__main__':
    work_dir = sys.argv[1]

    mmpbsa_df = []
    rHOH_num = []
    lHOH_num = []
    res_mm_df = []
    res_dg_df = []

    for path, dir_list, file_list in os.walk(work_dir, topdown=True):

        for filename in file_list:
            if filename == '_pid~MMPBSA.dat':
                dat = read_mmpbsa_dat(os.path.join(path, filename))
                mmpbsa_df.append(dat)

            if filename == '_pid~resMM_DH.dat':
                dat = read_mmpbsa_dat(os.path.join(path, filename))
                res_mm_df.append(dat)

            if filename == '_pid~res_MMPBSA_DH.dat':
                dat = read_mmpbsa_dat(os.path.join(path, filename))
                res_dg_df.append(dat)

    mmpbsa_df = pd.concat(mmpbsa_df).sort_index()
    res_mm_df = pd.concat(res_mm_df).sort_index()
    res_dg_df = pd.concat(res_dg_df).sort_index()

    "call plot function"
    # plot_mmpbsa_curves(mmpbsa_df)


    # plot_heatmap(res_mm_df, selection='LAA')

    "save to excel"
    # mmpbsa_df.to_excel('7KGK_hoh'+'.xlsx')

 
# -------------------计算每ns的平均值-------------------------------------
    # avg12 = mmpbsa_df.loc[(mmpbsa_df.index>=1) & (mmpbsa_df.index<2),['Binding_DH']]
    # avg12 = avg12['Binding_DH'].mean()
    
    # avg23 = mmpbsa_df.loc[(mmpbsa_df.index>=2) & (mmpbsa_df.index<3),['Binding_DH']]
    # avg23 = avg23['Binding_DH'].mean()

    # avg34 = mmpbsa_df.loc[(mmpbsa_df.index>=3) & (mmpbsa_df.index<4),['Binding_DH']]
    # avg34 = avg34['Binding_DH'].mean()

    # avg45 = mmpbsa_df.loc[(mmpbsa_df.index>=4) & (mmpbsa_df.index<5),['Binding_DH']]
    # avg45 = avg45['Binding_DH'].mean()

    # avg56 = mmpbsa_df.loc[(mmpbsa_df.index>=5) & (mmpbsa_df.index<6),['Binding_DH']]
    # avg56 = avg56['Binding_DH'].mean()
    
    # avg67 = mmpbsa_df.loc[(mmpbsa_df.index>=6) & (mmpbsa_df.index<7),['Binding_DH']]
    # avg67 = avg67['Binding_DH'].mean()

    # avg78 = mmpbsa_df.loc[(mmpbsa_df.index>=7) & (mmpbsa_df.index<8),['Binding_DH']]
    # avg78 = avg78['Binding_DH'].mean()

    # avg89 = mmpbsa_df.loc[(mmpbsa_df.index>=8) & (mmpbsa_df.index<9),['Binding_DH']]
    # avg89 = avg89['Binding_DH'].mean()

    # avg910 = mmpbsa_df.loc[(mmpbsa_df.index>=9) & (mmpbsa_df.index<10),['Binding_DH']]
    # avg910 = avg910['Binding_DH'].mean()

    # Binding_DH = [avg12,avg23,avg34,avg45,avg56,avg67,avg78,avg89,avg910]
    # this_index=['avg12','avg23','avg34','avg45','avg56','avg67','avg78','avg89','avg910']
    # result  = pd.DataFrame(Binding_DH,columns=['Binding_DH'],index=this_index)
   
    # print(result)



# -------------------提取每200ps的帧出来进行计算-------------------------------------

work_dir = sys.argv[1]
if "1-5" in work_dir:
    begin = 11
    end = 50
elif "5-20" in work_dir:
    begin = 51
    end = 100
else:
    print("-----wrong---------!!!!!")
    sys.exit()


interval = 2

index_list = []
for i in range(begin,end,interval):
    index_list.append(round(i*0.1,2))
# print(index_list)

select_index_list = []
for i in index_list:
    if i in mmpbsa_df.index.values:
        select_index_list.append(i)
# print("\nselect_index_list:\n ",select_index_list)


data_list = mmpbsa_df.loc[select_index_list,'Binding_DH']
# print("\ndata_list:\n ",data_list.tolist())


mm = np.squeeze(mmpbsa_df[['MM_DH']].values.tolist())
entropy_data = entropy_cal(mm)
entropy_pd = pd.DataFrame(entropy_data,columns=['entropy'],index=mmpbsa_df.index)
entropy_sel_list = entropy_pd.loc[select_index_list,'entropy']
# print("\nentropy_sel_list: \n",entropy_sel_list.tolist())

sum_list = np.sum([data_list,entropy_sel_list],axis=0).tolist()


result = pd.DataFrame({'Binding_DH':data_list,'entropy':entropy_sel_list,'sum':sum_list},index = select_index_list)
# print("\n",result)

print("\n sum average:",round(result['sum'].mean(),3))