## Method for Generating Unique Class Based Covergroups to Enable Improved Covergroup Merges Across Testbenches

## Authors

Eldon Nelson M.S. P.E. (eldon_nelson@ieee.org)

## Files for SystemVerilog Solution
```
svsolution/dut.sv                  the DUT (design under test)
svsolution/dut_if.sv               the interface for the DUT
svsolution/covemb_pkg.sv           coverage class definition
svsolution/covemb_pkg_fcn.svh      `included repeated functions new() and sample()
svsolution/dut_if_cg.svh           `included covergroup
svsolution/TB0.sv                  testbench TB0
svsolution/TB1.sv                  testbench TB1
svsolution/TB2.sv                  testbench TB2
svsolution/svsolution_testplan.xml Questa XML Testplan
```

## Command Lines for Mentor Questa to Run for SystemVerilog Solution
```shell
cd svsolution
vsim -do "compile.do"
```

## TB Designs for SystemVerilog Solution

```
TB0 -> duta -> dutb -> dutc
exercised cmd: 1
exercised adr: 1,2
```

```
TB1 -> dutb -> dutc
exercised cmd: 2
exercised adr: 3,4
```

```
TB2 -> dutc
exercised cmd: 3
exercised adr: 5,6
```
