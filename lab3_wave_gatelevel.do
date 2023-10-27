onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_lab3_gate/sim_SW
add wave -noupdate /tb_lab3_gate/sim_KEY
add wave -noupdate /tb_lab3_gate/sim_HEX0
add wave -noupdate /tb_lab3_gate/sim_HEX1
add wave -noupdate /tb_lab3_gate/sim_HEX2
add wave -noupdate /tb_lab3_gate/sim_HEX3
add wave -noupdate /tb_lab3_gate/sim_HEX4
add wave -noupdate /tb_lab3_gate/sim_HEX5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {250 ps}
