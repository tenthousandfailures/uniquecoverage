vlib work
# vdel -all -lib work
vlog \
    +cover \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB0_pkg.sv \
    TB0.sv \
    TB1_pkg.sv \
    TB1.sv \
    TB2_pkg.sv \
    TB2.sv

vsim -coverage TB0; run 2000; coverage save TB0.ucdb; quit -sim
vsim -coverage TB1; run 2000; coverage save TB1.ucdb; quit -sim
vsim -coverage TB2; run 2000; coverage save TB2.ucdb; quit -sim
xml2ucdb -format Excel svsolution_testplan.xml testplan.ucdb -verbose
vcover merge -totals merge.ucdb TB0.ucdb TB1.ucdb TB2.ucdb testplan.ucdb
add testbrowser TB0.ucdb TB1.ucdb TB2.ucdb testplan.ucdb merge.ucdb
coverage open merge.ucdb
