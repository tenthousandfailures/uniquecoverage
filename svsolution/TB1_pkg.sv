package TB1_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "TB_common.svh"

    typedef agent #(uniq_pkg::t_b) agent_t_b_t;
    typedef agent #(uniq_pkg::b_c) agent_b_c_t;
    typedef agent #(uniq_pkg::c) agent_c_t;
    
    `include "TB1_env.sv"
    `include "TB1_test.sv"

endpackage    
