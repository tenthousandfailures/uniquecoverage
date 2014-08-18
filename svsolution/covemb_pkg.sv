package covemb_pkg;

    string pkg_prefix = "covemb_pkg::";

// TODO make some type of class to subscribe these together
virtual class proto;

    string name = "proto";
    string comment = "proto comment";

    function new(ref logic [3:0] adr, ref logic [3:0] cmd, ref string inst_name);
    endfunction

    function void sample();
    endfunction

endclass

// TODO make some type of class to subscribe these together
class base extends proto;

    string name = {pkg_prefix, "base"};
    string comment = "covemb::base default comment";

   `include "dut_if_cg.svh"
   `include "covemb_pkg_fcn.svh"

endclass

// TODO a better way to do this - macro? pattern
// TODO for Questa - if you could parameterize this might not be needed
class t_a extends base;

    string name = {pkg_prefix, "t_a"};
    string comment = "t_a comment";

   `include "dut_if_cg.svh"
   `include "covemb_pkg_fcn.svh"

endclass

class t_b extends base;

    string name = {pkg_prefix, "t_a"};

    `include "dut_if_cg.svh"
    `include "covemb_pkg_fcn.svh"

endclass

class t_c extends base;

    string name = {pkg_prefix, "t_c"};

    `include "dut_if_cg.svh"
    `include "covemb_pkg_fcn.svh"

endclass

class a_b extends base;

    string name = {pkg_prefix, "t_b"};

    `include "dut_if_cg.svh"
    `include "covemb_pkg_fcn.svh"

endclass

class b_c extends base;

    string name = {pkg_prefix, "b_c"};

    `include "dut_if_cg.svh"
    `include "covemb_pkg_fcn.svh"

endclass

class c extends base;

    string name = {pkg_prefix, "c"};

    `include "dut_if_cg.svh"
    `include "covemb_pkg_fcn.svh"

endclass

endpackage