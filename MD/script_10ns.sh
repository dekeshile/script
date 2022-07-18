# 2022/4/13
# usage:
# >chmod a+x script.sh
# >./script.sh path gpu_id 
# for example:
# /home/wurp/workspace/antibody/script/MD/script_10ns.sh  /home/wurp/workspace/antibody/variant/Omicron/7QNW-EY6A


#环境参数配置
mdp_dir="/home/wurp/PycharmProjects/BioUtil/gmx/mdp"

#从第一个参数获取抗体所在目录，判断目录是否存在
if [ ! -d $1 ]; then
    mkdir $1    
fi

cd $1

echo -e 2 \n | gmx pdb2gmx -f ../renum.pdb -o processed.gro -water tip3p -ignh

gmx editconf -f processed.gro -o newbox.gro -c -d 1.5 -bt cubic


# #################### EM 0 ######################
gmx grompp -f $mdp_dir/em_0.mdp -c newbox.gro -p topol.top -o em_0.tpr -maxwarn 2

gmx mdrun -v -deffnm em_0 

################## solvate ####################
gmx solvate -cp em_0.gro -cs spc216.gro -o solv.gro -p topol.top

gmx grompp -f $mdp_dir/ions.mdp -c solv.gro -p topol.top -o ions.tpr -maxwarn 1

echo -e 13 \n | gmx genion -s ions.tpr -o solv_ions.gro -p topol.top -pname NA -nname CL -neutral -conc 0.15
# 13 for SOL


#################  EM 1-3 ####################
gmx grompp -f $mdp_dir/em_1.mdp -c solv_ions.gro -p topol.top -o em_1.tpr -r solv_ions.gro

gmx mdrun -v -deffnm em_1 

gmx grompp -f $mdp_dir/em_2.mdp -c em_1.gro -p topol.top -o em_2.tpr 

gmx mdrun -v -deffnm em_2 

gmx grompp -f $mdp_dir/em_3.mdp -c em_2.gro -p topol.top -o em_3.tpr 

gmx mdrun -v -deffnm em_3 


################# Balance ####################
gmx grompp -f $mdp_dir/nvt.mdp -c em_3.gro -r em_3.gro -p topol.top -o nvt.tpr   -maxwarn 1

gmx mdrun -deffnm nvt -gpu_id 1 -pme gpu -update gpu -bonded gpu

gmx grompp -f $mdp_dir/npt.mdp -c nvt.gro -r nvt.gro -p topol.top -o npt.tpr  -maxwarn 1

gmx mdrun -deffnm npt -gpu_id 1  -pme gpu -update gpu -bonded gpu


################## MD 不带位置限制 ########################
gmx grompp -f $mdp_dir/prod.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0.tpr  -maxwarn 1

gmx mdrun -deffnm md_0 -ntmpi 1 -ntomp 6 -gpu_id 1 -pme gpu -update gpu -bonded gpu

