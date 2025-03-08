./setup_scripts.sh
cd synthlc
source env.sh
cd ../
rm -rf xSanity
rm -rf xDUVPLs/reachable_duvpls.sv
mkdir xSanity
touch xSanity/xSanity.sv
./RUN_JG.sh -j xSanity -s xSanity/xSanity.sv -g 0