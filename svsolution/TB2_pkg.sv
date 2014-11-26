package TB2_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "TB_common.svh"

    typedef agent #(uniq_pkg::t_c) agent_t_c_t;
    typedef agent #(uniq_pkg::c) agent_c_t;
    
    `include "TB2_env.sv"
    `include "TB2_test.sv"

endpackage    
