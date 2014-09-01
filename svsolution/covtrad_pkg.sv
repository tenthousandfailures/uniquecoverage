package covtrad_pkg;

class cov;

    covergroup dut_if_cg (ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name);

        option.name = {inst_name};
        option.comment = "traditional covergroup in a class";

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
