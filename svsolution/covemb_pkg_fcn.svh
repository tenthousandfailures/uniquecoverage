// TODO this is a real canidate for strategy pattern
function new(ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name);
    super.new(.adr(adr),
              .cmd(cmd),
              .inst_name(inst_name)
              );
    dut_if_cg = new(.adr(adr),
                     .cmd(cmd),
                     .inst_name(inst_name),
                     .comment(comment)
                     );

endfunction // new

function void sample();
    super.sample();
    dut_if_cg.sample();
endfunction
