//----------------
// TB0_test
//----------------
class TB0_test extends uvm_test;
    `uvm_component_utils(TB0_test)
   
    TB0_pkg::TB0_env env_h;
    tb_dut_if_t tb_dut_if;
        
    function new(string name = "TB0_test", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("STATUS", "starting test", UVM_MEDIUM)                
    endfunction

    function void build_phase(uvm_phase phase);
        env_h = TB0_pkg::TB0_env::type_id::create("env_h", this);       
        if (!uvm_config_db#(tb_dut_if_t)::get(this, "", "tb_dut_if", tb_dut_if)) begin
            `uvm_fatal("TB0_test", "failed to get virtual handle to tb_dut_if")
        end
    endfunction // build_phase
    
    function void connect_phase(uvm_phase phase);
        env_h.tb_dut_if = tb_dut_if;
    endfunction // connect_phase
        
    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this, "run phase");
        
        `uvm_info("STATUS", "starting test", UVM_MEDIUM)

        for (int i=0; i<1000; i=i+1) begin
            @(posedge tb_dut_if.slave.clk);
            tb_dut_if.slave.cmd <= 1;
            tb_dut_if.slave.adr <= $urandom_range(2,1);
            tb_dut_if.slave.data <= $urandom_range(7,0);        
        end
        
        phase.drop_objection(this, "run phase");

    endtask // main_phase
    
endclass // TB0_test
