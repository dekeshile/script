# !/bin/bash
#不带限制的20ns
#2021-7-27 22:17 重新计算，之前 -e 填错了
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7E23/mmpbsa/no_restrain  -f  ../../md_0.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 2000 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMO/mmpbsa/no_restrain  -f  ../../md_0.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 2000 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMP/mmpbsa/no_restrain  -f  ../../md_0.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 2000 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7K8M/mmpbsa/no_restrain  -f  ../../md_0.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 2000 -e 10000 -i 500

# # 平均结构的也重算一遍
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7E23/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMO/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMP/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7K8M/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500


# #MostFrequent 
# #7E23 0.25-0.26   7JMO 0.46-0.47   7JMP 0.22-0.23  7K8M 0.27-0.28
# cd  /home/wurp/workspace/antibody/7E23
# echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# gmx trjconv -f md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder 0.25 -dropover 0.26  

# cd  /home/wurp/workspace/antibody/7JMO
# echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# gmx trjconv -f md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder 0.46 -dropover 0.47  

# cd  /home/wurp/workspace/antibody/7JMP
# echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# gmx trjconv -f md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder 0.22 -dropover 0.23  

# cd  /home/wurp/workspace/antibody/7K8M
# echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s npt.gro -o rmsd_norestrain_noPBC.xvg
# gmx trjconv -f md_0_noPBC.xtc  -o rmsdMostFre_md_0_noPBC.xtc -drop rmsd_norestrain_noPBC.xvg -dropunder 0.27 -dropover 0.28  


# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7E23/mmpbsa/rmsdFre_no_restrain  -f  ../../rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMO/mmpbsa/rmsdFre_no_restrain  -f  ../../rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMP/mmpbsa/rmsdFre_no_restrain  -f  ../../rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7K8M/mmpbsa/rmsdFre_no_restrain  -f  ../../rmsdMostFre_md_0_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 500

#-----------------前面的都正常计算完了，现在要把MMPBSA的结果提取出来
# 7E23  7JMO   7JMP   7K8M

#-----------------------------------------------------------------------------------------------------------------
#pdbId="7E23"
# mmpbsaResultFile=/home/wurp/workspace/antibody/mmpbsaResult.txt

# pdbIdArr=("7E23" "7JMO" "7JMP" "7K8M")

# for  pdbId  in ${pdbIdArr[@]}
# do
#     TdS_no_restrain=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | grep "TdS" | awk '{print $3}'`
#     MMPBSA_no_restrain=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | grep "dG" | awk '{print $7}' | cut -d ')' -f 1`

#     mean_nearAverage=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/_pid~MMPBSA.dat | grep "mean" | awk '{print $3}'`
#     MMPBSA_nearAverage=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/_pid~MMPBSA.dat | grep "dG" | awk '{print $7}' | cut -d ')' -f 1` 
#     MMPBSA_nearAverage_TdS_no_restrain=$(echo "scale=3; ($mean_nearAverage+($TdS_no_restrain))/4.184" | bc)

#     mean_mostFre=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/rmsdFre_no_restrain/_pid~MMPBSA.dat | grep "mean" | awk '{print $3}'`
#     MMPBSA_mostFre=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/rmsdFre_no_restrain/_pid~MMPBSA.dat | grep "dG" | awk '{print $7}' | cut -d ')' -f 1` 
#     MMPBSA_mostFre_TdS_no_restrain=$(echo "scale=3; ($mean_mostFre+($TdS_no_restrain))/4.184" | bc)


#     echo "---------------------------------   $pdbId   -------------------------------------------------------"
#     echo "MMPBSA_no_restrain = ${MMPBSA_no_restrain}"
#     echo "MMPBSA_nearAverage = ${MMPBSA_nearAverage}"
    
#     echo "MMPBSA_nearAverage_TdS_no_restrain = ($mean_nearAverage+($TdS_no_restrain))/4.184 = ${MMPBSA_nearAverage_TdS_no_restrain}"
   
#     echo "MMPBSA_mostFre = ${MMPBSA_mostFre}"
    
#     echo "MMPBSA_mostFre_TdS_no_restrain = ($mean_mostFre+($TdS_no_restrain))/4.184 = ${MMPBSA_mostFre_TdS_no_restrain}"
#     echo -e "\n"
# done
#-----------------------------------------------------------------------------------------------------------------


# pdbIdArr=("6ZBP" "7CH4" "7CH5" "7E23" "7JMO" "7JMP")

# for  pdbId  in ${pdbIdArr[@]}
# do
#     rm -f /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/*
#    /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 100
# done

# for  pdbId  in ${pdbIdArr[@]}
# do
#     TdS_no_restrain=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | grep "TdS" | awk '{print $3}'`

#     mean_nearAverage=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/_pid~MMPBSA.dat | grep "mean" | awk '{print $3}'`
#     MMPBSA_nearAverage=`cat  /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/_pid~MMPBSA.dat | grep "dG" | awk '{print $7}' | cut -d ')' -f 1` 
#     MMPBSA_nearAverage_TdS_no_restrain=$(echo "scale=3; ($mean_nearAverage+($TdS_no_restrain))/4.184" | bc)

#     echo "---------------------------------   $pdbId   -------------------------------------------------------"
    
#     echo "MMPBSA_nearAverage = ${MMPBSA_nearAverage}"
#     echo "MMPBSA_nearAverage_TdS_no_restrain = ($mean_nearAverage+($TdS_no_restrain))/4.184 = ${MMPBSA_nearAverage_TdS_no_restrain}"
#     echo -e "\n"
# done

#     rm -f /home/wurp/workspace/antibody/7JMP/mmpbsa/nearAverage/*
#    /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMP/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 50

# rm -f /home/wurp/workspace/antibody/7CH4/mmpbsa/nearAverage/*
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7CH4/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 20

# rm -f /home/wurp/workspace/antibody/7CH5/mmpbsa/nearAverage/*
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7CH5/mmpbsa/nearAverage  -f  ../../nearAverage_noPBC.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 20


# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7CH4/cutoff/mmpbsa/restrain  -f  /home/wurp/workspace/antibody/7CH4/cutoff/md_1.xtc  -s  /home/wurp/workspace/antibody/7CH4/cutoff/md_1.tpr  -n  /home/wurp/workspace/antibody/7CH4/cutoff/index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 2000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7JMP/cutoff/mmpbsa/restrain  -f  /home/wurp/workspace/antibody/7JMP/cutoff/md_1.xtc  -s  /home/wurp/workspace/antibody/7JMP/cutoff/md_1.tpr  -n  /home/wurp/workspace/antibody/7JMP/cutoff/index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 2000 -i 500
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/7CH5/cutoff/mmpbsa/restrain  -f  /home/wurp/workspace/antibody/7CH5/cutoff/md_1.xtc  -s  /home/wurp/workspace/antibody/7CH5/cutoff/md_1.tpr  -n  /home/wurp/workspace/antibody/7CH5/cutoff/index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 2000 -i 500


pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
for  pdbId  in ${pdbIdArr[@]}
do
  cd /home/wurp/workspace/antibody/$pdbId/mmpbsa/restrain
  rm -rf *
 /home/wurp/workspace/antibody/gmx_mmpbsa_dir_seq.sh   -dir /home/wurp/workspace/antibody/$pdbId/mmpbsa/restrain  -f  ../../md_1.xtc  -s  ../../md_1.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 2000 -i 200
# /home/wurp/workspace/antibody/gmx_mmpbsa_dir_seq.sh   -dir /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain  -f  ../../md_0.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 2000 -e 10000 -i 500
done


# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# for  pdbId  in ${pdbIdArr[@]}
# do
#   /home/wurp/workspace/antibody/gmx_mmpbsa_dir.sh  -dir /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain  -f  ../../md_0.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 2000 -e 10000 -i 500
# done


# #  /home/wurp/workspace/antibody/queue_MMPBSA.sh

