module TB2 ();

    logic clk = 0;

    dut_if #(covemb_pkg::t_c) dut_if_t_c(clk);
    dut_if #(covemb_pkg::c) dut_if_c(clk);

    dut dutc(
             .slave(dut_if_t_c),
             .master(dut_if_c)
             );

    always begin
        #10 clk = 1;
        #10 clk = 0;
    end

    always @(posedge clk) begin
        dut_if_t_c.slave.cmd <= 3;
        dut_if_t_c.slave.adr <= $urandom_range(15,5);
        dut_if_t_c.slave.data <= $urandom_range(7,0);        
    end

    initial begin
        dut_if_t_c.slave.cmd <= '0;
        dut_if_t_c.slave.adr <= '0;
        dut_if_t_c.slave.data <= '0;
        #2000;
    end       
    
endmodule

