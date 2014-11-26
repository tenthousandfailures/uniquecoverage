package TB0_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "TB_common.svh"

    typedef agent #(uniq_pkg::t_a) agent_t_a_t;
    typedef agent #(uniq_pkg::a_b) agent_a_b_t;
    typedef agent #(uniq_pkg::b_c) agent_b_c_t;
    typedef agent #(uniq_pkg::c) agent_c_t;
    
    `include "TB0_env.sv"
    `include "TB0_test.sv"

endpackage    
