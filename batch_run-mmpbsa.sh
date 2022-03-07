
#----------------------------------------------1-5ns, 20ps间隔---------------------------------------------------------------------------------

#-------------------NTD-------------------------

date
cd  /home/wurp/workspace/antibody/NTD/7L2C
mkdir -p 1-5-20
cd 1-5-20
python /home/wurp/workspace/antibody/BioUtil-master/gmx/pygmx/main.py -tpr ../md_0.tpr -xtc ../md_0.xtc -ri 1 286 -li 287 720 -fm normal -rm normal -t 1000 5000 20


#-------------------variant-------------------------
date
cd  /home/wurp/workspace/antibody/variant/Alpha/COVOX-269
mkdir -p 1-5-20
cd 1-5-20
python /home/wurp/workspace/antibody/BioUtil-master/gmx/pygmx/main.py -tpr ../md_0.tpr -xtc ../md_0.xtc -ri 435 630 -li 1 434 -fm normal -rm normal -t 1000 5000 20


date
cd /home/wurp/workspace/antibody/variant/Omicron/Beta-55
mkdir -p 1-5-20
cd 1-5-20
python /home/wurp/workspace/antibody/BioUtil-master/gmx/pygmx/main.py -tpr ../md_0.tpr -xtc ../md_0.xtc -ri 1 188 -li 189 630 -fm normal -rm normal -t 1000 5000 20


date
cd  /home/wurp/workspace/antibody/variant/Gamma/COVOX-222
mkdir -p 1-5-20
cd 1-5-20
python /home/wurp/workspace/antibody/BioUtil-master/gmx/pygmx/main.py -tpr ../md_0.tpr -xtc ../md_0.xtc -ri 1 193 -li 194 623 -fm normal -rm normal -t 1000 5000 20
