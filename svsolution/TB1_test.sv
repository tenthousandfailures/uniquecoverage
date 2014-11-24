//----------------
// TB1_test
//----------------
class TB1_test extends uvm_test;
    `uvm_component_utils(TB1_test)

    TB1_pkg::TB1_env env_h;
    dut_if_t_b_t dut_if_t_b;
    dut_if_a_b_t dut_if_a_b;
    dut_if_b_c_t dut_if_b_c;
    dut_if_c_t   dut_if_c;
        
    function new(string name = "TB1_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        env_h = TB1_pkg::TB1_env::type_id::create("env_h", this);       
        if (!uvm_config_db#(dut_if_t_b_t)::get(this, "", "dut_if_t_b", dut_if_t_b)) begin
            `uvm_fatal("TB1_test", "failed to get virtual handle to dut_if_t_b")
        end
        if (!uvm_config_db#(dut_if_b_c_t)::get(this, "", "dut_if_b_c", dut_if_b_c)) begin
            `uvm_fatal("TB1_test", "failed to get virtual handle to dut_if_b_c")
        end
        if (!uvm_config_db#(dut_if_c_t)::get(this, "", "dut_if_c", dut_if_c)) begin
            `uvm_fatal("TB1_test", "failed to get virtual handle to dut_if_c")
        end      

        env_h.dut_if_t_b = dut_if_t_b;
        env_h.dut_if_b_c = dut_if_b_c;
        env_h.dut_if_c   = dut_if_c;

    endfunction // build_phase
    
    function void connect_phase(uvm_phase phase);

    endfunction // connect_phase
        
    virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this, "run phase");
        
        `uvm_info("STATUS", "starting test", UVM_MEDIUM)

        for (int i=0; i<40; i=i+1) begin
            @(posedge dut_if_t_b.clk);
            dut_if_t_b.cmd <= 'h1;
            dut_if_t_b.adr <= $urandom_range(2,1);
            dut_if_t_b.data <= $urandom_range(7,0);        
        end
        
        phase.drop_objection(this, "run phase");

    endtask // main_phase
    
endclass // TB1_test
