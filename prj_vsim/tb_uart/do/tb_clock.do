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
add wave -noupdate -radix binary /tb_clock/clk_200M_i
add wave -noupdate -radix binary /tb_clock/bs_pl_dip_sw
add wave -noupdate -radix binary /tb_clock/bs_pl_led_out
add wave -noupdate -radix binary /tb_clock/top_uart_i/reset_n
add wave -noupdate -radix binary /tb_clock/top_uart_i/vcc_out
add wave -noupdate -radix binary /tb_clock/top_uart_i/gnd_out
add wave -noupdate -radix binary /tb_clock/top_uart_i/a_rxd
add wave -noupdate -radix binary /tb_clock/top_uart_i/b_rxd
add wave -noupdate -radix binary /tb_clock/top_uart_i/c_rxd
add wave -noupdate -radix binary /tb_clock/top_uart_i/d_rxd
add wave -noupdate -radix binary /tb_clock/top_uart_i/a_txd
add wave -noupdate -radix binary /tb_clock/top_uart_i/b_txd
add wave -noupdate -radix binary /tb_clock/top_uart_i/c_txd
add wave -noupdate -radix binary /tb_clock/top_uart_i/d_txd
#add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_uart_i/tpulse_5us
#add wave -noupdate -radix binary /tb_clock/top_uart_i/tpulse_5us_i
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_uart_i/tpulse_ms
#
add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/m_axis_bs_uart_atx_tvalid
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/m_axis_bs_uart_atx_tready
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/m_axis_bs_uart_atx_tlast
add wave -noupdate -color yellow -itemcolor yellow -radix unsigned /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/m_axis_bs_uart_atx_tdata
add wave -noupdate -color yellow -itemcolor yellow -radix hexadecimal /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/m_axis_bs_uart_atx_tdata
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/m_bs_uart_txd
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/s_bs_uart_rxd
# add wave -noupdate -color orange -itemcolor orange -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tlast
# add wave -noupdate -color orange -itemcolor orange -radix unsigned /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tdata
# add wave -noupdate -color orange -itemcolor orange -radix hexadecimal /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tdata
# #
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_2/s_bs_uart_rxd
# add wave -noupdate -color orange -itemcolor orange -radix binary /tb_clock/top_uart_i/bs_uart_rx_2/m_axis_bs_uart_rx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_2/m_axis_bs_uart_rx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_2/rx_tready_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_2/rx_tready_n_i
# add wave -noupdate -color orange -itemcolor orange -radix unsigned /tb_clock/top_uart_i/bs_uart_rx_2/m_axis_bs_uart_rx_tdata
# add wave -noupdate -color orange -itemcolor orange -radix hexadecimal /tb_clock/top_uart_i/bs_uart_rx_2/m_axis_bs_uart_rx_tdata
# #
# add wave -noupdate -color orange -itemcolor orange -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pstart
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_paddr
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_paddr
# add wave -noupdate -color orange -itemcolor orange -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_psel
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_penable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pwrite
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pwdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pready(0)
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pready(1)
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_prdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pslverr(0)
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_axi_aresetn
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_axi_aclk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pstart_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/s_apb_pstart_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/tread
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_psel
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_penable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_pwrite
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_pready(0)
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_pready(1)
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_paddr
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_paddr
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_pwdata
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_apb_rw_3/t_prdata
#
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/s_rd_bs_uart_tx_tstart
add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_rd_3/s_rd_bs_uart_tx_taddr
add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_rd_3/s_rd_bs_uart_tx_tdata
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/m_bs_uart_tx_done
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/m_bs_uart_txd
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/reset_n
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/r_SM_Main
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/r_Clk_Count
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/r_Bit_Index
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/r_TX_Data
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/r_TX_Done
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/o_TX_Active
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/o_TX_Done
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/i_TX_DV
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_taddr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tstart_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tenable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tready_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_tlast_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/m_bs_uart_tx_done_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_rd_3/rd_cnt
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_paddr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_psel
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_penable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_pwrite
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_pwdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_pready
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_prdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_pslverr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_axi_aresetn
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_axi_aclk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/m_rd_bs_uart_ram_tx_apb_tnext
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_rd_bs_uart_ram_tx_apb_taddr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_rd_bs_uart_ram_tx_apb_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/Clk_rd
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/RAM
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/wr_taddr_i
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/wr_taddr_high
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/wr_taddr_high_i
add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/rd_taddr_high
add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/rd_taddr_bank_i
add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/rd_taddr_i
add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/rd_tdata_i
add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/rd_tdata_all_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_axis_bs_uart_ram_tx_apb_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_axis_bs_uart_ram_tx_apb_tlast_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_axis_bs_uart_ram_tx_apb_tlast_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_ram_tx_apb_3/s_apb_pready_i
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/s_bs_uart_rxd
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_SM_Main
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Data_R
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Data_R_R
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Data
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_Clk_Count
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_Bit_Index
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Byte
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_DV
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_LAST
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_tready_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_tready_n_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_cnt
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/uart_rx_filter
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/m_axis_bs_uart_rx_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/s_bs_uart_rxd
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_SM_Main
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Data_R
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Data_R_R
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Data
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_Clk_Count
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_Bit_Index
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_Byte
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_DV
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/r_RX_LAST
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_tready_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_tready_n_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/rx_cnt
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_rx_i/uart_rx_filter
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tready
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/m_bs_uart_txd
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_SM_Main
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/r_Clk_Count
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/r_Bit_Index
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_TX_Data
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_TX_Done
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/o_TX_Active
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/o_TX_Done
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/i_TX_DV
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/rd_taddr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tstart_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tenable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tready_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tlast_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/m_bs_uart_tx_done
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/rd_tdata
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/rd_cnt
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_tready
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_taddr
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_tdata
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/RAM
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_tx_i/wr_taddr_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/wr_taddr_high
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_taddr_high
#
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tready
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_axis_bs_uart_tx_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/m_bs_uart_txd
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_SM_Main
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_Clk_Count
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_Bit_Index
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_TX_Data
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/r_TX_Done
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/o_TX_Active
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/o_TX_Done
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/i_TX_DV
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_taddr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tstart_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tenable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tready_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tlast
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_cnt
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_tready
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_taddr
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/s_rd_bs_uart_tx_tdata
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/RAM
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/wr_taddr_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/wr_taddr_high
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_tx_i/rd_taddr_high
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/s_rd_bs_uart_atx_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tstart
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tstart_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tenable
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tready
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tlast
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_taddr
# add wave -noupdate -color yellow -itemcolor yellow -radix unsigned /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tdata_o
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tdata_o
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tdata_i
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tdata_i_i
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/rd_tdata_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/q_sel_pre
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/q_latch
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/tProgramCount
# add wave -noupdate -radix hexadecimal /tb_clock/top_uart_i/bs_uart_atx_data_ramp_gen_i/tProgramCount
#
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_ms
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_5us
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/start_n_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/start_n_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_ms_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_ms_i_i
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_msec_i/bit_idx_i
# add wave -noupdate -radix unsigned /tb_clock/top_uart_i/bs_msec_i/bit_idx_sub_i
#
# add wave -noupdate -radix binary /tb_clock/clk_200M_i
# add wave -noupdate -radix binary /tb_clock/clk_125M_i
# add wave -noupdate -radix binary /tb_clock/clk_50M_i
# add wave -noupdate -radix binary /tb_clock/bs_pl_dip_sw
# add wave -noupdate -radix binary /tb_clock/bs_pl_led_out
# add wave -noupdate -radix binary /tb_clock/top_uart_i/clk_200M
# add wave -noupdate -radix binary /tb_clock/top_uart_i/clk_125M
# add wave -noupdate -radix binary /tb_clock/top_uart_i/clk_50M
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_pl_dip_sw_0
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_pl_led_out_0
# add wave -noupdate -radix binary /tb_clock/top_uart_i/m_dip_0_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/m_dip_1_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/m_dip_2_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/m_dip_3_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/s_led_0_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/s_led_1_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/s_led_2_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/s_led_3_bs_sw_led_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/vcc_out
# add wave -noupdate -radix binary /tb_clock/top_uart_i/gnd_out
# add wave -noupdate -radix binary /tb_clock/top_uart_i/tpulse_5us
# add wave -noupdate -radix binary /tb_clock/top_uart_i/tpulse_5us_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/tpulse_ms
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_expansion_i/tpulse_out
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_expansion_i/tpulse_in
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_expansion_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_expansion_i/bit_idx_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_ms
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_5us
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/start_n_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/start_n_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_ms_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/tpulse_ms_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/bit_idx_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_msec_i/bit_idx_sub_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/tpulse_5us
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/tstart_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/tstart_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/bit_idx_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/tvalid
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/tpulse_5us_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/tpulse_5us_i_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_5usec_i/bit_idx_5us_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_reset_n_i/reset_n
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_reset_n_i/Clk
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_reset_n_i/reset_n_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_reset_n_i/bit_idx_i
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/vcc_out
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/gnd_out
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/m_dip_0
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/m_dip_1
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/m_dip_2
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/m_dip_3
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/s_dip_in
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/s_led_0
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/s_led_1
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/s_led_2
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/s_led_3
# add wave -noupdate -radix binary /tb_clock/top_uart_i/bs_sw_led_i/m_led_out
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
WaveRestoreZoom {0 ps} {6 ms}
run 6 ms
