# 使用方法：
# shell命令行输入 vmd -e /home/wurp/workspace/waterSel.tcl


proc singleFrameSel { } {

    # 打开 pdb文件
    mol new /home/wurp/workspace/antibody/SARS-COV-2/1_7KFY/MD_10ns/md_0.gro

    pbc box

    #第一个图层 0 0 的原子显示为NewCartoon
    mol modstyle 0 0 NewCartoon

    #增加一个图层 0 1
    mol color Name
    mol representation VDW
    mol selection all
    mol addrep 0


    #序号在5~200内的原子以及210号原子,把它们记作受体，得到受体序号
    set receptor [atomselect top "residue 1 to 195"]
    set rep_list [$receptor list]


    #序号在5~200内的原子以及210号原子,把它们记作配体，得到配体序号
    set ligand [atomselect top "residue 196 to 632"]
    set lig_list [$ligand list]



    #选择距离 receptor 2A,并且距离 ligand 2A 以内的水
    set waterlist [atomselect top "water within 5 of index $rep_list and within 5 of index $lig_list"]

    #列出结合面上水的分子序号
    $waterlist get residue

    # 显示出waterlist
    mol modselect 1 0 index [$waterlist list] 

    return

}


proc allFrameSel { } {

     # 打开 pdb文件
    # mol new /home/wurp/workspace/antibody/SARS-COV-2/1_7KFY/MD_10ns/md_0.gro

    # #载入xtc文件
    # mol addfile {/home/wurp/workspace/antibody/SARS-COV-2/1_7KFY/MD_10ns/md_0.xtc} type {xtc} first 0 last 1000 step 1 waitfor 1 0
    # animate style Once

    pbc box

    #第一个图层 0 0 的原子显示为NewCartoon
    mol modstyle 0 0 NewCartoon

    #增加一个图层 0 1
    mol color Name
    mol representation VDW
    mol selection all
    mol addrep 0

    set n [molinfo top get numframes]
    
    for { set i 0 } { $i < $n } { incr i} {
        # $showwater frame $i
        #序号在5~200内的原子以及210号原子,把它们记作受体，得到受体序号
        set receptor [atomselect top "residue 1 to 195" frame $i]
        set rep_list [$receptor list]


        #序号在5~200内的原子以及210号原子,把它们记作配体，得到配体序号
        set ligand [atomselect top "residue 196 to 632" frame $i]
        set lig_list [$ligand list]


        #选择距离 receptor 2A,并且距离 ligand 2A 以内的水
        set waterlist [atomselect top "water within 5 of index $rep_list and within 5 of index $lig_list"]


        # 显示出waterlist
        mol modselect 1 0 index [$waterlist list]
    }
    return
}


allFrameSel
# singleFrameSel

#   vmd -e /home/wurp/workspace/waterSel.tcl
#   source /home/wurp/workspace/waterSel.tcl






