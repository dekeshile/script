#从第一个参数获取抗体所在目录
cd $1

#从第二个参数获取需要运行的 gpu_id
gpu_id=$2

# water: spce tip3p. select force field 2. count of atom*2 due to H
echo -e 2 \n | gmx pdb2gmx -f renum.pdb -o processed.gro -water tip3p


# gmx editconf -f processed.gro -o newbox.gro -center 14 12.5 15 -box 24 24 45
gmx editconf -f processed.gro -o newbox.gro -c -d 1.5 -bt cubic


#################### EM 0 ######################
gmx grompp -f ../../mdp/em_0.mdp -c newbox.gro -p topol.top -o em_0.tpr -maxwarn 1

gmx mdrun -v -deffnm em_0 -pin on -ntmpi 1 -ntomp 6 -gpu_id 0


################## solvate ####################
# gmx solvate -cp newbox.gro -cs spc216.gro -o solv.gro -p topol.top
gmx solvate -cp em_0.gro -cs spc216.gro -o solv.gro -p topol.top

gmx grompp -f ../../mdp/ions.mdp -c solv.gro -p topol.top -o ions.tpr -maxwarn 1

echo -e 13 \n | gmx genion -s ions.tpr -o solv_ions.gro -p topol.top -pname NA -nname CL -neutral -conc 0.15
# 13 for SOL


#################  EM 1-3 ####################
gmx grompp -f ../../mdp/em_1.mdp -c solv_ions.gro -p topol.top -o em_1.tpr -r solv_ions.gro

gmx mdrun -v -deffnm em_1 -pin on -ntmpi 1 -ntomp 6 -gpu_id 0 

gmx grompp -f ../../mdp/em_2.mdp -c em_1.gro -p topol.top -o em_2.tpr 

gmx mdrun -v -deffnm em_2 -pin on -ntmpi 1 -ntomp 6 -gpu_id 0

gmx grompp -f ../../mdp/em_3.mdp -c em_2.gro -p topol.top -o em_3.tpr 

gmx mdrun -v -deffnm em_3 -pin on -ntmpi 1 -ntomp 6 -gpu_id 0


################# Balance ####################
gmx grompp -f ../../mdp/nvt.mdp -c em_3.gro -r em_3.gro -p topol.top -o nvt.tpr 

gmx mdrun -deffnm nvt -pin on -ntmpi 1 -ntomp 6 -gpu_id 0 -pme gpu -update gpu -bonded gpu

gmx grompp -f ../../mdp/npt.mdp -c nvt.gro -r nvt.gro -p topol.top -o npt.tpr

gmx mdrun -deffnm npt  -pin on -ntmpi 1 -ntomp 6 -gpu_id 0 -pme gpu -update gpu -bonded gpu


################## MD 10ns 不带位置限制 ########################
gmx grompp -f ../../mdp/prod.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0.tpr

gmx mdrun -deffnm md_0 -pin on -ntmpi 1 -ntomp 6 -gpu_id 0 -pme gpu -update gpu -bonded gpu

