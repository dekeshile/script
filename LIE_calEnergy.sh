#批量计算 LIE的结果
a=0.288  #0.288
b=-0.049 #-0.049
y=-5.880


#回归模型的系数为：[ 0.00033907 -0.00026755],截距为：-10.769537605738178


# a=0.18
# b=0.5
# y=0

#清空文件
LIE_result_collect=/home/wurp/workspace/antibody/LIE_result.txt
echo > $LIE_result_collect

#pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5" "7E23" "7JMO" "7JMP" "7K8M")

pdbIdArr=("7CH4" "7CH5" "7JMP")


# for  pdbId  in ${pdbIdArr[@]}
# do
#     eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/$pdbId/LIE/md_0_energy.edr -b 2000`
#     row=`echo $eneReturn | grep -o  'Coul-SR.*'`
#     ligand_coul=` echo $row | awk '{print $2}'`
#     ligand_LJ=` echo $row | awk '{print $8}'`

#     eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/$pdbId/md_0_energy.edr -b 2000`
#     row=`echo $eneReturn | grep -o  'Coul-SR.*'`
#     complex_coul=` echo $row | awk '{print $2}'`
#     complex_LJ=` echo $row | awk '{print $8}'`

#     result=$(echo "scale=3; ($a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))+($y))/4.184" | bc)
#     diff_vdw=$(echo "scale=3; $complex_LJ-($ligand_LJ)" | bc)
#     diff_cou=$(echo "scale=3; $complex_coul-($ligand_coul)" | bc)

#     echo "############# $pdbId  LIE result #######################################" >> $LIE_result_collect
#     echo "diff_vdw = $diff_vdw            diff_cou = $diff_cou  "  >> $LIE_result_collect
#     echo "($a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))+($y))/4.184" >> $LIE_result_collect
#     echo $result >> $LIE_result_collect
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/worksp
index=0

for  pdbId  in ${pdbIdArr[@]}
do
{
    #/home/wurp/workspace/antibody/$pdbId/LIE/md_1_energy.edr
    eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/$pdbId/cutoff/LIE/md_1_energy.edr`
    row=`echo $eneReturn | grep -o  'Coul-SR.*'`
    ligand_coul=` echo $row | awk '{print $2}'`
    ligand_LJ=` echo $row | awk '{print $8}'`

    #/home/wurp/workspace/antibody/$pdbId/md_1_energy.edr
    eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/$pdbId/cutoff/md_1_energy.edr`
    row=`echo $eneReturn | grep -o  'Coul-SR.*'`
    complex_coul=` echo $row | awk '{print $2}'`
    complex_LJ=` echo $row | awk '{print $8}'`

    result=$(echo "scale=3; ($a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))+($y))/4.184" | bc)

    complex_LJ_kcal=$(echo "scale=1; $complex_LJ/4.184" | bc)
    ligand_LJ_kcal=$(echo "scale=1; $ligand_LJ/4.184" | bc)
    complex_coul_kcal=$(echo "scale=1; $complex_coul/4.184" | bc)
    ligand_coul_kcal=$(echo "scale=1; $ligand_coul/4.184" | bc)
    
    diff_vdw=$(echo "scale=3; $complex_LJ-($ligand_LJ)" | bc)
    diff_cou=$(echo "scale=3; $complex_coul-($ligand_coul)" | bc)

    echo "----------------------  $pdbId --------------------------------------- "  >> $LIE_result_collect
    echo "Vvdw_b = $complex_LJ_kcal   Vvdw_f = $ligand_LJ_kcal   Velec_b = $complex_coul_kcal  Velec_f = $ligand_coul_kcal " >> $LIE_result_collect
    echo "diff_vdw = $diff_vdw            diff_cou = $diff_cou  "  >> $LIE_result_collect
    echo "($a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))+($y))/4.184" >> $LIE_result_collect
    echo $result >> $LIE_result_collect
    echo  -e "\n"
    result_arr[$index]=$result
    index=$((index+1))
} 
done

echo -n "["  >> $LIE_result_collect
for per in ${result_arr[@]}
do
    echo -n "$per,"  >> $LIE_result_collect
done
echo    "]"  >> $LIE_result_collect

rm -f /home/wurp/workspace/antibody/\#*



# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/6YZ5/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/6YZ5/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 6YZ5  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/6ZBP/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/6ZBP/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 6ZBP  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7B27/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7B27/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7B27  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7BWJ/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7BWJ/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7BWJ  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7CH4/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7CH4/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7CH4  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7CH5/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7CH5/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7CH5  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7E23/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7E23/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7E23  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"              
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7JMO/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7JMO/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7JMO  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7JMP/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7JMP/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7JMP  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7K8M/LIE/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# ligand_coul=` echo $row | awk '{print $2}'`
# ligand_LJ=` echo $row | awk '{print $8}'`

# eneReturn=`echo -e 21 22 | gmx energy -f /home/wurp/workspace/antibody/7K8M/md_0_energy.edr -b 2000`
# row=`echo $eneReturn | grep -o  'Coul-SR.*'`
# complex_coul=` echo $row | awk '{print $2}'`
# complex_LJ=` echo $row | awk '{print $8}'`

# result=$(echo "scale=3; $a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" | bc)

# echo "############# 7K8M  LIE result #######################################" >> $LIE_result_collect
# echo "$a*($complex_LJ-($ligand_LJ))+($b)*($complex_coul-($ligand_coul))/4.18585+($y)" >> $LIE_result_collect
# echo $result >> $LIE_result_collect
# echo  -e "\n"
# #-------------------------------------------------------------------------------------------------------------
