echo -e 2 \n | gmx pdb2gmx -f renum.pdb -o processed.gro -water tip3p

"""

# generate weak constrain which used in constraining MD.
# 1. Copy posre_Protein_chain_X.itp and rename > posre100_chain_X.
# 2. Modify all force values from 1000 to 100 carefully, pay attention to 1000th atom if you use [change all] by text editor like VScode. 
# 3. Add following code at last line of each topol_Protein_chain_X.itp respectively  

; Include Prodution Position restraint file 
#ifdef POSRES100 
#include "posre100_chain_X.itp" 
#endif 

4. Modify following para at first line of interesting prod_posres.mdp  
define = -DPOSRES100  
"""

#cp posre_Protein_chain_*  posre100_chain_*

fileNum=`ls posre_Protein* | wc -l`

for filename in `ls posre_Protein*`;
do

done

