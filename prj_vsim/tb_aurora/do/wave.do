onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_clock/clk_200M_i
add wave -noupdate -radix binary /tb_clock/clk_125M_i
add wave -noupdate -radix binary /tb_clock/clk_50M_i
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tvalid
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tready
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tlast
add wave -noupdate -color yellow -itemcolor yellow -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tdata
add wave -noupdate -color yellow -itemcolor yellow -radix hexadecimal /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tdata
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/s_rd_bs_aurora_atx_tstart
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/reset_n
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/Clk
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tstart
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tstart_i
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tenable
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tvalid
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tready
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tlast
add wave -noupdate -color yellow -itemcolor yellow -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_taddr
add wave -noupdate -color yellow -itemcolor yellow -radix hexadecimal /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_taddr
add wave -noupdate -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_o
add wave -noupdate -radix hexadecimal /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_o
add wave -noupdate -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_i
add wave -noupdate -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_i_i
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/q_sel_pre
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/q_latch
add wave -noupdate -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/tProgramCount
add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/tch_data_enable
add wave -noupdate -radix unsigned /tb_clock/top_aurora_i/bs_aurora_atx_data_ramp_gen_0/idx_n_sincos
add wave -noupdate /tb_clock/top_aurora_i/bs_cnt_0/tpulse_out
add wave -noupdate /tb_clock/top_aurora_i/bs_cnt_1/tpulse_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {205928 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {6 us}
