package TB2_pkg;
        
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "TB_common.svh"

    typedef dut_agent #(uniq_pkg::t_c) dut_agent_t_c_t;
    typedef dut_agent #(uniq_pkg::c) dut_agent_c_t;
    
    `include "TB2_env.sv"
    `include "TB2_test.sv"

endpackage    
