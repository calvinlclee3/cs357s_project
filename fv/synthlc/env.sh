setenv CLK clk_i
setenv TOPMOD Rocket
setenv RESET \!rst_ni
cp src/HB_template.py.template src/HB_template.py
sed -i "s~reset~${RESET}~" src/HB_template.py
sed -i "s~clock~${CLK}~" src/HB_template.py

