package trad_pkg;

class cov;

    // TODO this could be included from dut_if_cg.svh
    covergroup dut_if_cg (ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name);

        // TODO it is funny Questa defaults this to auto(1) when SVLRM says 0
        type_option.merge_instances = 1;
        // TODO allow setting the per_instace values from the class
        type_option.comment = "dut_if_cg traditional comment";
        // this must be a constant not a variable
        type_option.weight = 1;
        
        option.name = {inst_name};
        option.comment = "traditional covergroup in a class";
        option.weight = 0;
                
        option.per_instance = 1;
        option.get_inst_coverage = 1;   

//        adr : coverpoint adr {
//            option.comment = "coverpoint adr comment";
//        }

        cmd : coverpoint cmd {
            bins _null = {'h0};      
            bins _read = {'h1};
            bins _write = {'h2};
            bins _cfg = {'h3};
            option.comment = "coverpoint cmd comment";
        }
        
    endgroup

    function new(ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name);
        dut_if_cg = new(.adr(adr),
                        .cmd(cmd),
                        .inst_name(inst_name)
                        );
    endfunction

    function void sample();
        dut_if_cg.sample();
    endfunction
     
endclass

endpackage
