## Method for Generating Unique Class Based Covergroups to Enable Meaningful Covergroup Merges Across Testbenches

## Authors

Eldon Nelson M.S. P.E. (eldon_nelson@ieee.org)

## Files for SystemVerilog Solution
| File                                                                    | Description |
| ---------------------------------                                       | ----------- |
|[svsolution/dut.sv](svsolution/dut.sv)                                   | the DUT (design under test) |
|[svsolution/dut_if.sv](svsolution/dut_if.sv)                             | the interface for the DUT |
|[svsolution/covemb_pkg.sv](svsolution/covemb_pkg.sv)                     | coverage class definition |
|[svsolution/covemb_pkg_fcn.svh](svsolution/covemb_pkg_fcn.svh)           | `included repeated functions new() and sample() |
|[svsolution/dut_if_cg.svh](svsolution/dut_if_cg.svh)                     | `included covergroup |
|[svsolution/TB0.sv](svsolution/TB0.sv)                                   | testbench TB0 |
|[svsolution/TB1.sv](svsolution/TB1.sv)                                   | testbench TB1 |
|[svsolution/TB2.sv](svsolution/TB2.sv)                                   | testbench TB2 |
|[svsolution/svsolution_testplan.xml](svsolution/svsolution_testplan.xml) | Questa XML Testplan |

## Command Lines for Mentor Questa to Run for SystemVerilog Solution
```shell
cd svsolution
vsim -do "compile.do"
```

## UML Diagram for SystemVerilog Solution

![UML Diagram for SystemVerilog Solution][svsolution/img/covemb_pkg.png]

## TB Designs for SystemVerilog Solution

#### TB0

```
exercised cmd: 1
exercised adr: 1,2
```

![TB0][svsolution/img/TB0.png]

#### TB1

```
exercised cmd: 2
exercised adr: 3,4
```

![TB1][svsolution/img/TB1.png]

#### TB2

```
exercised cmd: 3
exercised adr: 5,6
```

![TB2][svsolution/img/TB2.png]

