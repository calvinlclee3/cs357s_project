# 00
module load base
module load jaspergold
source pyenv/bin/activate

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
