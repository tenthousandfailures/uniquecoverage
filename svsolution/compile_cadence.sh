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

# SV TB
# -covtest TB0 \

# UVM will add seed to covtest
# SV version use
#     TB1_pkg.sv \
#     TB1.sv \
#     TB2_pkg.sv \
#     TB2.sv
