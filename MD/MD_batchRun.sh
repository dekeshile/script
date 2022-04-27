

# 1_7KFY
# 2_7KFX
# 3_7KFV
# 4_7KFW
# 5_7JVA
# 6_7KGK
# 7_6LZG
# 8_6YZ5
# 9_6ZBP
# 10_7B27
# 11_7BWJ

# /home/wurp/workspace/antibody/script/script_10ns.sh /home/wurp/workspace/antibody/SARS-COV-2/1_7KFY 1


anti_list=("1_7KFY" "2_7KFX" "3_7KFV" "4_7KFW" "5_7JVA" "6_7KGK" "7_6LZG" "8_6YZ5" "9_6ZBP" "10_7B27" "11_7BWJ")


for anti in ${anti_list[@]}
do
    anti_path=/home/wurp/workspace/antibody/SARS-COV-2/$anti
    gpu_id=1
    /home/wurp/workspace/antibody/script/script_10ns.sh $anti_path $gpu_id

       
done


#  /home/wurp/workspace/antibody/script/MD_batchRun.sh