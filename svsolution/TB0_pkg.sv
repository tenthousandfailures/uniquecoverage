package TB0_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    typedef virtual dut_if #(covuniq_pkg::t_a) tb_dut_if_t;

    `include "dut_agent.svh"
    
    `include "TB0_env.sv"
    `include "TB0_test.sv"

endpackage // TB0_pkg
    
