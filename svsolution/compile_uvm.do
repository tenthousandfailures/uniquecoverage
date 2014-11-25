vlib work
# vdel -all -lib work
vlog \
    +cover \
    uniq_pkg.sv \
    trad_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB0_pkg.sv \
    TB0.sv \
    TB1_pkg.sv \
    TB1.sv \
    TB2_pkg.sv \
    TB2.sv

# vsim -coverage -classdebug -uvmcontrol=all +TRAD_SAMPLE +NEW_SAMPLE +UVM_SAMPLE +UVM_TESTNAME=TB0_test +UVM_VERBOSITY=DEBUG TB0; run 2000; quit -sim
# vsim -coverage -classdebug -uvmcontrol=all +TRAD_SAMPLE +NEW_SAMPLE +UVM_SAMPLE +UVM_TESTNAME=TB1_test +UVM_VERBOSITY=DEBUG TB1; run 2000; quit -sim
vsim -coverage -classdebug -uvmcontrol=all +TRAD_SAMPLE +NEW_SAMPLE +UVM_SAMPLE +UVM_TESTNAME=TB2_test +UVM_VERBOSITY=DEBUG TB2; run 2000; quit -sim


