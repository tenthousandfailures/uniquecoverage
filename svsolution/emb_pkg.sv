package emb_pkg;

class cov;

    string name = "emb_pkg";
        
    `include "dut_if_cg.svh"
   
    
    function new(ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name);
        dut_if_cg = new(.adr(adr),
                        .cmd(cmd),
                        .inst_name(inst_name),
                        .comment("embedded covergroup")
                        );
    endfunction

    function void sample();
        dut_if_cg.sample();
    endfunction
     
endclass

endpackage
