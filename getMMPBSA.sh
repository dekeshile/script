
#命令行执行 
#/home/wurp/workspace/antibody/getMMPBSA.sh


#获取 restrain 里各个_pid~MMPBSA.dat里面的值
#pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")
# echo "------------------------ restrain  MMPBSA -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     dE=`grep -o 'mean.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     dE=$(echo "scale=3; ($dE)/4.184" | bc)
#     TdS=`grep -o 'TdS.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     TdS=$(echo "scale=3; ($TdS)/4.184" | bc)
#     str=`grep -o 'dG.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/restrain/_pid~MMPBSA.dat | awk '{print $7}'`
#     dG=${str%)*}
#     echo "pdbId     dE      -TdS        dG"
#     echo "$pdbId    $dE     $TdS       $dG"
# done


#获取 no_restrain 里各个_pid~MMPBSA.dat里面的值
# pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4" "7CH5"  "7E23" "7JMO" "7JMP" "7K8M")
# echo "------------------------ no_restrain  MMPBSA -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     dE=`grep -o 'mean.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     dE=$(echo "scale=3; ($dE)/4.184" | bc)
#     TdS=`grep -o 'TdS.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     TdS=$(echo "scale=3; ($TdS)/4.184" | bc)
#     str=`grep -o 'dG.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | awk '{print $7}'`
#     dG=${str%)*}
#     echo "pdbId     dE      -TdS        dG"
#     echo "$pdbId    $dE     $TdS       $dG"
# done

# 获取 nearAverage 里各个_pid~MMPBSA.dat里面的值
# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# echo "------------------------ nearAverage  MMPBSA -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     str=`grep -o 'dG.*'  /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/_pid~MMPBSA.dat | awk '{print $7}'`
#     res=${str%)*}
#     echo "$pdbId  $res"
# done

#获取 mmpbsa_nearAverage_no_restrain_TdS 里各个_pid~MMPBSA.dat里面的值
# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# echo "------------------------ mmpbsa_nearAverage_no_restrain_TdS -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     nearAverage_mean=`grep -o 'mean.*'  /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage/_pid~MMPBSA.dat | awk '{print $3}'`
#     no_restrain_TdS=`grep -o 'TdS.*'  /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     mmpbsa_nearAverage_no_restrain_TdS=$(echo "scale=3; ($nearAverage_mean + $no_restrain_TdS)/4.184" | bc)
#     echo $pdbId 
#     echo  "($nearAverage_mean + $no_restrain_TdS)/4.184"
#     echo $mmpbsa_nearAverage_no_restrain_TdS
# done


#获取 mostFrequency 里各个_pid~MMPBSA.dat里面的值
#pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# pdbIdArr=("7CH4" "7E23" "7CH5" "7BWJ" "7B27" "6ZBP" "7JMP" "7K8M" "6YZ5" "7JMO")
# echo "------------------------ rmsdFre_no_restrain  MMPBSA -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     str=`grep -o 'dG.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/rmsdFre_no_restrain/_pid~MMPBSA.dat | awk '{print $7}'`
#     dG=${str%)*}
#     rmsdFre_no_restrain_mean=`grep -o 'mean.*' /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/rmsdFre_no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     mean_kcal=$(echo "scale=3; $rmsdFre_no_restrain_mean/4.184" | bc)
#     this_TdS=`grep -o 'TdS.*'  /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/mmpbsa/rmsdFre_no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     this_TdS_kcal=$(echo "scale=3; $no_restrain_TdS/4.184" | bc)
#     echo "$pdbId  $mean_kcal $this_TdS_kcal $dG"
# done

# #获取 mmpbsa_rmsdFre_no_restrain_TdS 里各个_pid~MMPBSA.dat里面的值
# pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
# echo "------------------------ mmpbsa_rmsdFre_no_restrain_TdS -------------------------------------"
# for  pdbId  in ${pdbIdArr[@]}
# do
#     rmsdFre_no_restrain_mean=`grep -o 'mean.*'  /home/wurp/workspace/antibody/$pdbId/mmpbsa/rmsdFre_no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     mean_kcal=$(echo "scale=3; $rmsdFre_no_restrain_mean/4.184" | bc)
#     no_restrain_TdS=`grep -o 'TdS.*'  /home/wurp/workspace/antibody/$pdbId/mmpbsa/no_restrain/_pid~MMPBSA.dat | awk '{print $3}'`
#     TdS_kcal=$(echo "scale=3; $no_restrain_TdS/4.184" | bc)
#     mmpbsa_rmsdFre_no_restrain_TdS=$(echo "scale=3; ($rmsdFre_no_restrain_mean + $no_restrain_TdS)/4.184" | bc)
#     echo "$pdbId  $mean_kcal $TdS_kcal $mmpbsa_rmsdFre_no_restrain_TdS"
# done

fileName='/media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/water_restrain_100pFrame_pdie4.txt'
pdbIdArr=("7CH4" "7E23" "7CH5" "7BWJ" "7B27" "6ZBP" "7JMP" "7K8M" "6YZ5" "7JMO")
#pdbIdArr=("6YZ5" "6ZBP" "7B27" "7BWJ" "7CH4")
echo "------------------------ MMPBSA water 100ps/per frame ,其中蛋白质界电常数：4 -------------------------------------"  >> $fileName
for  pdbId  in ${pdbIdArr[@]}
do
    echo "" >> $fileName
    echo "---------------------- $pdbId -------------------------------------" >> $fileName
    python ~/workspace/antibody/BioUtil/gmx/pygmx/plot_short_time_.py /media/wurp/ecf295dd-0b34-458b-b926-e61406f8c26a/$pdbId/water_restrain >>  $fileName
done
