module TB2 ();

    `include "uvm_macros.svh"
    import uvm_pkg::*;
    import TB2_pkg::*;
    
    logic clk = 0;

    dut_if #(uniq_pkg::t_c) dut_if_t_c(clk);
    dut_if #(uniq_pkg::c) dut_if_c(clk);

    dut dutc(
             .slave(dut_if_t_c),
             .master(dut_if_c)
             );

    always begin
        #10 clk = 1;
        #10 clk = 0;
    end

    always @(posedge clk) begin
        // if not a UVM test send in the input
        if (!$test$plusargs("UVM_TESTNAME")) begin
            dut_if_t_c.cmd <= 3;
            dut_if_t_c.adr <= $urandom_range(15,5);
            dut_if_t_c.data <= $urandom_range(7,0);
        end
    end

    initial begin
        uvm_config_db#(dut_if_t_c_t)::set(null,"uvm_test_top","dut_if_t_c", dut_if_t_c);       
        uvm_config_db#(dut_if_c_t)::set(null,  "uvm_test_top","dut_if_c",   dut_if_c);       

        dut_if_t_c.cmd <= '0;
        dut_if_t_c.adr <= '0;
        dut_if_t_c.data <= '0;

        // if a UVM test run it otherwise inform it is not UVM
        if ($test$plusargs("UVM_TESTNAME")) begin
            run_test();
        end else begin
            `uvm_info("TB2", "NOT a UVM_TEST", UVM_DEBUG)
        end

    end       
    
endmodule

