onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work tb_clock
delete wave *
quietly WaveActivateNextPane {} 0
#
# -color yellow -itemcolor yellow orange white
# -radix binary -radix decimal -radix unsigned hexadecimal
# add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /tb_bs_main/bf_dir_odata(0)
#
#
#
#
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_200M
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_125M
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_50M
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_fft32k_i/tpulse_5us
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/gt_reset_n
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/reset_n
add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_clock_i/bit_idx_i
add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_clock_i/bit_idx_5us_i
#
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_rd_p1_main_taddr
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_rd_p1_main_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/s_p1_main_tstart
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/reset_n
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/Clk
add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_main_i/rd_taddr
add wave -noupdate -radix hexadecimal /tb_clock/top_fft32k_i/p1_main_i/rd_taddr
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/wr_ch_taddr
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/wr_ch_taddr_bank
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tenable
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tstart
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tstart_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tvalid
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tvalid_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tlast
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tlast_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tnext
add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_main_i/rd_tdata
add wave -noupdate -radix hexadecimal /tb_clock/top_fft32k_i/p1_main_i/rd_tdata
add wave -noupdate -color yellow -itemcolor yellow -radix unsigned /tb_clock/top_fft32k_i/p1_main_i/rd_tdata_i
add wave -noupdate -radix hexadecimal /tb_clock/top_fft32k_i/p1_main_i/rd_tdata_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_buff32k_0/s_axis_p1_buff32k_tvalid
add wave -noupdate -radix hexadecimal /tb_clock/top_fft32k_i/p1_buff32k_0/s_axis_p1_buff32k_tdata
add wave -noupdate -color yellow -itemcolor yellow  radix unsigned /tb_clock/top_fft32k_i/p1_buff32k_0/tcnt
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_buff32k_0/tnext
#
#add wave -noupdate -radix hexadecimal /tb_clock/top_fft32k_i/p1_main_i/sel_beam_reg
#add wave -noupdate -radix hexadecimal /tb_clock/top_fft32k_i/p1_main_i/sel_beam_bit_reg
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/beam_start
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/sel_beam_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tlast
#add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tdata
#
#add wave -noupdate -radix binary /tb_clock/clk_200M_i
#add wave -noupdate -radix binary /tb_clock/clk_125M_i
#add wave -noupdate -radix binary /tb_clock/clk_50M_i
#add wave -noupdate -radix binary /tb_clock/bs_pl_dip_sw
#add wave -noupdate -radix binary /tb_clock/bs_pl_led_out
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_200M
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_125M
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_50M
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/bs_pl_dip_sw_0
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/bs_pl_led_out_0
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/vcc_out_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/gnd_out_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/m_dip_0_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/m_dip_1_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/m_dip_2_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/m_dip_3_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/s_led_0_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/s_led_1_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/s_led_2_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/s_led_3_p1_clock_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/tpulse_5us
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/gt_reset_n
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/reset_n
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/vcc_out
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/gnd_out
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/m_dip_0
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/m_dip_1
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/m_dip_2
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/m_dip_3
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/s_dip_in
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/s_led_0
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/s_led_1
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/s_led_2
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/s_led_3
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/m_led_out
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/tpulse_5us
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/gt_reset_n
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/reset_n
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/Clk
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/reset_n_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/gt_reset_n_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/tstart_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/tstart_i_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/tpulse_5us_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/tpulse_5us_i_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/bit_idx_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_clock_i/bit_idx_5us_i
#
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_rd_p1_main_taddr
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_rd_p1_main_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/s_p1_main_tstart
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/reset_n
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/Clk
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_taddr
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/wr_ch_taddr
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/wr_ch_taddr_bank
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tenable
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tstart
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tstart_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tvalid
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tvalid_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tlast
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tlast_i
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tnext
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tdata
#add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tdata_i
#
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {20 us}
run 20 us
