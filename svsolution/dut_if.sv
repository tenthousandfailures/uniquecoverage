interface dut_if #(type T = uniq_pkg::base) (input logic clk);

    string inst_name = "";
    logic [3:0] cmd, adr, data;
    logic       c;
    int         weight = 0;

    string      name = "simple";
    string      emb_comment = "emb comment";
    string      simple_comment = "simple comment";

    
    `include "dut_if_cg.svh"

    dut_if_cg simple_inst;  // simple covergroup
    emb_pkg::cov emb_inst;  // class instantance containing covergroup   
    T cov_inst;              // parameterized unique class containing covergroup

    modport slave (input clk, cmd, adr, data);
    modport master (input clk,
                    output cmd, adr, data);

    assign c = clk;
    
    always @(posedge clk) begin
        $display("%5t DEBUG cmd: %2d, adr: %2d, data: %2d - %m", $realtime, cmd, adr, data);

        cov_inst.sample();
        simple_inst.sample();
        emb_inst.sample();
                
    end

    initial begin
        $sformat(inst_name, "%m");
        cov_inst = new(.adr(adr),
                       .cmd(cmd),
                       .inst_name(inst_name)
                       );
        
        simple_inst = new(.adr(adr),
                          .cmd(cmd),
                          .inst_name(inst_name),
                          .comment(simple_comment)
                          );

        emb_inst = new(.adr(adr),
                       .cmd(cmd),
                       .inst_name(inst_name)
                       );
    
    end
    
endinterface
