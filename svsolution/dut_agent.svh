class txn extends uvm_sequence_item;
    `uvm_object_utils(txn)

    rand logic [3:0] cmd, adr, data;
    
    function new( string name = "");
        super.new(name);
    endfunction // new       
    
endclass // txn

class dut_monitor extends uvm_component;
    `uvm_component_utils(dut_monitor)

    tb_dut_if_t tb_dut_if;

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
            @(posedge tb_dut_if.slave.clk);
            tx = txn::type_id::create("tx");
            tx.cmd = tb_dut_if.slave.cmd;
            tx.adr = tb_dut_if.slave.adr;
            tx.data = tb_dut_if.slave.data;

            aport.write(tx);
            `uvm_info("dut_monitor", $sformatf("cmd: %h adr: %h data: %h", tx.cmd, tx.adr, tx.data), UVM_HIGH);
            
        end
    endtask // run_phase
        
endclass


class dut_agent extends uvm_agent;
    `uvm_component_utils(dut_agent)

    tb_dut_if_t tb_dut_if;
    dut_monitor dut_monitor_h;
        
    function void build_phase(uvm_phase phase);
        dut_monitor_h = dut_monitor::type_id::create("dut_monitor_h", this);        
    endfunction // build_phase

    function void connect_phase(uvm_phase phase);
        dut_monitor_h.tb_dut_if = tb_dut_if;
    endfunction // connect_phase
    
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction // new
    
endclass // dut_agent
