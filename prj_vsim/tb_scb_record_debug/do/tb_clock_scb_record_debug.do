onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work tb_clock_scb_record_debug
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


# add wave -noupdate -radix binary /tb_clock_scb_record_debug/clk_200M_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/clk_125M_i
add wave -noupdate -radix binary /tb_clock_scb_record_debug/clk_50M_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/bs_pl_dip_sw
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/bs_pl_led_out
add wave -noupdate -color yellow -itemcolor yellow  -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_axis_tvalid
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_axis_tready
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_axis_tlast
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_axis_tkeep
add wave -noupdate -radix unsigned /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_axis_tdata
add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_axis_tdata
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_record_data
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/s_tstart
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/reset_2_n
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/reset_1_n
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/Clk
add wave -noupdate -color yellow -itemcolor yellow  -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tstart
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tstart_i
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tstart_i_i
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tstart_i_i_i
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tenable
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tvalid
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tready
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tlast
add wave -noupdate -radix unsigned /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_taddr
add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_taddr
add wave -noupdate -radix unsigned /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tdata_o
add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tdata_o
add wave -noupdate -radix unsigned /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tdata_i
add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tdata_i
add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/rd_tdata_i_i
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/q_sel_pre
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/q_latch
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/tProgramCount
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/tch_data_enable
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/idx_n_sincos
add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/reset_n
add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_record_gen_0/m_record_data_r
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/clk_200M
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/clk_125M
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/clk_50M
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_pl_dip_sw_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_pl_led_out_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/reset_n
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/tpulse_us
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/tpulse_5us
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/tpulse_10us
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/tpulse_10ms
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/tpulse_5sec
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tvalid_bs_scb_record_gen_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tlast_bs_scb_record_gen_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tkeep_bs_scb_record_gen_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tdata_bs_scb_record_gen_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_record_data_bs_scb_record_gen_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/ila_data_bs_ila_debug_0
# add wave -noupdate -color yellow -itemcolor yellow -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tvalid_bs_ram_saxis_2_maxis_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tready_bs_ram_saxis_2_maxis_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tlast_bs_ram_saxis_2_maxis_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tkeep_bs_ram_saxis_2_maxis_0
# add wave -noupdate -radix unsigned /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tdata_bs_ram_saxis_2_maxis_0
# add wave -noupdate -radix hexadecimal /tb_clock_scb_record_debug/top_scb_record_debug_0/m_axis_tdata_bs_ram_saxis_2_maxis_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_Reserved_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_TE_TX_TRIG_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_TE_RX_TRIG_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_TX_TRIG_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_TX_P_GATE_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_ReservedBit04_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Trigger_State_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit00_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit01_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit02_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit04_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit12_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit13_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit14_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit15_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit16_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit17_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_PLC_State_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_DAQCounter_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_GainValue_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_PA_FPGA_Temperature_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC_FPGA_Temperature_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_AH_Zynq_Temperature_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_P1_Zynq_Temperature_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SP_P2_Zynq_Temperature_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_SC2SP_GTP_ERR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_AH2P1_GTP_ERR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_AH2P2_GTP_ERR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_P12AH_GTP_ERR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_P22AH_GTP_ERR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_TX_Voltage_Sample1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_TX_Voltage_Sample2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_TX_DC_Voltage_Sample1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_TX_DC_Voltage_Sample2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_TX_DC_Current_Sample1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_TX_DC_Current_Sample2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_State_Reserved_9_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_Enable_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_Detect_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_Closein_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_Fail_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ESAD_Chk_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ESAD_HV_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ESAD_Power_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit08_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit09_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit10_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit11_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_Leakage_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit13_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_ReservedBit14_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_4_M_Stop_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_Beam_Steering_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit04_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit08_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit09_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit10_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit11_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit12_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit13_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit14_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_3_ReservedBit15_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Pre_Enable_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Enable_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_V_Target_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Speed_Mode1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Speed_Mode2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Homming_Enable_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Homming_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Inhibit_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Hold_In_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Target_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Target_Loss_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_ACM_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_ACO_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_ReservedBit14_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_2_ReservedBit15_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_ReservedBit00_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_HILS_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_EXHD_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_C_Range_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_E_Range_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Close_In_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Terminal_Homing_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Fire_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_EOM_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Motor_Start_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Motor_Stop_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Ceiling_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Floor_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_Surface_Det_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Event_1_EOR_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_PLC_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_AD_On_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_ReservedBit02_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_ReservedBit03_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Pre_Enable_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Enable_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Salvo_On_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Band_Sel_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Mode_Set_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_PRI_Start_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Test_Mode_Set_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_REC_Disable_Set_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_Test_Trig_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Command_ReservedBit15_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_GC_Count_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Reserved_0_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Speed_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Search_Pattern_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Pulse_Freq_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Pulse_Type_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Pulse_Length_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_PRE_Pulse_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_PRI_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Beam_Steering_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_BAT_VOLT_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Reserved_1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_TORP_N_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_TORP_E_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_TORP_D_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_TORP_Roll_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_TORP_Pitch_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_TORP_Yaw_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_ACT_On_Off_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_GC_INFO_Reserved_2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R3_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R0_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_C_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L0_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Optic_On_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L3_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Reserved_0_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_FPGA_CMD_Reserved_1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Start_Bytes_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Count_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Command_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_ACK_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Checksum_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Stop_Bytes_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_1_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_2_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_3_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_4_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_5_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_6_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_7_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_8_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_9_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_10_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_11_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_12_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_13_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_14_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_15_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_16_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_17_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_18_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_19_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_20_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_21_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_22_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_23_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_24_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_25_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_26_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_27_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_28_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_29_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_30_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_31_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_32_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_33_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_34_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_35_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_36_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/pkt_Data_CH_Data_37_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bitvector_o
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_reset_n_0/reset_n
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_reset_n_0/Clk
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_reset_n_0/reset_n_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_reset_n_0/bit_idx_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/tpulse_5us
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/Clk
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/tstart_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/tstart_i_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/bit_idx_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/tvalid
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/tpulse_5us_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/tpulse_5us_i_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_5usec_0/bit_idx_5us_i
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tvalid
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tlast
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tkeep
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tdata
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/ila_data
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/reset_n
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/Clk
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/ila_data_r
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_ila_debug_0/Chan_Pkt_r
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_Reserved
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_TE_TX_TRIG
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_TE_RX_TRIG
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_TX_TRIG
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_TX_P_GATE
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_ReservedBit04
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Trigger_State_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit00
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit01
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit02
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit04
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit12
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit13
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit14
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit15
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit16
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit17
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_PLC_State
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_DAQCounter
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_GainValue
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_PA_FPGA_Temperature
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC_FPGA_Temperature
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_AH_Zynq_Temperature
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_P1_Zynq_Temperature
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SP_P2_Zynq_Temperature
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_SC2SP_GTP_ERR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_AH2P1_GTP_ERR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_AH2P2_GTP_ERR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_P12AH_GTP_ERR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_P22AH_GTP_ERR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_TX_Voltage_Sample1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_TX_Voltage_Sample2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_TX_DC_Voltage_Sample1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_TX_DC_Voltage_Sample2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_TX_DC_Current_Sample1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_TX_DC_Current_Sample2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_State_Reserved_9
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_Enable
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_Detect
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_Closein
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_Fail
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ESAD_Chk
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ESAD_HV
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ESAD_Power
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit08
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit09
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit10
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit11
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_Leakage_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit13
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_ReservedBit14
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_4_M_Stop
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_Beam_Steering
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit04
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit08
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit09
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit10
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit11
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit12
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit13
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit14
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_3_ReservedBit15
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Pre_Enable
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Enable
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_V_Target
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Speed_Mode1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Speed_Mode2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Homming_Enable
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Homming_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Inhibit
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Hold_In
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Target_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Target_Loss
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_ACM_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_ACO_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_ReservedBit14
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_2_ReservedBit15
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_ReservedBit00
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_HILS_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_EXHD_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_C_Range
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_E_Range
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Close_In
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Terminal_Homing
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Fire
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_EOM
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Motor_Start
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Motor_Stop
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Ceiling_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Floor_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_Surface_Det
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Event_1_EOR
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_PLC
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_AD_On
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_ReservedBit02
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_ReservedBit03
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Pre_Enable
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Enable
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Salvo_On
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Band_Sel
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Mode_Set
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_PRI_Start
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Test_Mode_Set
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_REC_Disable_Set
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_Test_Trig
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Command_ReservedBit15
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_GC_Count
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Reserved_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Speed_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Search_Pattern
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Pulse_Freq
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Pulse_Type
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Pulse_Length
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_PRE_Pulse
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_PRI
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Beam_Steering
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_BAT_VOLT
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Reserved_1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_TORP_N
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_TORP_E
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_TORP_D
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_TORP_Roll
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_TORP_Pitch
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_TORP_Yaw
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_ACT_On_Off
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_GC_INFO_Reserved_2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R3
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_C
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Optic_On
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L3
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Reserved_0
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_FPGA_CMD_Reserved_1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Start_Bytes
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Count
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Command
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_ACK
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Checksum
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Stop_Bytes
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_1
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_2
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_3
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_4
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_5
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_6
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_7
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_8
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_9
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_10
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_11
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_12
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_13
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_14
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_15
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_16
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_17
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_18
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_19
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_20
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_21
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_22
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_23
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_24
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_25
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_26
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_27
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_28
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_29
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_30
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_31
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_32
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_33
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_34
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_35
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_36
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/pkt_Data_CH_Data_37
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/bitvector
# add wave -noupdate -radix binary /tb_clock_scb_record_debug/top_scb_record_debug_0/bs_scb_data_record_pin_0/Chan_Pkt
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
WaveRestoreZoom {0 ps} {6 us}
run 6 us
