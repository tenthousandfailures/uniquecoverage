module dut (
            dut_if.slave slave, // input
            dut_if.master master // output
            );

    // assign inputs to outputs for simple DUT
    always @(posedge slave.clk) begin
        master.cmd <= slave.cmd;
        master.adr <= slave.adr;
        master.data <= slave.data;
    end

endmodule
