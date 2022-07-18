import os
import sys
import subprocess
import shutil

libdir = '/home/wurp/PycharmProjects/BioUtil/gmx/pygmx'
anti_list = [
    '1_7KFY',
    '2_7KFX',
    '3_7KFV',
    '4_7KFW',
    '5_7JVA',
    '6_7KGK',
    '7_6LZG',
    '8_6YZ5',
    '9_6ZBP',
    '10_7B27',
    '11_7BWJ',
    # '12_7CH4',
    # '13_7CH5',
    # '14_7E23',
    # '15_7JMO',
    # '16_7K8M',
    # '17_6W41',
    # '18_6YM0',
    # '19_6ZER',
    # '20_7C01',
    # '21_7DEO',
    # '22_7MZF',
    # '23_7DPM',
    # '24_7KGJ',
    # '25_7JW0',
    # '26_7JMP',
    # '27_7B3O',
    # '28_7NEH',
    # '29_7NXB',
    # '30_7QNW',
    # '31_7L2C',
    # '32_7LY3',
    # '33_7M8J'
]

anti_divide = {
    '1_7KFY': {'ri_left': 196, 'ri_right': 632, 'li_left': 1, 'li_right': 195},
    '2_7KFX': {'ri_left': 196, 'ri_right': 634, 'li_left': 1, 'li_right': 195},
    '3_7KFV': {'ri_left': 196, 'ri_right': 634, 'li_left': 1, 'li_right': 195},
    '4_7KFW': {'ri_left': 196, 'ri_right': 631, 'li_left': 1, 'li_right': 195},
    '5_7JVA': {'ri_left': 1, 'ri_right': 227, 'li_left': 228, 'li_right': 420},
    '6_7KGK': {'ri_left': 196, 'ri_right': 314, 'li_left': 1, 'li_right': 195},
    '7_6LZG': {'ri_left': 1, 'ri_right': 596, 'li_left': 597, 'li_right': 791},
    '8_6YZ5': {'ri_left': 196, 'ri_right': 322, 'li_left': 1, 'li_right': 195},
    '9_6ZBP': {'ri_left': 196, 'ri_right': 322, 'li_left': 1, 'li_right': 195},
    '10_7B27': {'ri_left': 203, 'ri_right': 327, 'li_left': 1, 'li_right': 202},
    '11_7BWJ': {'ri_left': 195, 'ri_right': 636, 'li_left': 1, 'li_right': 194},
    '12_7CH4': {'ri_left': 1, 'ri_right': 431, 'li_left': 432, 'li_right': 619},
    '13_7CH5': {'ri_left': 1, 'ri_right': 424, 'li_left': 425, 'li_right': 607},
    '14_7E23': {'ri_left': 195, 'ri_right': 403, 'li_left': 1, 'li_right': 194},
    '15_7JMO': {'ri_left': 194, 'ri_right': 622, 'li_left': 1, 'li_right': 193},
    '16_7K8M': {'ri_left': 1, 'ri_right': 428, 'li_left': 429, 'li_right': 612},
    '17_6W41': {'ri_left': 1, 'ri_right': 443, 'li_left': 444, 'li_right': 638},
    '18_6YM0': {'ri_left': 198, 'ri_right': 634, 'li_left': 1, 'li_right': 197},
    '19_6ZER': {'ri_left': 198, 'ri_right': 633, 'li_left': 1, 'li_right': 197},
    '20_7C01': {'ri_left': 196, 'ri_right': 628, 'li_left': 1, 'li_right': 195},
    '21_7DEO': {'ri_left': 1, 'ri_right': 241, 'li_left': 242, 'li_right': 443},
    '22_7MZF': {'ri_left': 197, 'ri_right': 624, 'li_left': 1, 'li_right': 196},
    '23_7DPM': {'ri_left': 1, 'ri_right': 444, 'li_left': 445, 'li_right': 640},
    '28_7NEH': {'ri_left': 435, 'ri_right': 630, 'li_left': 1, 'li_right': 434},
    '29_7NXB': {'ri_left': 1, 'ri_right': 193, 'li_left': 194, 'li_right': 623},
    '30_7QNW': {'ri_left': 1, 'ri_right': 188, 'li_left': 189, 'li_right': 630},
    '31_7L2C': {'ri_left': 1, 'ri_right': 273, 'li_left': 274, 'li_right': 708},
    '32_7LY3': {'ri_left': 1, 'ri_right': 284, 'li_left': 285, 'li_right': 716},
    '33_7M8J': {'ri_left': 1, 'ri_right': 224, 'li_left': 225, 'li_right': 453}
}


def run_normal():
    for anti in anti_list:
        anti_dir = '/home/wurp/workspace/antibody/SARS-COV-2/' + anti + '/MD_10ns_3'
        os.chdir(anti_dir)
        os.chdir(anti_dir)
        cur_dir = anti_dir + '/1-10-200-normal'
        if not os.path.exists(cur_dir):
            os.mkdir('1-10-200-normal')
        os.chdir(cur_dir)
        print(os.getcwd())

        command = 'python ' + libdir + '/main.py' \
                  + ' -tpr ' + anti_dir + '/md_0.tpr' \
                  + ' -xtc ' + anti_dir + '/md_0.xtc' \
                  + ' -ri ' + str(anti_divide[anti]['ri_left']) + ' ' + str(anti_divide[anti]['ri_right']) \
                  + ' -li ' + str(anti_divide[anti]['li_left']) + ' ' + str(anti_divide[anti]['li_right']) \
                  + ' -fm ' + 'normal' \
                  + ' -rm ' + 'normal' \
                  + ' -t ' + '1000 10000 200 1'
        os.system(command)


def run_hoh():
    for anti in anti_list:
        anti_dir = '/home/wurp/workspace/antibody/SARS-COV-2/' + anti + '/MD_10ns_3'
        os.chdir(anti_dir)
        os.chdir(anti_dir)
        cur_dir = anti_dir + '/1-10-200-hoh'
        if not os.path.exists(cur_dir):
            os.mkdir('1-10-200-hoh')
        os.chdir(cur_dir)
        print(os.getcwd())

        command = 'python ' + libdir + '/main2.py' \
                  + ' -tpr ' + anti_dir + '/md_0.tpr' \
                  + ' -xtc ' + anti_dir + '/md_0.xtc' \
                  + ' -ri ' + str(anti_divide[anti]['ri_left']) + ' ' + str(anti_divide[anti]['ri_right']) \
                  + ' -li ' + str(anti_divide[anti]['li_left']) + ' ' + str(anti_divide[anti]['li_right']) \
                  + ' -fm ' + 'normal' \
                  + ' -rm ' + 'hyhoh' \
                  + ' -t ' + '1000 10000 200 1'
        os.system(command)


def run_most_fre():
    for anti in anti_list:
        anti_dir = '/home/wurp/workspace/antibody/SARS-COV-2/' + anti + '/MD_10ns_3'
        os.chdir(anti_dir)
        cur_dir = anti_dir + '/1-10-most-final'
        if not os.path.exists(cur_dir):
            os.mkdir('1-10-most-final')
        os.chdir(cur_dir)
        print(os.getcwd())

        command = 'python ' + libdir + '/main.py' \
                  + ' -tpr ' + anti_dir + '/md_0.tpr' \
                  + ' -xtc ' + anti_dir + '/md_0.xtc' \
                  + ' -ri ' + str(anti_divide[anti]['ri_left']) + ' ' + str(anti_divide[anti]['ri_right']) \
                  + ' -li ' + str(anti_divide[anti]['li_left']) + ' ' + str(anti_divide[anti]['li_right']) \
                  + ' -fm ' + 'most' \
                  + ' -rm ' + 'normal' \
                  + ' -t ' + '1000 10000 200 1'
        os.system(command)


if __name__ == '__main__':
    # run_normal()
    run_most_fre()
    run_hoh()

# python /home/wurp/workspace/antibody/script/mmpbsa/batch_run-mmpbsa.py
