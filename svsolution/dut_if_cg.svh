    covergroup dut_if_cg (ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name, ref string comment);

        // TODO allow setting the per_instace values from the class
        type_option.comment = "dut_if_cg comment";

        // set the INST name equal to the following equation
        option.name = {name, ".", inst_name};
        option.comment = {comment};

        option.per_instance = 1;
        option.get_inst_coverage = 1;   

        adr : coverpoint adr {
            option.comment = "coverpoint adr comment";
        }

        cmd : coverpoint cmd {
            bins _null = {'h0};      
            bins _read = {'h1};
            bins _write = {'h2};
            bins _cfg = {'h3};
            option.comment = "coverpoint cmd comment";
        }
        
    endgroup
