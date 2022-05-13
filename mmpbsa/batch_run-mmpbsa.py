import os
import sys
import subprocess
import shutil

libdir = '/home/wurp/PycharmProjects/BioUtil/gmx/pygmx'
anti_list = ['1_7KFY', '2_7KFX', '3_7KFV', '4_7KFW', '5_7JVA', '6_7KGK', '7_6LZG', '8_6YZ5', '9_6ZBP', '10_7B27', '11_7BWJ']
# anti_list = ['2_7KFX', '3_7KFV', '4_7KFW', '5_7JVA', '6_7KGK', '7_6LZG', '8_6YZ5', '9_6ZBP', '10_7B27', '11_7BWJ']

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
    '11_7BWJ': {'ri_left': 195, 'ri_right': 636, 'li_left': 1, 'li_right': 194}
}

if __name__ == '__main__':
    for anti in anti_list:
        anti_dir = '/home/wurp/workspace/antibody/SARS-COV-2/' + anti + '/MD_10ns'
        os.chdir(anti_dir)
        cur_dir = anti_dir + '/1-5-20-normal'
        if not os.path.exists(cur_dir):
            os.mkdir('1-5-20-normal')
        os.chdir(cur_dir)
        print(os.getcwd())

        command = 'python ' + libdir + '/main.py' \
                  + ' -tpr ' + anti_dir + '/md_0.tpr' \
                  + ' -xtc ' + anti_dir + '/md_0.xtc' \
                  + ' -ri ' + str(anti_divide[anti]['ri_left']) + ' ' + str(anti_divide[anti]['ri_right']) \
                  + ' -li ' + str(anti_divide[anti]['li_left']) + ' ' + str(anti_divide[anti]['li_right']) \
                  + ' -fm ' + 'normal' \
                  + ' -rm ' + 'normal' \
                  + ' -t ' + '1000 5000 20 1' \
 \

        os.system(command)

# python /home/wurp/workspace/antibody/script/mmpbsa/batch_run-mmpbsa.py
