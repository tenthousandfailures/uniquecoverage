    typedef virtual dut_if #(uniq_pkg::t_a) dut_if_t_a_t;
    typedef virtual dut_if #(uniq_pkg::t_b) dut_if_t_b_t;
    typedef virtual dut_if #(uniq_pkg::t_c) dut_if_t_c_t;

    typedef virtual dut_if #(uniq_pkg::a_b) dut_if_a_b_t;
    typedef virtual dut_if #(uniq_pkg::b_c) dut_if_b_c_t;
    typedef virtual dut_if #(uniq_pkg::c) dut_if_c_t;
        
    `include "dut_agent.svh"
