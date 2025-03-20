# 00
cd fv
mkdir pyenv
python3 -m venv pyenv/
source pyenv/bin/activate
python3 -m pip install --upgrade pip 
python3 -m pip install matplotlib pandas networkx cvc5 numpy
python3 -c "import networkx; import numpy; import matplotlib; import cvc5; import pandas" 
module load base
module load jaspergold

# 01
./setup_scripts.sh
cd synthlc
source ./env.sh
cd ../
rm -rf xSanity
mkdir xSanity
touch xSanity/xSanity.sv
./RUN_JG.sh -j xSanity -s xSanity/xSanity.sv -g 0

# 02
rm -rf xDUVPLs/reachable_duvpls.sv
./run_duvpls.sh
BYPASS=0 ./run_gendfg.sh

# 03
cd synthlc
./run_an_instn_demo.sh DIV.sv