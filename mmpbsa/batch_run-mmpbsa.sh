
#-----------------------------------------no hoh, 100-200ps, 10ps间隔---------------------------------------------------------------------------------

libdir="/home/wurp/workspace/antibody/BioUtil413/gmx/pygmx"

# anti_list=("1_7KFY" "2_7KFX" "3_7KFV" "4_7KFW" "5_7JVA" "6_7KGK" "7_6LZG" "8_6YZ5" "9_6ZBP" "10_7B27" "11_7BWJ")
anti_list=("2_7KFX" "3_7KFV" "4_7KFW" "5_7JVA" "6_7KGK" "7_6LZG" "8_6YZ5" "9_6ZBP" "10_7B27" "11_7BWJ")


# 4_7KFW : -ri 196 631 -li 1 195 
# 5_7JVA:  -ri 1 227 -li 228 420
# 6_7KGK:  -ri 196 314 -li 1 195
# 9_6ZBP:  -ri 196 322 -li 1 195
#10_7B27: -ri 203 327 -li 1 202

# ri_left=(196    196     196     196      1           196       1          196    196    203    195)

# ri_right=(632    634    634     631      227         314       596         322    323    327    636)

# li_left=(1      1        1       1        228          1       597        1      1      1      1)

# li_right=(195   195     195     195      420          195      791        195    195    202    194)

ri_left=(196    196     196     196      1           196       1          196    196    203    195)

ri_right=(634    634     631      227         314       596         322    323    327    636)

li_left=(1        1       1        228          1       597        1      1      1      1)

li_right=(195     195     195      420          195      791        195    195    202    194)

cnt=0

for anti in ${anti_list[@]}
do
    this_dir=/home/wurp/workspace/antibody/SARS-COV-2/$anti/MD_10ns
    cd $this_dir
    python $libdir/main.py -tpr $this_dir/md_0.tpr -xtc $this_dir/md_0.xtc \
    -ri ${ri_left[$cnt]} ${ri_right[$cnt]} -li ${li_left[$cnt]} ${li_right[$cnt]} -fm normal -rm normal -t 1000 10000 200 1   # 100 200 10 5  
    cnt=$cnt+1
done


# for anti in ${anti_list[@]}
# do
#     for i in $(seq 1 5)
#     do 
#         this_dir=/home/wurp/workspace/antibody/SARS-COV-2/$anti/MD/$i
#         cd $this_dir
#         tar -czf mmpbsa_20_40ps.zip mmpbsa_20_40ps/
#         rm -rf mmpbsa_20_40ps
#     done
# done


# /home/wurp/workspace/antibody/script/batch_run-mmpbsa.sh
