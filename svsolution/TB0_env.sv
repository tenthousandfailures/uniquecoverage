//----------------
// TB0 env
//----------------
class TB0_env extends uvm_env;
    `uvm_component_utils(TB0_env)

    dut_if_t_a_t dut_if_t_a;
    dut_if_a_b_t dut_if_a_b;
    dut_if_b_c_t dut_if_b_c;
    dut_if_c_t   dut_if_c;

    agent_t_a_t agent_t_a_h;
    agent_a_b_t agent_a_b_h;
    agent_b_c_t agent_b_c_h;
    agent_c_t   agent_c_h;
            
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

    function void build_phase(uvm_phase phase);
    
        agent_t_a_h = agent_t_a_t::type_id::create("agent_t_a_h", this);
        agent_a_b_h = agent_a_b_t::type_id::create("agent_a_b_h", this);
        agent_b_c_h = agent_b_c_t::type_id::create("agent_b_c_h", this);
        agent_c_h   = agent_c_t::type_id::create("agent_c_h", this);

        agent_t_a_h.intf = dut_if_t_a;
        agent_a_b_h.intf = dut_if_a_b;
        agent_b_c_h.intf = dut_if_b_c;
        agent_c_h.intf   = dut_if_c;
        
    endfunction // build_phase    
    
    function void connect_phase(uvm_phase phase);

        `uvm_info("TB0_env", "Started connect phase.", UVM_HIGH);       
        `uvm_info("TB0_env", "Finished connect phase.", UVM_HIGH);

    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        `uvm_info("TB0_env", "Started run phase.", UVM_HIGH);
        `uvm_info("TB0_env", "Finished run phase.", UVM_HIGH);

        phase.drop_objection(this);
        
    endtask: run_phase

endclass
