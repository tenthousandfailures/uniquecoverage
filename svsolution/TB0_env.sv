//----------------
// TB0 env
//----------------
class TB0_env extends uvm_env;
    `uvm_component_utils(TB0_env)

    tb_dut_if_t tb_dut_if;
    dut_agent#(covuniq_pkg::t_a) dut_agent_h;
            
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

    function void build_phase(uvm_phase phase);
    
        dut_agent_h = dut_agent#(covuniq_pkg::t_a)::type_id::create("dut_agent_h", this);
        dut_agent_h.tb_dut_if = tb_dut_if;
        
    endfunction // build_phase
    
    
    function void connect_phase(uvm_phase phase);
        `uvm_info("TB0_env", "Started connect phase.", UVM_HIGH);
        // Get the interface from the resource database.
        
        `uvm_info("TB0_env", "Finished connect phase.", UVM_HIGH);

    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info("TB0_env", "Started run phase.", UVM_HIGH);

        begin

        end
        `uvm_info("TB0_env", "Finished run phase.", UVM_HIGH);

        phase.drop_objection(this);
        
    endtask: run_phase

endclass
