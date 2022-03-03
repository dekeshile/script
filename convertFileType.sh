#!/bin/bash
# cd /home/wurp/workspace/antibody/7E23

exec tclsh "$0" ${1+"$@"}
mol new npt.gro
mol addfile md_0_noPBC.xtc
animate write dcd double_test.dcd sel [atomselect top backbone]