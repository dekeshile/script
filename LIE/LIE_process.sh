#----------------------------------------------------------------------
#【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7B27/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------

# #【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7CH4/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------
# #【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7CH5/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------

# #【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7JMO/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------

# #【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7JMP/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------

# #【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7K8M/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------


#---------------------------------------------------------------------

#【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7BWJ/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #---------------------------------------------------------------------

# #---------------------------------------------------------------------

# #【配体单独模拟】后的能量提取
# cd /home/wurp/workspace/antibody/7E23/LIE
# echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact
# gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE_ligand.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

# #【复合物模拟】后的能量提取
# cd ..
# gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_energy.tpr -n index_LIE.ndx
# gmx mdrun -deffnm md_0_energy -rerun md_0_noPBC.xtc
# echo -e 21 22 | gmx energy -f md_0_energy.edr -b 2000

#---------------------------------------------------------------------


# ```
# cd /home/wurp/workspace/antibody/7B27/LIE 🉐
# cd /home/wurp/workspace/antibody/7CH4/LIE 🉐
# cd /home/wurp/workspace/antibody/7CH5/LIE 🉐

# cd /home/wurp/workspace/antibody/7JMO/LIE  🉐
# cd /home/wurp/workspace/antibody/7JMP/LIE 🉐
# cd /home/wurp/workspace/antibody/7JVA/LIE   只有LIE，不得其他模拟的数据
# cd /home/wurp/workspace/antibody/7K8M/LIE 🉐

# ```

# #做 index 文件
# ```
# gmx make_ndx -f md_1.gro -o index_LIE_ligand.ndx

# 1
# name 19 ligand
# 0 & !1
# name 20 environment
# q
# cd ..
# gmx make_ndx -n index.ndx -o index_LIE.ndx

# 0 & !20
# name 21 environment
# q
# ```


# pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")

# for  pdbId  in ${pdbIdArr[@]}
# do
#     cd /home/wurp/workspace/antibody/$pdbId/LIE
#     ################ MD with posres 带位置限制 ###############
#     gmx grompp -f ../../mdp/prod_posres.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1.tpr -r npt.gro
#     gmx mdrun -deffnm md_1 -pin on -ntmpi 1 -ntomp 6 -gpu_id 0 -pme gpu -update gpu -bonded gpu
# done



# pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")
# for  pdbId  in ${pdbIdArr[@]}
# do
#     #【配体单独模拟】后的能量提取
#     cd /home/wurp/workspace/antibody/$pdbId/LIE
#     echo -e 0 \n | gmx trjconv -s md_1.tpr  -f md_1.xtc -o md_1_noPBC.xtc -pbc mol -ur compact
#     gmx grompp -f ../../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1_energy.tpr -n index_LIE_ligand.ndx
#     gmx mdrun -deffnm md_1_energy -rerun md_1_noPBC.xtc

#     #【复合物模拟】后的能量提取
#     cd ..
#     echo -e 0 \n | gmx trjconv -s md_1.tpr  -f md_1.xtc -o md_1_noPBC.xtc -pbc mol -ur compact
#     gmx grompp -f ../mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1_energy.tpr -n index_LIE.ndx
#     gmx mdrun -deffnm md_1_energy -rerun md_1_noPBC.xtc
# done


# pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")
# for  pdbId  in ${pdbIdArr[@]}
# do
# {
#     mv /home/wurp/workspace/antibody/$pdbId/LIE/rmsd_md_0_noPBC_noPBC.xvg  /home/wurp/workspace/antibody/$pdbId/LIE/rmsd_md_0_noPBC.xvg
#     mv /home/wurp/workspace/antibody/$pdbId/LIE/rmsd_md_1_noPBC_noPBC.xvg /home/wurp/workspace/antibody/$pdbId/LIE/rmsd_md_1_noPBC.xvg
# } &
# done



{
    #【配体单独模拟】后的能量提取
     cd /home/wurp/workspace/antibody/7CH5/cutoff/LIE
    echo -e 0 \n | gmx trjconv -s md_1.tpr  -f md_1.xtc -o md_1_noPBC.xtc -pbc mol -ur compact
    echo -e 0 0 | gmx rms -s md_1.tpr  -f md_1.xtc -o rmsd_md_1_noPBC.xvg
    gmx grompp -f /home/wurp/workspace/antibody/mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1_energy.tpr -n index_LIE_ligand.ndx
    gmx mdrun -deffnm md_1_energy -rerun md_1_noPBC.xtc
}&

{
    #【复合物模拟】后的能量提取
     cd /home/wurp/workspace/antibody/7CH5/cutoff
     echo -e 0 \n | gmx trjconv -s md_1.tpr  -f md_1.xtc -o md_1_noPBC.xtc -pbc mol -ur compact
     echo -e 0 0 | gmx rms -s md_1.tpr  -f md_1.xtc -o rmsd_md_1_noPBC.xvg
    gmx grompp -f /home/wurp/workspace/antibody/mdp/LIE.mdp -c npt.gro -t npt.cpt -p topol.top -o md_1_energy.tpr -n index_LIE.ndx
    gmx mdrun -deffnm md_1_energy -rerun md_1_noPBC.xtc
}&
