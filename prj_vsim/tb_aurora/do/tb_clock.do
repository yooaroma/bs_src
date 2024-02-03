onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work tb_clock
delete wave *
quietly WaveActivateNextPane {} 0
#
# -color yellow -itemcolor yellow orange white
# -radix binary -radix decimal -radix unsigned hexadecimal
# add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /tb_bs_main/bf_dir_odata(0)
#
add wave -noupdate -radix binary /tb_clock/clk_200M_i
add wave -noupdate -radix binary /tb_clock/clk_125M_i
add wave -noupdate -radix binary /tb_clock/clk_50M_i
#
add wave -noupdate /tb_clock/top_aurora_i/bs_cnt_0/tpulse_out
add wave -noupdate /tb_clock/top_aurora_i/bs_cnt_1/tpulse_out
#
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
#
#
#
#
#
#
#
#
#
#
#
#
# add wave -noupdate -radix binary /tb_clock/clk_200M_i
# add wave -noupdate -radix binary /tb_clock/clk_125M_i
# add wave -noupdate -radix binary /tb_clock/clk_50M_i
# add wave -noupdate -radix binary /tb_clock/bs_pl_dip_sw
# add wave -noupdate -radix binary /tb_clock/bs_pl_led_out
# add wave -noupdate -radix binary /tb_clock/s_axis_0_bs_aurora_atx_tvalid_i
# add wave -noupdate -radix binary /tb_clock/s_axis_0_bs_aurora_atx_tready_i
# add wave -noupdate -radix binary /tb_clock/s_axis_0_bs_aurora_atx_tlast_i
# add wave -noupdate -radix binary /tb_clock/s_axis_0_bs_aurora_atx_tdata_i
# add wave -noupdate -radix binary /tb_clock/m_axis_0_bs_aurora_atx_tvalid_i
# add wave -noupdate -radix binary /tb_clock/m_axis_0_bs_aurora_atx_tlast_i
# add wave -noupdate -radix binary /tb_clock/m_axis_0_bs_aurora_atx_tdata_i
# add wave -noupdate -radix binary /tb_clock/s_axis_1_bs_aurora_atx_tvalid_i
# add wave -noupdate -radix binary /tb_clock/s_axis_1_bs_aurora_atx_tready_i
# add wave -noupdate -radix binary /tb_clock/s_axis_1_bs_aurora_atx_tlast_i
# add wave -noupdate -radix binary /tb_clock/s_axis_1_bs_aurora_atx_tdata_i
# add wave -noupdate -radix binary /tb_clock/m_axis_1_bs_aurora_atx_tvalid_i
# add wave -noupdate -radix binary /tb_clock/m_axis_1_bs_aurora_atx_tlast_i
# add wave -noupdate -radix binary /tb_clock/m_axis_1_bs_aurora_atx_tdata_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_0_bs_aurora_atx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_0_bs_aurora_atx_tready
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_0_bs_aurora_atx_tlast
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_0_bs_aurora_atx_tdata
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_axis_0_bs_aurora_atx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_axis_0_bs_aurora_atx_tlast
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_axis_0_bs_aurora_atx_tdata
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_1_bs_aurora_atx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_1_bs_aurora_atx_tready
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_1_bs_aurora_atx_tlast
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_axis_1_bs_aurora_atx_tdata
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_axis_1_bs_aurora_atx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_axis_1_bs_aurora_atx_tlast
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_axis_1_bs_aurora_atx_tdata
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/clk_200M
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/clk_125M
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/clk_50M
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_pl_dip_sw_0
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/bs_pl_led_out_0
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_dip_0_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_dip_1_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_dip_2_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_dip_3_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_led_0_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_led_1_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_led_2_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_led_3_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/aurora_reset_n
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/aurora_gt_reset_n
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/vcc_out
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/gnd_out
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/tpulse_5us
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/tpulse_5us_i
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_rd_bs_aurora_atx_tstart_bs_aurora_atx_ext_1
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_rd_bs_aurora_atx_taddr_bs_aurora_atx_ext_1
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_rd_bs_aurora_atx_tdata_bs_aurora_atx_ext_1
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/m_rd_bs_aurora_ram_tnext_bs_aurora_ram_0
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_rd_bs_aurora_ram_taddr_bs_aurora_ram_0
# add wave -noupdate -radix binary /tb_clock/top_aurora_i/s_rd_bs_aurora_ram_tdata_bs_aurora_ram_0
##
##
##
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13494 ps} 0}
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
run 6 us
