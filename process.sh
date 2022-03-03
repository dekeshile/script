#!/bin/bash
# /home/wurp/workspace/antibody/process.sh

# #得到 schlitter的熵
# pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")

# for  pdbId  in ${pdbIdArr[@]}
# do
#     cd /home/wurp/workspace/antibody/$pdbId
#     echo -e 0 0 | gmx trjconv -f md_0_noPBC.xtc -s  md_0.tpr  -o  md_0_noPBC_fit.xtc -fit rot+trans
#     echo -e 4 4 | gmx covar -s md_0.tpr -f md_0_noPBC_fit.xtc -o eigenvalues.xvg -v eigenvectors.trr
#     echo -e 4 4 | gmx anaeig -s md_0.tpr -f md_0_noPBC_fit.xtc   -eig eigenvalues.xvg -v eigenvectors.trr -entropy yes
# done



# pdb转gro，处理porse100 
# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# pdbIdArr=("7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# for  pdbId  in ${pdbIdArr[@]}
# do
#     cd /home/wurp/workspace/antibody/$pdbId

#     echo -e 2 \n | gmx pdb2gmx -f renum.pdb -o processed.gro -water tip3p -ignh

#     porseReturn=$(ls -d posre*)
#     array=(${porseReturn// / })

#     for porseFile in ${array[@]}
#     do 
#         chain=${porseFile:20:1}
#         awk -F " " '{if ($3==1000) $3=100}{if ($4==1000) $4=100}{if ($5==1000) $5=100}1' posre_Protein_chain_$chain.itp  > posre100_chain_$chain.itp

#         echo  "#ifdef POSRES100"  >> topol_Protein_chain_$chain.itp
#         echo  "#include 'posre100_chain_${chain}.itp'"  >> topol_Protein_chain_$chain.itp
#         echo  '#endif'  >> topol_Protein_chain_$chain.itp

#     done

# done



# /home/wurp/workspace/antibody/script.sh /home/wurp/workspace/antibody/6W41  0
# /home/wurp/workspace/antibody/script.sh /home/wurp/workspace/antibody/6YMO  1 

# zhoulei老师的机器上
# /home/lzlab/wurp/script.sh /home/lzlab/wurp/7C01  0
# /home/lzlab/wurp/script.sh /home/lzlab/wurp/7CM4  1 


#  waterCompute---------------------------------------------------------------

# anti_l = int(sys.argv[3])
# anti_r = int(sys.argv[4])
# RBD_l = int(sys.argv[5])
# RBD_r = int(sys.argv[6])

#7B27= 
# 7BWJ_arr=(195 636 1 194)
# 7CH5_arr=(1 424 425 607)
# 7E23_arr=(195 403 1 194)
# 7JMO_arr=(194 622 1 193)
# 7JMP_arr=(253 867 1 165)
# 7K8M_arr=(1 428 429 612)


# declare -A arr=(["7BWJ_0"]=195 ["7BWJ_1"]=636 ["7BWJ_2"]=1 ["7BWJ_3"]=194 \
# ["7CH5_0"]=1 ["7CH5_1"]=424 ["7CH5_2"]=425 ["7CH5_3"]=607 \
# ["7E23_0"]=195 ["7E23_1"]=403 ["7E23_2"]=1 ["7E23_3"]=194 \
# ["7JMO_0"]=194 ["7JMO_1"]=622 ["7JMO_2"]=1 ["7JMO_3"]=193 \
# ["7JMP_0"]=253 ["7JMP_1"]=867 ["7JMP_2"]=1 ["7JMP_3"]=165 \
# ["7K8M_0"]=1 ["7K8M_1"]=428 ["7K8M_2"]=429 ["7K8M_3"]=612 \
# )


# pdbIdArr=("7BWJ" "7CH5" "7E23" "7JMO" "7JMP" "7K8M")
# echo "------------------------ waterCompute  MMPBSA -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     cd /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/waterCompute
#     python /home/wurp/workspace/antibody/BioUtil/gromacs/pygmx/short_time_hoh.py  ../md_0.tpr  ../md_0_noPBC.xtc \
#     ${arr[$pdbId'_0']} ${arr[$pdbId'_1']} ${arr[$pdbId'_2']}   ${arr[$pdbId'_3']}
# done




# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# for pdbId in ${pdbIdArr[@]}
# do 
#     cd  /home/wurp/workspace/antibody/$pdbId
#     R  -f   --no-save  -q /home/wurp/workspace/antibody/getRmsdFre.sh $pdbId
# done

# cd /home/wurp/workspace/antibody/6W41
# cd /home/wurp/workspace/antibody/6YMO
# cd /home/wurp/workspace/antibody/6ZER
# cd /home/wurp/workspace/antibody/7B3O
# cd /home/wurp/workspace/antibody/7C01
# cd /home/wurp/workspace/antibody/7CM4
# cd /home/wurp/workspace/antibody/7DEO
# cd /home/wurp/workspace/antibody/7DET
# cd /home/wurp/workspace/antibody/7DEU
# cd /home/wurp/workspace/antibody/7JMW
# cd /home/wurp/workspace/antibody/7JVB
# cd /home/wurp/workspace/antibody/7LRS
# cd /home/wurp/workspace/antibody/7MLZ
#  cd /home/wurp/workspace/antibody/7R7N
# cd /home/wurp/workspace/antibody/7RAL

#antibody  RBD
declare -A arr=(["6YZ5_0"]=196 ["6YZ5_1"]=322 ["6YZ5_2"]=1 ["6YZ5_3"]=195 \
["6ZBP_0"]=196 ["6ZBP_1"]=323 ["6ZBP_2"]=1 ["6ZBP_3"]=195 \
["7B27_0"]=203 ["7B27_1"]=327 ["7B27_2"]=1 ["7B27_3"]=202 \
["7BWJ_0"]=195 ["7BWJ_1"]=636 ["7BWJ_2"]=1 ["7BWJ_3"]=194 \
["7CH4_0"]=1 ["7CH4_1"]=431 ["7CH4_2"]=432 ["7CH4_3"]=619 \
["7CH5_0"]=1 ["7CH5_1"]=424 ["7CH5_2"]=425 ["7CH5_3"]=607 \
["7E23_0"]=195 ["7E23_1"]=404 ["7E23_2"]=1 ["7E23_3"]=194 \
["7JMO_0"]=194 ["7JMO_1"]=622 ["7JMO_2"]=1 ["7JMO_3"]=193 \
["7JMP_0"]=253 ["7JMP_1"]=867 ["7JMP_2"]=1 ["7JMP_3"]=165 \
["7K8M_0"]=1 ["7K8M_1"]=428 ["7K8M_2"]=429 ["7K8M_3"]=612 
)


#pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")
#pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4")
pdbIdArr=("7CH5"  "7E23" "7JMO" "7JMP" "7K8M")
for pdbId in ${pdbIdArr[@]}
do 
    cd /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/water_restrain
    python ~/workspace/antibody/BioUtil/gromacs/pygmx/short_time_hoh.py  ../md_1.tpr  ../md_1_noPBC.xtc  \
    ${arr[$pdbId'_0']} ${arr[$pdbId'_1']} ${arr[$pdbId'_2']}   ${arr[$pdbId'_3']}
done

 cd /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/7K8M/water_restrain
python ~/workspace/antibody/BioUtil/gmx/pygmx/short_time_hoh.py  ../md_1.tpr  ../md_1_noPBC.xtc  1  428 429 612 
