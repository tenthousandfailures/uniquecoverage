rm -rf snps_work
rm -rf urgReport
rm -rf csrc
mkdir snps_work

vcs \
    -sverilog \
    -l snps_work/tb0.comp.log \
    -o snps_work/tb0 \
    -timescale="1ns/100ps" \
    -debug_all \
    -ntb_opts uvm \
    +define+UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB0_pkg.sv \
    TB0.sv

vcs \
    -sverilog \
    -l snps_work/tb1.comp.log \
    -o snps_work/tb1 \
    -timescale="1ns/100ps" \
    -debug_all \
    -ntb_opts uvm \
    +define+UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB1_pkg.sv \
    TB1.sv

vcs \
    -sverilog \
    -l snps_work/tb2.comp.log \
    -o snps_work/tb2 \
    -timescale="1ns/100ps" \
    -debug_all \
    -ntb_opts uvm \
    +define+UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    uniq_pkg.sv \
    emb_pkg.sv \
    dut_if.sv \
    dut.sv \
    TB2_pkg.sv \
    TB2.sv

snps_work/tb0 +ntb_random_seed_automatic -ucli -i run.ucli

snps_work/tb1 +ntb_random_seed_automatic -ucli -i run.ucli

snps_work/tb2 +ntb_random_seed_automatic -ucli -i run.ucli

urg -dir snps_work/tb0.vdb -dir snps_work/tb1.vdb -dir snps_work/tb2.vdb

firefox urgReport/groups.html &
