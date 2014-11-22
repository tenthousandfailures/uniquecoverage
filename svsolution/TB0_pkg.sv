package TB0_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    typedef virtual dut_if #(covuniq_pkg::t_a) dut_if_t_a_t;
    typedef virtual dut_if #(covuniq_pkg::a_b) dut_if_a_b_t;
    typedef virtual dut_if #(covuniq_pkg::b_c) dut_if_b_c_t;
    typedef virtual dut_if #(covuniq_pkg::c) dut_if_c_t;
        
    `include "dut_agent.svh"

    typedef dut_agent #(covuniq_pkg::t_a) dut_agent_t_a_t;
    typedef dut_agent #(covuniq_pkg::a_b) dut_agent_a_b_t;
    typedef dut_agent #(covuniq_pkg::b_c) dut_agent_b_c_t;
    typedef dut_agent #(covuniq_pkg::c) dut_agent_c_t;
    
    `include "TB0_env.sv"
    `include "TB0_test.sv"

endpackage // TB0_pkg
    
