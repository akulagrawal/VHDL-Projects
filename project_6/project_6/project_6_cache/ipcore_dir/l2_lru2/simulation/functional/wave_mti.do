
 
 
 




onerror {resume}
quietly WaveActivateNextPane {} 0

      add wave -noupdate /l2_lru2_tb/status
      add wave -noupdate /l2_lru2_tb/l2_lru2_synth_inst/bmg_port/CLKA
      add wave -noupdate /l2_lru2_tb/l2_lru2_synth_inst/bmg_port/ADDRA
      add wave -noupdate /l2_lru2_tb/l2_lru2_synth_inst/bmg_port/DINA
      add wave -noupdate /l2_lru2_tb/l2_lru2_synth_inst/bmg_port/WEA
      add wave -noupdate /l2_lru2_tb/l2_lru2_synth_inst/bmg_port/DOUTA

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 197
configure wave -valuecolwidth 106
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {9464063 ps}