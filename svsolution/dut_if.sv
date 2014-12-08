interface dut_if #(type T = uniq_pkg::base) (input logic clk);

    string inst_name = "";
    logic [3:0] cmd, adr, data;
    logic       c;
    int         weight = 0;

    string      name = "trad_emb";
    string      trad_emb_comment = "trad_emb comment";
    string      trad_emb_inst_name = "inst";

    `include "dut_if_cg.svh"

    dut_if_cg trad_emb_inst; // embedded covergroup
    trad_pkg::cov trad_inst; // class instantance containing covergroup   
    T cov_inst;              // parameterized unique class containing covergroup

    modport slave (input clk, cmd, adr, data);
    modport master (input clk,
                    output cmd, adr, data);

    assign c = clk;
    
    always @(posedge clk) begin
        $display("%5t DEBUG cmd: %2d, adr: %2d, data: %2d - %m", $realtime, cmd, adr, data);

        cov_inst.sample();
        trad_inst.sample();
        trad_emb_inst.sample();
                
    end

    initial begin
        $sformat(inst_name, "%m");
        cov_inst = new(.adr(adr),
                       .cmd(cmd),
                       .inst_name(inst_name)
                       );
        
        trad_inst = new(.adr(adr),
                        .cmd(cmd),
                        .inst_name(inst_name)
                        );

        trad_emb_inst = new(.adr(adr),
                            .cmd(cmd),
                            .inst_name(inst_name),
                            .comment(trad_emb_comment)
                            );
        
        // set the weights to 1 if sampling is turned on
        // use Questa filters to exclude weights eq 0
        // weight cvginst ne 0
        if ($test$plusargs("NEW_SAMPLE")) begin
            cov_inst.dut_if_cg.option.weight = 1;
        end

        if ($test$plusargs("TRAD_SAMPLE")) begin
            trad_inst.dut_if_cg.option.weight = 1;
            trad_emb_inst.option.weight = 1;
        end
        
    end

endinterface
