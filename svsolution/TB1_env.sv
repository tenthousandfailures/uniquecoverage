//----------------
// TB1 env
//----------------
class TB1_env extends uvm_env;
    `uvm_component_utils(TB1_env)

    dut_if_t_b_t dut_if_t_b;
    dut_if_b_c_t dut_if_b_c;
    dut_if_c_t   dut_if_c;

    dut_agent_t_b_t dut_agent_t_b_h;
    dut_agent_b_c_t dut_agent_b_c_h;
    dut_agent_c_t   dut_agent_c_h;
            
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

    function void build_phase(uvm_phase phase);
    
        dut_agent_t_b_h = dut_agent_t_b_t::type_id::create("dut_agent_t_b_h", this);
        dut_agent_b_c_h = dut_agent_b_c_t::type_id::create("dut_agent_b_c_h", this);
        dut_agent_c_h   = dut_agent_c_t::type_id::create("dut_agent_c_h", this);

        dut_agent_t_b_h.intf = dut_if_t_b;
        dut_agent_b_c_h.intf = dut_if_b_c;
        dut_agent_c_h.intf   = dut_if_c;
        
    endfunction // build_phase    
    
    function void connect_phase(uvm_phase phase);

        `uvm_info("TB1_env", "Started connect phase.", UVM_HIGH);       
        `uvm_info("TB1_env", "Finished connect phase.", UVM_HIGH);

    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        `uvm_info("TB1_env", "Started run phase.", UVM_HIGH);
        `uvm_info("TB1_env", "Finished run phase.", UVM_HIGH);

        phase.drop_objection(this);
        
    endtask: run_phase

endclass
