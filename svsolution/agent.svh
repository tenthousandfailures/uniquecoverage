class txn extends uvm_sequence_item;
    `uvm_object_utils(txn)

    rand logic [3:0] cmd, adr, data;
    
    function new( string name = "");
        super.new(name);
    endfunction // new       

    function void do_print(uvm_printer printer);
        super.do_print(printer);
        
        printer.print_int("cmd  ", cmd,  $bits(cmd),  UVM_DEC);
        printer.print_int("adr  ", adr,  $bits(adr),  UVM_DEC);
        printer.print_int("data ", data, $bits(data), UVM_DEC);
        
    endfunction // do_print
        
endclass // txn

class cov#(type T = uniq_pkg::base) extends uvm_subscriber#(txn);
    `uvm_component_param_utils(cov#(T))

    logic [3:0] cmd, adr, data;        
    T pass_cg;
    
    string      pass_cg_string;   
        
    function new(string name = "", uvm_component parent=null);
        super.new(name, parent);
        pass_cg_string = {this.get_full_name()};

        // TODO PASS IN THE WEIGHT HERE to get around hierarchial references if desired
        pass_cg = new(adr, cmd, pass_cg_string);
        
    endfunction // new

    function void write(txn t);

        adr = t.adr;
        cmd = t.cmd;

        pass_cg.sample();
               
        $display("");
        `uvm_info("cov", $sformatf("cmd: %h adr: %h data: %h", t.cmd, t.adr, t.data), UVM_HIGH);       
        t.print();
        $display("");        
        
    endfunction // write    
    
endclass // cov

class monitor#(type T = uniq_pkg::base) extends uvm_component;
    `uvm_component_param_utils(monitor#(T))

    virtual dut_if#(T) intf;
    
    uvm_analysis_port #(txn) aport;
    
    function void build_phase(uvm_phase phase);
        aport = new("aport", this);
    endfunction // build_phase

    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction // new
        
    task run_phase(uvm_phase phase);
        forever begin
            txn tx;
            @(posedge intf.c);
            tx = txn::type_id::create("tx");
            tx.cmd = intf.cmd;
            tx.adr = intf.adr;
            tx.data = intf.data;

            aport.write(tx);
            `uvm_info("monitor", $sformatf("cmd: %h adr: %h data: %h", tx.cmd, tx.adr, tx.data), UVM_HIGH);
            
        end
    endtask // run_phase
        
endclass


class agent#(type T = uniq_pkg::base) extends uvm_agent;
    `uvm_component_param_utils(agent#(T))

    virtual dut_if#(T) intf;
    // dut_if_t_a_t intf;

    monitor#(T) monitor_h;
    cov#(T) cov_h;
        
    function void build_phase(uvm_phase phase);
        monitor_h = monitor#(T)::type_id::create("monitor_h", this);        
        cov_h = cov#(T)::type_id::create("cov_h", this);        
    endfunction // build_phase

    function void connect_phase(uvm_phase phase);
        monitor_h.intf = intf;
        monitor_h.aport.connect(cov_h.analysis_export);        
    endfunction // connect_phase
    
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction // new
    
endclass // agent
