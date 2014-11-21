
module TB1 ();
    `include "uvm_macros.svh"
    import uvm_pkg::*;
 
    logic clk = 0;

    dut_if #(covuniq_pkg::t_b) dut_if_t_b(clk);
    dut_if #(covuniq_pkg::b_c) dut_if_b_c(clk);
    dut_if #(covuniq_pkg::c) dut_if_c(clk);

    dut dutb(
             .slave(dut_if_t_b),
             .master(dut_if_b_c)
             );
    dut dutc(
             .slave(dut_if_b_c),
             .master(dut_if_c)
             );

    always begin
        #10 clk = 1;
        #10 clk = 0;
    end

    always @(posedge clk) begin
        dut_if_t_b.slave.cmd <= 2;
        dut_if_t_b.slave.adr <= $urandom_range(4,3);
        dut_if_t_b.slave.data <= $urandom_range(7,0);        
    end

    initial begin
        dut_if_t_b.slave.cmd <= '0;
        dut_if_t_b.slave.adr <= '0;
        dut_if_t_b.slave.data <= '0;
        #2000;
    end       

    initial begin
        uvm_config_db#(virtual dut_if #(covuniq_pkg::t_b))::set(null,"uvm_test_top","dut_if_t_b", dut_if_t_b);       
    end
    
endmodule
