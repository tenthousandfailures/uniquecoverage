interface dut_if #(type T = covuniq_pkg::base) (input logic clk);

    string inst_name = "";
    logic [3:0] cmd, adr, data;
    logic       c;
    int         weight = 0;
        
    T cov_inst;
    covtrad_pkg::cov covtrad_inst;

    modport slave (input clk, cmd, adr, data);
    modport master (input clk,
                    output cmd, adr, data);

    assign c = clk;
    
    always @(posedge clk) begin
        $display("%5t DEBUG cmd: %2d, adr: %2d, data: %2d - %m", $realtime, cmd, adr, data);

        cov_inst.sample();
        covtrad_inst.sample();
        
    end

    initial begin
        $sformat(inst_name, "%m");
        cov_inst = new(.adr(adr),
                       .cmd(cmd),
                       .inst_name(inst_name)
                       );
        
        covtrad_inst = new(.adr(adr),
                           .cmd(cmd),
                           .inst_name(inst_name)
                           );

        // set the weights to 1 if sampling is turned on
        // use Questa filters to exclude weights eq 0
        // weight cvginst ne 0
        if ($test$plusargs("NEW_SAMPLE")) begin
            cov_inst.dut_if_cg.option.weight = 1;
        end

        if ($test$plusargs("TRAD_SAMPLE")) begin
            covtrad_inst.dut_if_cg.option.weight = 1;
        end
        
    end

endinterface
