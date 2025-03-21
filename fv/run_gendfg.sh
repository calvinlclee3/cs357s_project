#!/usr/bin/bash
def_val=1
BYPASS=${BYPASS:-$def_val}
cd synthlc/xGenPerfLocDfgDiv
python3 gen_dfg_all_pls.py gen
touch tmp.sv 
if [ $BYPASS -eq 1 ];
then
    cp expected_output/dfg_e.txt .
    cp dfg_e.txt dfg_e.0
else
    cd ../../
    ./RUN_JG.sh -j synthlc/xGenPerfLocDfgDiv -s synthlc/xGenPerfLocDfgDiv/tmp.sv -t synthlc/xGenPerfLocDfgDiv/get_dfg.tcl -g 0 
    cd synthlc/xGenPerfLocDfgDiv
    mylog=$(ls tmp_rundir/*/jg.log)
    cp ${mylog} "get_dfg.tcl.log"
    python3 gen_dfg_all_pls.py pp
    # To ensure the results are the same in case the edges are reordered 
    cp dfg_e.txt dfg_e.0
fi 
cd ../../
