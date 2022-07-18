import imp
import os
import gromacs as gmx
import subprocess



################################################################################
# 设置运行环境, 计算参数
# setting up environmets and parameters
#   !!! 1. make sure gmx is available
 #  !!! 3. watch _pid.pdb to make sure PBC is correct
################################################################################

step=1	# 从第几步开始运行 step number to run
		# 1. 预处理轨迹: 复合物完整化, 团簇化, 居中叠合, 然后生成pdb文件
		# 2. 获取每个原子的电荷, 半径, LJ参数, 然后生成qrv文件
		# 3. MM-PBSA计算: pdb->pqr, 输出apbs, 计算MM, APBS
		    # 1. pre-processe trajectory, whole, cluster, center, fit, then generate pdb file
		    # 2. abstract atomic parameters, charge, radius, C6/C12, en generate qrv file
		    # 3. run MM-PBSA, pdb->pqr, apbs, then calculate MM, PB, SA

gmx = 'gmx'								# /path/to/GMX/bin/gmx_mpi
dump = gmx + ' dump'						# gmx dump
# trjconv="$gmx trjconv -dt 1000"			# gmx trjconv, use -b -e -dt, NOT -skip
trjconv = gmx +  ' trjconv'			# gmx trjconv, use -b -e -dt, NOT -skip


apbs='apbs'				                # APBS(Linux)

pid = 'pid'				# 输出文件($$可免重复) prefix of the output files($$)
scr= '_' + pid + '.scr'		# 屏幕输出文件 file to save the message from the screen
qrv_file = '_' + pid + '.qrv'		# 电荷/半径/VDW参数文件 to save charge/radius/vdw parmeters

radType=1			# 原子半径类型 radius of atoms (0:ff; 1:mBondi; 2:Bondi)
radLJ0=1.2			# 用于LJ参数原子的默认半径(A, 主要为H) radius when LJ=0 (H)

meshType=0			# 网格大小 mesh (0:global  1:local)
gridType=1			# 格点大小 grid (0:GMXPBSA 1:psize)

cfac=3				# 分子尺寸到粗略格点的放大系数
					# Factor to expand mol-dim to get coarse grid dim
fadd=10				# 分子尺寸到细密格点的增加值(A)
					# Amount added to mol-dim to get fine grid dim (A)
df=.5				# 细密格点间距(A) The desired fine mesh spacing (A)


# 极性计算设置(Polar)


# 非极性计算设置(Apolar/Non-polar)


################################################################################
# 检查 gmx, apbs 是否可以运行
# check gmx, apbs availability
################################################################################



################################################################################
# 解析命令行参数
# parse command line options
################################################################################
trj='traj.xtc'		# 轨迹文件 trajectory file
tpr='topol.tpr'		# tpr文件  tpr file
ndx_file='index.ndx'		# 索引文件 index file

com='Complex'			# 复合物索引组 index group name of complex
pro='Protein'			# 蛋白索引组   index group name of protein
lig='Ligand'			# 配体索引组   index group name of ligand

start = 0
end = 10000
intervel = 200

workDir = ''  # mmpbsa 工作路径
os.chdir(workDir)  #进入到计算MMPBSA的工作路径，产生的文件都放在里面

################################################################################
# 检查所需文件, 索引组
# check needed files, index group
################################################################################




################################################################################
# 1. 预处理轨迹: 复合物完整化, 团簇化, 居中叠合, 然后生成pdb文件
#    请检查pdb文件确保构型PBC处理正确
################################################################################
gmx.trjconv(f=trj, s = tpr, n=ndx, input=com, o='_pid.pdb', b=start, e=end, skip = intervel)

print(">> 1. pre-processe trajectory: OK !\n")


step = 2  # now come to step2
################################################################################
# 2. 获取每个原子的电荷, 半径, LJ参数, 然后生成qrv文件
## dump命令用于将文件系统备份到某个存储设备
################################################################################


def to_qrv_file():

    #  把 ptotein的坐标读入到 ndxPro数组里，把 ligand 的坐标读入到 ndxLig 里，使用字典存储，方便后面查询
    ndx_group = open(ndx_file, mode='r').read().split('[')
    for each_group in ndx_group:
        if 'Protein ]' in each_group and 'non-Protein' not in each_group:
            ndxPro = dict.fromkeys(each_group.split()[2:], 1)
        if 'ligand ]' in each_group:
            ndxLig = dict.fromkeys(each_group.split()[2:], 1)
    


    cmd_gmx_dump = ['gmx', 'dump', '-s', tpr]
    trp_dump_stdout = subprocess.check_output(cmd_gmx_dump, shell=False, stderr=subprocess.PIPE)
    trp_dump_lines = trp_dump_stdout.decode(encoding="utf-8").split('\n')

    # 写入到qrv_file文件里
    # with open(qrv_file, mode = 'wb') as wf:
    #     for line in trp_dump_lines:


# ---------------------------------- in  testing ---------------------------------
# ---------------------------------- in  testing ---------------------------------
# ---------------------------------- in  testing ---------------------------------
# ---------------------------------- in  testing ---------------------------------
import os
import sys
# import gromacs as gmx
import subprocess
import re

tpr = '/home/wurp/workspace/antibody/SARS-COV-2/1_7KFY/MD_10ns/md_0.tpr'

cmd_gmx_dump = ['gmx', 'dump', '-s', tpr]
trp_dump_stdout = subprocess.check_output(cmd_gmx_dump, shell=False, stderr=subprocess.PIPE)
trp_dump_lines = trp_dump_stdout.decode(encoding="utf-8").split('\n')
len_trp = len(trp_dump_lines)
i = 0
Nmol = {}
radLJ0 = 1.2
sigma = {}
epsilon = {}
Rad = {}
Name = {}
Natm = {}
resID = {}
Catm = {}
Ratm = {}
Satm = {}
Eatm = {}
Qatm = {}
resName = {}

nres = 0

while i < len_trp:
	if '#molblock' in trp_dump_lines[i]:  # match  #molblock
		Ntyp = trp_dump_lines[i].split()[2]

	moltype_line = re.match('\s*moltype\s*=.*', trp_dump_lines[i])  # match  moltype =
	if moltype_line is not None:
		moltype_line = moltype_line.group()
		Imol = moltype_line.split()[2]
		i += 1
		Nmol[Imol] = trp_dump_lines[i].split()[2]

	if 'ffparams:' in trp_dump_lines[i]:  # match  ffparams:
		i += 1
		atnr = int(re.sub('.*=', '', trp_dump_lines[i]))
		# print(atnr)  # save to pqr file
		i += 1
		for m in range(atnr):
			# print(m)  # save to pqr file
			for n in range(atnr):
				i += 1
				line_arr = trp_dump_lines[i].split()
				C6 = float(line_arr[2].replace(',', ''))
				C12 = float(line_arr[4].replace(',', ''))
				print(C6 + ' ' + C12)  # save to pqr file
				if n == m:
					sigma[m] = 0
					epsilon[m] = 0
					Rad[m] = radLJ0
					if C6*C12 != 0:
						sigma[m] = pow(10*(C12/C6), 1./6) # 转换单位为A
						epsilon[m] = C6*C6/(4*C12)
						Rad[m] = .5*sigma[m]          # sigma为直径

	moltype2_line = re.match('\s*moltype\s*(.*', trp_dump_lines[i])  # match  moltype (0)
	if moltype2_line is not None:
		 moltype2_line = moltype2_line.group()
		 Imol = re.sub('[^0-9]', '', moltype2_line)
		 i += 1
		 txt = re.sub('.*=', '', trp_dump_lines[i])
		 txt = re.sub(' ', '_', txt)
		 Name[Imol] = txt
		 i += 2
		 txt = re.sub('[^0-9]', '', trp_dump_lines[i])
		 Natm[Imol] = int(txt)
		 for cnt in range(Natm[Imol]):
			 i += 1
			 the_line_arr = trp_dump_lines[i].split()
			 idx = int(the_line_arr[0].replace(',', ''))
			 resID[Imol, cnt]= int(the_line_arr[-3].replace(',', '')) + 1 + nres
			 Catm[Imol, cnt] = idx
			 Ratm[Imol, cnt] = Rad[idx]
			 Satm[Imol, cnt] = sigma[idx]
			 Eatm[Imol, cnt] = epsilon[idx]
			 Qatm = re.sub('.+q=', '', trp_dump_lines[i])
			 Qatm[Imol, cnt] = re.sub(',.+', '', Qatm)

		 i += 1
		 for cnt in range(Natm[Imol]):
			 i += 1
			 Tatm  = re.sub('.+=.', '', trp_dump_lines[i])
			 Tatm[Imol, cnt]  = re.sub('..$', '', Tatm)

	if 'residue[:' in trp_dump_lines[i]:  # match  residue[
		nres += 1
		resN = re.sub('.*nr=', '', trp_dump_lines[i])
		resN = re.sub(',.*', '', resN)
		theRes = re.sub('.*="', '', trp_dump_lines[i])
		theRes = re.sub('".*', '', theRes)
		resName[nres] = resN + theRes  # sprintf("%05d%s", resN, theRes);
	i += 1

# line = '  moltype              = 0 "Protein_chain_A"'
# res = re.search('\s*moltype\s*=.*', line)
# if res is not None:
#     print(res.group())

#   end  part
	Ntot = 0
	Nidx = 0
	for i in range(Ntyp):
		for n in range(Nmol[i]):
			for j in range(Natm[i]):
				Ntot += 1
				if Ntot in ndxPro or Ntot in ndxLig:
					Nidx += 1
					if radType==0:
						radi = Ratm[i, j]
					if radType >0:
						radi=getRadi(Tatm[i, j], radType)
					print("%6d %9.5f %9.6f %6d %9.6f %9.6f %6d %s %s %-6s",
                          Nidx, Qatm[i,j], radi, Catm[i,j], Satm[i,j], Eatm[i,j],
                          Ntot, Name[i]"-"n+1"."j+1,resName[resID[i,j]], Tatm[i, j])
					if Ntot in ndxPro:
                        print "Pro"
                    elif Ntot in ndxLig:
                        print "Lig"
