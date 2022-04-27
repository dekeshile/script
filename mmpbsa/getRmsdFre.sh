# mostFrequent的流程
#/home/wurp/workspace/antibody/getRmsdFre.sh

# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")


# cd  /home/wurp/workspace/antibody/7RAL  

# #vmd 同时载入  md_0_noPBC.xtc npt.gro 
# vmd md_0_noPBC.xtc npt.gro 
# #vmd 命令行执行：将gro文件转为pdb
# [atomselect top backbone] writepdb npt_backbone.pdb
# #将xtc文件转为dcd
# animate write dcd md_0_noPBC_backbone.dcd sel [atomselect top backbone]

# #将下列写入脚本文件getRmsdFre.sh 中,然后命令行执行
# #  R  -f /home/wurp/workspace/antibody/getRmsdFre.sh   --no-save  -q

# library(bio3d)
# args <- commandArgs(T)
# dcd <- read.dcd("/home/wurp/workspace/antibody/7R7N/md_0_noPBC_backbone.dcd")
# pdb <- read.pdb("/home/wurp/workspace/antibody/7R7N/npt_backbone.pdb")
# ca.inds <- atom.select(pdb,"backbone")
# xyz <- fit.xyz(fixed=pdb$xyz, mobile=dcd,fixed.inds=ca.inds$xyz, mobile.inds=ca.inds$xyz)
# rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
# png(file="rmsd_fre.png")
# hist(rd, breaks=40, xlab="RMSD (Å)", main="Histogram of RMSD")
# dev.off()

# #抽取频率最高的建立一个新的轨迹文件  
# #7E23 0.25-0.26   7JMO 0.46-0.47   7JMP 0.22-0.23  7K8M 0.27-0.28
# cd  /home/wurp/workspace/antibody/7E23
# echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# gmx trjconv -f md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder 0.25 -dropover 0.26  
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7E23/mmpbsa/no_restrain  -f  ../../rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500


# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# for pdbId in ${pdbIdArr[@]}
# do 
#     cd  /home/wurp/workspace/antibody/$pdbId
#     echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# done


#抽取频率最高的建立一个新的轨迹文件  
#7E23 0.25-0.26   7JMO 0.46-0.47   7JMP 0.22-0.23  7K8M 0.27-0.28
# cd  /home/wurp/workspace/antibody/7E23
# echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# gmx trjconv -f md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder 0.25 -dropover 0.26  
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7E23/mmpbsa/no_restrain  -f  ../../rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500


declare -A arr=(["6W41_0"]=0.14 ["6W41_1"]=0.16  \
    ["6YMO_0"]=0.22 ["6YMO_1"]=0.23  \
    ["6ZER_0"]=0.23 ["6ZER_1"]=0.24  \
    ["7B3O_0"]=0.13 ["7B3O_1"]=0.14  \
    ["7C01_0"]=0.15 ["7C01_1"]=0.16  \
    ["7CM4_0"]=0.14 ["7CM4_1"]=0.16  \
    ["7DEO_0"]=0.24 ["7DEO_1"]=0.25  \
    ["7DET_0"]=0.16 ["7DET_1"]=0.165  \
    ["7DEU_0"]=0.21 ["7DEU_1"]=0.22  \
    ["7JMW_0"]=0.25 ["7JMW_1"]=0.26  \
    ["7JVB_0"]=0.16 ["7JVB_1"]=0.17  \
    ["7LRS_0"]=0.28 ["7LRS_1"]=0.29  \
    ["7MLZ_0"]=0.46 ["7MLZ_1"]=0.48  \
    ["7R7N_0"]=0.19 ["7R7N_1"]=0.195  \
    ["7RAL_0"]=0.18 ["7RAL_1"]=0.19  
)

#pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
pdbIdArr=("6W41" "6YMO" "6ZER")
for pdbId in ${pdbIdArr[@]}
do 
    cd  /home/wurp/workspace/antibody/$pdbId/mmpbsa/rmsdFre_no_restrain
  #  echo -e 4 4 | gmx rms -f ../../md_0_noPBC.xtc -s ../../npt.gro -o rmsd_norestrain_noPBC.xvg
  #  gmx trjconv -f ../../md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder  ${arr[$pdbId'_0']}  -dropover  ${arr[$pdbId'_1']}  
   /home/wurp/workspace/antibody/gmx_mmpbsa_dir_seq.sh   -dir /home/wurp/workspace/antibody/$pdbId/mmpbsa/rmsdFre_no_restrain  -f  rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 300

done


