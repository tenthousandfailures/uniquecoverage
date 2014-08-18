module TB0 ();

    logic clk = 0;

    dut_if #(covemb_pkg::t_a) dut_if_t_a(clk);
    dut_if #(covemb_pkg::a_b) dut_if_a_b(clk);
    dut_if #(covemb_pkg::b_c) dut_if_b_c(clk);
    dut_if #(covemb_pkg::c) dut_if_c(clk);

    dut duta(
             .slave(dut_if_t_a), // input
             .master(dut_if_a_b) // output
             );
    dut dutb(
             .slave(dut_if_a_b),
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
        dut_if_t_a.slave.cmd <= 1;
        dut_if_t_a.slave.adr <= $urandom_range(2,1);
        dut_if_t_a.slave.data <= $urandom_range(7,0);        
    end

    initial begin
        dut_if_t_a.slave.cmd <= '0;
        dut_if_t_a.slave.adr <= '0;
        dut_if_t_a.slave.data <= '0;
        #2000;
    end       
    
endmodule
