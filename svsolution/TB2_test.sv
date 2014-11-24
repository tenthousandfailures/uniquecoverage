//----------------
// TB2_test
//----------------
class TB2_test extends uvm_test;
    `uvm_component_utils(TB2_test)

    TB2_pkg::TB2_env env_h;
    dut_if_t_c_t dut_if_t_c;
    dut_if_c_t   dut_if_c;
        
    function new(string name = "TB2_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        env_h = TB2_pkg::TB2_env::type_id::create("env_h", this);
        if (!uvm_config_db#(dut_if_t_c_t)::get(this, "", "dut_if_t_c", dut_if_t_c)) begin
            `uvm_fatal("TB2_test", "failed to get virtual handle to dut_if_t_c")
        end
        if (!uvm_config_db#(dut_if_c_t)::get(this, "", "dut_if_c", dut_if_c)) begin
            `uvm_fatal("TB2_test", "failed to get virtual handle to dut_if_c")
        end      

        env_h.dut_if_t_c = dut_if_t_c;
        env_h.dut_if_c   = dut_if_c;

    endfunction // build_phase
    
    function void connect_phase(uvm_phase phase);

    endfunction // connect_phase
        
    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this, "run phase");
        
        `uvm_info("STATUS", "starting test", UVM_MEDIUM)

        for (int i=0; i<40; i=i+1) begin
            @(posedge dut_if_t_c.clk);
            dut_if_t_c.cmd <= 'h3;
            dut_if_t_c.adr <= $urandom_range(15,5);
            dut_if_t_c.data <= $urandom_range(7,0);        
        end
        
        phase.drop_objection(this, "run phase");

    endtask // main_phase
    
endclass // TB2_test
