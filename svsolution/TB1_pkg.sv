package TB1_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "TB_common.svh"

    typedef dut_agent #(covuniq_pkg::t_b) dut_agent_t_b_t;
    typedef dut_agent #(covuniq_pkg::b_c) dut_agent_b_c_t;
    typedef dut_agent #(covuniq_pkg::c) dut_agent_c_t;
    
    `include "TB1_env.sv"
    `include "TB1_test.sv"

endpackage    
