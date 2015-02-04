rm -rf cov_work

irun \
    -clean \
    -access rw \
    -coverage all \
    -uvmhome /asiclibs/libraries/uvm/uvm-1.1d \
    -quiet \
    +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB2_pkg.sv \
    TB2.sv \
    -svseed random \
    +UVM_VERBOSITY=UVM_DEBUG \
    +UVM_TESTNAME=TB2_test

irun \
    -clean \
    -access rw \
    -coverage all \
    -uvmhome /asiclibs/libraries/uvm/uvm-1.1d \
    -quiet \
    +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB1_pkg.sv \
    TB1.sv \
    -svseed random \
    +UVM_VERBOSITY=UVM_DEBUG \
    +UVM_TESTNAME=TB1_test

irun \
    -clean \
    -access rw \
    -coverage all \
    -uvmhome /asiclibs/libraries/uvm/uvm-1.1d \
    -quiet \
    +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB0_pkg.sv \
    TB0.sv \
    -svseed random \
    +UVM_VERBOSITY=UVM_DEBUG \
    +UVM_TESTNAME=TB0_test

# imc -batch
imc -exec imc_merge.tcl
imc -load ./cov_work/scope/m1

# If using just the SystemVerilog TB and not UVM using the following
# -covtest TB0
