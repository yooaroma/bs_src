onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work tb_clock_ila_debug
delete wave *
quietly WaveActivateNextPane {} 0
#
# -color yellow -itemcolor yellow orange white
# -radix binary -radix decimal -radix unsigned hexadecimal
# add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /tb_bs_main/bf_dir_odata(0)
#
#
#
add wave -noupdate -radix binary /tb_clock_ila_debug/clk_200M_i
# add wave -noupdate -radix binary /tb_clock_ila_debug/clk_125M_i
# add wave -noupdate -radix binary /tb_clock_ila_debug/clk_50M_i
# add wave -noupdate -radix binary /tb_clock_ila_debug/bs_pl_dip_sw
# add wave -noupdate -radix binary /tb_clock_ila_debug/bs_pl_led_out
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/s_axis_bs_aurora_ram_tvalid
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/s_axis_bs_aurora_ram_tlast
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/s_axis_bs_aurora_ram_tkeep
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/s_axis_bs_aurora_ram_tdata
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/ila_data
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/reset_n
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/Clk
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/ila_data_r
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_ila_ram_debug_0/Chan_Pkt_r
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/clk_200M
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/clk_125M
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/clk_50M
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_pl_dip_sw_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_pl_led_out_0
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/reset_n
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/tpulse_us
add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/tpulse_5us
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/tpulse_10us
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/tpulse_10ms
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/tpulse_5sec

# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tvalid
# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tlast
# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tkeep
# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/s_axis_bs_aurora_ram_tdata
# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/ila_data
# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/reset_n
# add wave -noupdate /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Clk
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/ila_data_r
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r
#
add wave -noupdate -radix hexadecimal -childformat {{/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Start_Bytes -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Count -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Command -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.ACK -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.FPGA_CMD -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.GC_INFO -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.FPGA_State -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.BS_DATA -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Checksum -radix hexadecimal} {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Stop_Bytes -radix hexadecimal}} -expand -subitemconfig {/tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Start_Bytes {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Count {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Command {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.ACK {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.FPGA_CMD {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.GC_INFO {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.FPGA_State {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.BS_DATA {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Checksum {-radix hexadecimal} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r.Stop_Bytes {-radix hexadecimal}} /tb_clock_ila_debug/top_ila_debug_0/bs_ila_debug_0/Chan_Pkt_r
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_01
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_02
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_03
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_04
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_05
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_06
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_07
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_08
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_09
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_10
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_11
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_12
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_13
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_14
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_15
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_16
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_17
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_18
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_19
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_20
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_21
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_22
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_23
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_24
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_25
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_26
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_27
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_28
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_29
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_30
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_31
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_32
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_33
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_34
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_35
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_36
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_ch_data_37
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Start_Bytes
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Count
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Checksum
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Stop_Bytes
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_R3
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_R2
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_R1
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_R0
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_C
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_L0
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_L1
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_L2
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Save_L3
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Optic_On
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_Ethernet_On
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_TE_Data_Input
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/Chan_Str
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/Chan_Pkt_r
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/Chan_Str_r
add wave -noupdate -radix hexadecimal /tb_clock_ila_debug/top_ila_debug_0/bs_scb_data_record_pin_0/rt_CH_Data
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/m_axis_bs_aurora_atx_tready_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/ila_data_bs_ila_ram_debug_0
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tvalid
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tready
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tlast
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tkeep
# add wave -noupdate -radix unsigned /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/m_axis_bs_aurora_atx_tdata
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/s_rd_bs_aurora_atx_tstart
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/reset_n
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/Clk
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tstart
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tstart_i
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tenable
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tvalid
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tready
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tlast
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_taddr
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tdata_o
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tdata_i
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/rd_tdata_i_i
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/q_sel_pre
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/q_latch
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/tProgramCount
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/tch_data_enable
# add wave -noupdate -radix binary /tb_clock_ila_debug/top_ila_debug_0/bs_aurora_atx_data_ramp_gen_0/idx_n_sincos

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
WaveRestoreZoom {0 ps} {10 us}
run 10 us
