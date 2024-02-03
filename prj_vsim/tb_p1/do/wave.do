onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_200M
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_125M
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/clk_50M
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_fft32k_i/tpulse_5us
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/gt_reset_n
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/reset_n
add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_clock_i/bit_idx_i
add wave -noupdate -radix unsigned /tb_clock/top_fft32k_i/p1_clock_i/bit_idx_5us_i
add wave -noupdate /tb_clock/top_fft32k_i/p1_main_i/m_axis_cmd_tvalid
add wave -noupdate /tb_clock/top_fft32k_i/p1_main_i/m_axis_cmd_tlast
add wave -noupdate /tb_clock/top_fft32k_i/p1_main_i/m_axis_cmd_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_00_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_01_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_02_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_03_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_04_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_05_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_06_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_07_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_08_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_09_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_10_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_11_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_12_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_13_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_14_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_15_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_16_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_17_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_axis_bit_18_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_rd_p1_main_taddr
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/m_rd_p1_main_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/s_p1_main_tstart
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/reset_n
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/Clk
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_taddr
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/wr_ch_taddr
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/wr_ch_taddr_bank
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tenable
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tstart
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tstart_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tvalid
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tvalid_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tlast
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tlast_i
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tnext
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tdata
add wave -noupdate -radix binary /tb_clock/top_fft32k_i/p1_main_i/rd_tdata_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1589147 ps} 0}
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
WaveRestoreZoom {1 us} {21 us}
