package TB0_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "TB_common.svh"

    typedef dut_agent #(uniq_pkg::t_a) dut_agent_t_a_t;
    typedef dut_agent #(uniq_pkg::a_b) dut_agent_a_b_t;
    typedef dut_agent #(uniq_pkg::b_c) dut_agent_b_c_t;
    typedef dut_agent #(uniq_pkg::c) dut_agent_c_t;
    
    `include "TB0_env.sv"
    `include "TB0_test.sv"

endpackage    
