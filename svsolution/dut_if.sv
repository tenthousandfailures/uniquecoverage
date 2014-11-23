interface dut_if #(type T = covuniq_pkg::base) (input logic clk);

    string inst_name = "";
    logic [3:0] cmd, adr, data;
    logic       c;
    
    T cov_inst;
    covtrad_pkg::cov covtrad_inst;

    modport slave (input clk, cmd, adr, data);
    modport master (input clk,
                    output cmd, adr, data);

    assign c = clk;
    
    always @(posedge clk) begin
        $display("%5t DEBUG cmd: %2d, adr: %2d, data: %2d - %m", $realtime, cmd, adr, data);

        if ($test$plusargs("NEW_SAMPLE")) begin
            cov_inst.sample();
        end

        if ($test$plusargs("TRAD_SAMPLE")) begin
            covtrad_inst.sample();
        end
        
    end

    initial begin
        $sformat(inst_name, "%m");
        // TODO a way to pass in .per_instance?
        // .per_instance('1)
        cov_inst = new(.adr(adr),
                       .cmd(cmd),
                       .inst_name(inst_name)
                       );
        
        covtrad_inst = new(.adr(adr),
                           .cmd(cmd),
                           .inst_name(inst_name)
                           );

    end

endinterface
