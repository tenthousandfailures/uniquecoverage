covergroup dut_if_cg (ref logic [3:0] adr, ref logic [3:0] cmd, input string inst_name, input string comment);

    // TODO allow setting the per_instace values from the class
    type_option.comment = "dut_if_cg comment";
    // this must be a constant not a variable
    type_option.weight = 1;

    // TODO it is funny Questa defaults this to auto(1) when SVLRM says 0
    // TODO CADENCE PROBLEM WITH THIS LINE
    //   ncvlog: *E,ECGUSO (dut_if_cg.svh,10|30): Illegal or unsupported coverage option is specified.
    //   (`include file: dut_if_cg.svh line 10, file: uniq_pkg.sv line 25)
    // type_option.merge_instances = 1;
            
    // TODO this does not exist would solve some problems! put in paper
    // type_option.name = name;
    
    // set the INST name equal to the following equation
    option.name = {name, ".", inst_name};
    option.comment = {comment};
    
    option.weight = 1;
    option.per_instance = 1;

    // TODO CADENCE PROBLEM WITH THIS LINE
    //   ncvlog: *E,ECGIVO (dut_if_cg.svh,26|27): Invalid option is specified.
    //   (`include file: dut_if_cg.svh line 26, file: uniq_pkg.sv line 25)
    // option.get_inst_coverage = 1;
        
    coverpoint cmd {
        bins _null = {'h0};      
        bins _read = {'h1};
        bins _write = {'h2};
        bins _cfg = {'h3};
        option.comment = "coverpoint cmd comment";
    }
    
endgroup
