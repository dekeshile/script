# Automao -e 13 \n | e some time-consuming operations
# 2020/12/17
# usage:
# >chmod a+x script.sh
# >./script.sh

################### Pre Process ##################


# water: spce tip3p. select force field 2. count of atom*2 due to H

"""
# make index 
> echo -e chain H L & 1 \n  gmx make_ndx -f renum.pdb -o index.ndx

# generate weak constrain which used in constraining MD.
# 1. Copy posre_Protein_chain_X.itp and rename > posre100_chain_X.
# 2. Modify all force values from 1000 to 100 carefully, pay attention to 1000th atom if you use [change all] by text editor like VScode. 
# 3. Add following code at last line of each topol_Protein_chain_X.itp respectively  

; Include Prodution Position restraint file 
#ifdef POSRES100 
#include "posre100_chain_X.itp" 
#endif 

4. Modify following para at first line of interesting prod_posres.mdp  
define = -DPOSRES100  
"""

#从第二个参数获取需要运行的 gpu_id
gpu_id=$2

#从第一个参数获取抗体所在目录
cd $1


echo -e 2 \n | gmx pdb2gmx -f renum.pdb -o processed.gro -water tip3p

gmx editconf -f processed.gro -o newbox.gro -c -d 1.5 -bt cubic


#################### EM 0 ######################
gmx grompp -f /home/wurp/workspace/antibody/mdp/em_0.mdp -c newbox.gro -p topol.top -o em_0.tpr -maxwarn 1

gmx mdrun -v -deffnm em_0 -pin on -ntmpi 1 -ntomp 6 -gpu_id $gpu_id 


################## solvate ####################
gmx solvate -cp em_0.gro -cs spc216.gro -o solv.gro -p topol.top

gmx grompp -f /home/wurp/workspace/antibody/mdp/ions.mdp -c solv.gro -p topol.top -o ions.tpr -maxwarn 1

echo -e 13 \n | gmx genion -s ions.tpr -o solv_ions.gro -p topol.top -pname NA -nname CL -neutral -conc 0.15
# 13 for SOL


#################  EM 1-3 ####################
gmx grompp -f /home/wurp/workspace/antibody/mdp/em_1.mdp -c solv_ions.gro -p topol.top -o em_1.tpr -r solv_ions.gro

gmx mdrun -v -deffnm em_1 -pin on -ntmpi 1 -ntomp 6 -gpu_id $gpu_id  

gmx grompp -f /home/wurp/workspace/antibody/mdp/em_2.mdp -c em_1.gro -p topol.top -o em_2.tpr 

gmx mdrun -v -deffnm em_2 -pin on -ntmpi 1 -ntomp 6 -gpu_id $gpu_id 

gmx grompp -f /home/wurp/workspace/antibody/mdp/em_3.mdp -c em_2.gro -p topol.top -o em_3.tpr 

gmx mdrun -v -deffnm em_3 -pin on -ntmpi 1 -ntomp 6 -gpu_id $gpu_id 


################# Balance ####################
gmx grompp -f /home/wurp/workspace/antibody/mdp/nvt.mdp -c em_3.gro -r em_3.gro -p topol.top -o nvt.tpr 

gmx mdrun -deffnm nvt -pin on -ntmpi 1 -ntomp 6  -pme gpu -update gpu -bonded gpu -gpu_id $gpu_id

gmx grompp -f /home/wurp/workspace/antibody/mdp/npt.mdp -c nvt.gro -r nvt.gro -p topol.top -o npt.tpr

gmx mdrun -deffnm npt  -pin on -ntmpi 1 -ntomp 6 -pme gpu -update gpu -bonded gpu -gpu_id $gpu_id 


################ MD with posres 带位置限制 ###############
gmx grompp -f /home/wurp/workspace/antibody/mdp/prod_posres.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1.tpr -r npt.gro

# gmx mdrun -deffnm md_1 -pin on -ntmpi 1 -ntomp 6 -gpu_id 2 -pme gpu -npme 1 -update gpu -bonded gpu
gmx mdrun -deffnm md_1 -pin on -ntmpi 1 -ntomp 6  -pme gpu -update gpu -bonded gpu -gpu_id $gpu_id


################## MD 不带位置限制 ########################
# gmx grompp -f /home/wurp/workspace/antibody/mdp/prod.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0.tpr

# gmx mdrun -deffnm md_0 -pin on -ntmpi 1 -ntomp 6  -pme gpu -update gpu -bonded gpu -gpu_id $gpu_id


-rerun -f xtc  -> xtc 

