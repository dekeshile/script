
#pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")

pdbIdArr=("6W41" "6YMO" "6ZER" "7B3O" "7C01" "7CM4"  "7DEO" "7DET" "7DEU" "7JMW" "7JVB" "7LRS" "7MLZ" "7R7N" "7RAL")
for  pdbId  in ${pdbIdArr[@]}
do
    cd /home/wurp/workspace/antibody/$pdbId

    #轨迹要先周期化处理之后，再来算rmsd
    echo -e 0 \n | gmx trjconv -s md_0.tpr  -f md_0.xtc -o md_0_noPBC.xtc -pbc mol -ur compact

    #用md_0_noPBC.xtc来计算平均结构,选 backbone
    echo -e 4 \n | gmx rmsf -f md_0_noPBC.xtc -s md_0.tpr -ox md_0_average_noPBC.pdb
    #使用平均结构作为参考，算轨迹与平均结构的RMSD
    echo -e 4 4 | gmx rms -f md_0_noPBC.xtc -s md_0_average_noPBC.pdb -o rmsd_vs_average_noPBC.xvg

    #生成排好序的rmsd,然后取前1000帧
    python  /home/wurp/workspace/antibody/xvgReorder.py  /home/wurp/workspace/antibody/$pdbId/rmsd_vs_average_noPBC.xvg
    begin=`awk 'NR==1' /home/wurp/workspace/antibody/$pdbId/rmsd_vs_average_noPBC-reorder.xvg | awk '{print $2}'`
    end=`awk 'NR==1000' /home/wurp/workspace/antibody/$pdbId/rmsd_vs_average_noPBC-reorder.xvg | awk '{print $2}'`
    gmx trjconv -f md_0_noPBC.xtc  -o md_0_noPBC_nearAverage.xtc -drop rmsd_vs_average_noPBC.xvg -dropunder 0 -dropover $end
    /home/wurp/workspace/antibody/gmx_mmpbsa_dir_seq.sh  -dir /home/wurp/workspace/antibody/$pdbId/mmpbsa/nearAverage  -f  ../../md_0_noPBC_nearAverage.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 200

done


# /home/wurp/workspace/antibody/nearAverage.sh


cd /home/wurp/workspace/antibody/7R7N
/home/wurp/workspace/antibody/gmx_mmpbsa_dir_seq.sh  -dir /home/wurp/workspace/antibody/7R7N/mmpbsa/nearAverage  -f  ../../md_0_noPBC_nearAverage.xtc  -s  ../../md_0.tpr  -n  ../../index.ndx -com Protein  -pro receptor  -lig ligand -ts  ie  -b 0 -e 10000 -i 200
