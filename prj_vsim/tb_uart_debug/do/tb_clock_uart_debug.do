onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work tb_clock_uart_debug
delete wave *
quietly WaveActivateNextPane {} 0
#
# -color yellow -itemcolor yellow orange white
# -radix binary -radix decimal -radix unsigned hexadecimal
# add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /tb_bs_main/bf_dir_odata(0)
#
#
#
add wave -noupdate /tb_clock_uart_debug/a_rxd_i
add wave -noupdate /tb_clock_uart_debug/a_txd_i
add wave -noupdate /tb_clock_uart_debug/clk_200M_i
# add wave -noupdate /tb_clock_uart_debug/clk_125M_i
# add wave -noupdate /tb_clock_uart_debug/clk_50M_i
# add wave -noupdate /tb_clock_uart_debug/bs_pl_dip_sw
# add wave -noupdate /tb_clock_uart_debug/bs_pl_led_out
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/a_rxd
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/a_txd
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/clk_200M
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/clk_125M
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/clk_50M
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_pl_dip_sw_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_pl_led_out_0
add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/reset_n
add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/tpulse_5us
add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/tpulse_10us
add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/tpulse_10ms
add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/tpulse_5sec
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_aurora_atx_tready_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_bs_uart_tx_done_bs_uart_tx_rd_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_uart_rx_tvalid_bs_uart_rx_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_uart_rx_tlast_bs_uart_rx_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_uart_rx_tkeep_bs_uart_rx_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_axis_bs_uart_rx_tdata_bs_uart_rx_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_axis_bs_uart_ram_tvalid_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_axis_bs_uart_ram_tlast_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_axis_bs_uart_ram_tkeep_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_axis_bs_uart_ram_tdata_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/m_rd_bs_uart_ram_tnext_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_rd_bs_uart_ram_taddr_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/s_rd_bs_uart_ram_tdata_bs_uart_ram_0
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_reset_n_0/reset_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_reset_n_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_reset_n_0/reset_n_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_reset_n_0/bit_idx_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/tpulse_5us
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/tstart_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/tstart_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/bit_idx_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/tpulse_5us_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/tpulse_5us_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_5usec_0/bit_idx_5us_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/tpulse_5us
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/tstart_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/tstart_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/bit_idx_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/tpulse_5us_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/tpulse_5us_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_usec_0/bit_idx_5us_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/tpulse_out
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/tpulse_in
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/start_init_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/start_n_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/start_n_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/tpulse_out_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/tpulse_out_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_0/bit_idx_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/tpulse_out
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/tpulse_in
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/start_init_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/start_n_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/start_n_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/tpulse_out_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/tpulse_out_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_cnt_1/bit_idx_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tready
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tkeep
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/s_rd_bs_aurora_atx_tstart
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/reset_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tstart
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tstart_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tenable
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tready
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_taddr
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_o
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/rd_tdata_i_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/q_sel_pre
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/q_latch
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/tProgramCount
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/tch_data_enable
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_aurora_atx_data_ramp_gen_0/idx_n_sincos
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_axis_bs_uart_ram_tx_32_tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_axis_bs_uart_ram_tx_32_tready
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_axis_bs_uart_ram_tx_32_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_axis_bs_uart_ram_tx_32_tkeep
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_axis_bs_uart_ram_tx_32_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/m_rd_bs_uart_ram_tx_32_tnext
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_rd_bs_uart_ram_tx_32_taddr
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/s_rd_bs_uart_ram_tx_32_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/reset_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/Clk_rd
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/RAM
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/wr_taddr_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/rd_taddr_bank_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/rd_taddr_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/rd_tdata_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_tx_32_debug_0/rd_tdata_all_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/s_rd_bs_uart_tx_tstart
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/s_rd_bs_uart_tx_taddr
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/s_rd_bs_uart_tx_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/m_bs_uart_tx_done
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/m_bs_uart_txd
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/reset_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/r_SM_Main
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/r_Clk_Count
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/r_Bit_Index
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/r_TX_Data
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/r_TX_Done
# add wave -noupdate -radix binary /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/o_TX_Active
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/o_TX_Done
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/i_TX_DV
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_taddr
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tstart
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tstart_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tenable
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tready_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_tlast_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/m_bs_uart_tx_done_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_tx_rd_0/rd_cnt
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/m_axis_bs_uart_rx_tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/m_axis_bs_uart_rx_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/m_axis_bs_uart_rx_tkeep
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/m_axis_bs_uart_rx_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/s_bs_uart_rxd
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/reset_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_SM_Main
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_RX_Data_R
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_RX_Data_R_R
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_RX_Data
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_Clk_Count
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_Bit_Index
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_RX_Byte
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_RX_DV
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/r_RX_LAST
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/rx_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/rx_tready_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/rx_tready_n_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/rx_cnt
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_rx_0/uart_rx_filter
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/s_axis_bs_uart_ram_tvalid
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/s_axis_bs_uart_ram_tlast
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/s_axis_bs_uart_ram_tkeep
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/s_axis_bs_uart_ram_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/m_rd_bs_uart_ram_tnext
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/s_rd_bs_uart_ram_taddr
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/s_rd_bs_uart_ram_tdata
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/reset_n
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/Clk
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/wr_taddr_i
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/wr_taddr_high
# add wave -noupdate /tb_clock_uart_debug/top_uart_debug_i/bs_uart_ram_0/rd_taddr_high
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
WaveRestoreZoom {0 ps} {6 ms}
run 6 ms
