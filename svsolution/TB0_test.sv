//----------------
// TB0_test
//----------------
class TB0_test extends uvm_test;
    `uvm_component_utils(TB0_test)
   
    TB0_pkg::TB0_env env_h;
    virtual dut_if#(covuniq_pkg::t_a) dut_if_t_a;
        
    function new(string name = "TB0_test", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("STATUS", "starting test", UVM_MEDIUM)                
    endfunction

    function void build_phase(uvm_phase phase);
        env_h = TB0_pkg::TB0_env::type_id::create("env_h", this);       
        if (!uvm_config_db#(virtual dut_if#(covuniq_pkg::t_a))::get(this, "", "dut_if_t_a", dut_if_t_a)) begin
            `uvm_fatal("TB0_test", "failed to get virtual handle to dut_if")
        end
    endfunction // build_phase
    
    function void connect_phase(uvm_phase phase);
        env_h.dut_if_t_a = dut_if_t_a;
    endfunction // connect_phase
    
    
    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this, "run phase");
        
        `uvm_info("STATUS", "starting test", UVM_MEDIUM)
        #1000ns;
                
        phase.drop_objection(this, "run phase");

    endtask // main_phase
    
endclass // TB0_test
