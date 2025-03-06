setenv CLK clock
setenv TOPMOD Rocket
setenv RESET reset
cp src/HB_template.py.template src/HB_template.py
sed -i "s~RESET~${RESET}~" src/HB_template.py
sed -i "s~CLK~${CLK}~" src/HB_template.py

