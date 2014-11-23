onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group t_a /TB0/dut_if_t_a/clk
add wave -noupdate -expand -group t_a /TB0/dut_if_t_a/cmd
add wave -noupdate -expand -group t_a /TB0/dut_if_t_a/adr
add wave -noupdate -expand -group t_a /TB0/dut_if_t_a/data
add wave -noupdate -expand -group t_a /TB0/dut_if_t_a/c
add wave -noupdate -expand -group a_b /TB0/dut_if_a_b/clk
add wave -noupdate -expand -group a_b /TB0/dut_if_a_b/cmd
add wave -noupdate -expand -group a_b /TB0/dut_if_a_b/adr
add wave -noupdate -expand -group a_b /TB0/dut_if_a_b/data
add wave -noupdate -expand -group a_b /TB0/dut_if_a_b/c
add wave -noupdate -expand -group b_c /TB0/dut_if_b_c/clk
add wave -noupdate -expand -group b_c /TB0/dut_if_b_c/cmd
add wave -noupdate -expand -group b_c /TB0/dut_if_b_c/adr
add wave -noupdate -expand -group b_c /TB0/dut_if_b_c/data
add wave -noupdate -expand -group b_c /TB0/dut_if_b_c/c
add wave -noupdate -expand -group c /TB0/dut_if_c/cmd
add wave -noupdate -expand -group c /TB0/dut_if_c/adr
add wave -noupdate -expand -group c /TB0/dut_if_c/data
add wave -noupdate -expand -group c /TB0/dut_if_c/c
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {558 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 311
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {274 ns} {806 ns}
