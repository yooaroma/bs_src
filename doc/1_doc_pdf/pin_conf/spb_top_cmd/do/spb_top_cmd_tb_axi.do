#
# -noupdate -color yellow -itemcolor yellow -radix binary      orange white
# -radix binary decimal unsigned  hexadecimal
# add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /tb_bs_main/bf_dir_odata(0)
#
#
onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work spb_top_cmd_tb
delete wave *
quietly WaveActivateNextPane {} 0
#
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/tb_clk
add wave -noupdate /spb_top_cmd_tb/tb_reset_pin_n
add wave -noupdate /spb_top_cmd_tb/tb_reset_cmd
add wave -noupdate /spb_top_cmd_tb/tb_reset_n
#
add wave -noupdate /spb_top_cmd_tb/tb_axi_clock
add wave -noupdate /spb_top_cmd_tb/tb_axi_reset_n
#
add wave -noupdate /spb_top_cmd_tb/tb_pulse_start
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/tb_pulse_5us
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/tb_pulse_5us_i
#
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/s_bf_cmd_reg_ram_tclock_i
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/s_bf_cmd_reg_treset_n_i
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/s_bf_cmd_reg_tnext_o
#
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tenable
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tvaild
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tlast
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_taddr
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tdata
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_sum
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_error_status
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/bf_cmd_reg_i/Chan_Pkt
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/bf_cmd_reg_i/Chan_Str
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/bf_cmd_reg_i/CmdReg_Str
#
#
#add wave -noupdate /spb_top_cmd_tb/tb_clk
#add wave -noupdate /spb_top_cmd_tb/tb_clk_1
#add wave -noupdate /spb_top_cmd_tb/tb_axi_clock
#add wave -noupdate /spb_top_cmd_tb/tb_axi_clock_1
#add wave -noupdate /spb_top_cmd_tb/tb_axi_tstart
#add wave -noupdate /spb_top_cmd_tb/tb_axi_reset_n
#add wave -noupdate /spb_top_cmd_tb/tb_reset_pin_n
#add wave -noupdate /spb_top_cmd_tb/tb_reset_org_n
#add wave -noupdate /spb_top_cmd_tb/tb_reset_org_n_i
#add wave -noupdate /spb_top_cmd_tb/tb_reset_cmd
#add wave -noupdate /spb_top_cmd_tb/tb_reset_cmd_i
#add wave -noupdate /spb_top_cmd_tb/tb_reset_n
#add wave -noupdate /spb_top_cmd_tb/tb_pulse_start
#add wave -noupdate /spb_top_cmd_tb/tb_pulse_start_i
#add wave -noupdate /spb_top_cmd_tb/tb_pulse_5us
#add wave -noupdate /spb_top_cmd_tb/tb_pulse_5us_i
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_scb_to_spb_clk
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tvalid
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tlast
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tdata
#add wave -noupdate /spb_top_cmd_tb/tb_s_scb_cmd_clock_i
#add wave -noupdate /spb_top_cmd_tb/tb_s_scb_cmd_reset_n_i
#add wave -noupdate /spb_top_cmd_tb/tb_s_scb_cmd_tnext_i
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_ram_tenable_o
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_ram_taddr
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_ram_tdata
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_ram_tnext_i
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_main_tenable_o
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_main_taddr
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_main_tdata
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_main_tnext_i
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_bf_main_tvalid
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_bf_main_tready
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_bf_main_tlast
#add wave -noupdate /spb_top_cmd_tb/tb_m_axi_bf_main_tdata
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_cmd_reg_ram_tenable_o
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_cmd_reg_ram_taddr
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_cmd_reg_ram_tdata
#add wave -noupdate /spb_top_cmd_tb/tb_m_rd_bf_cmd_reg_ram_tnext_i
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/m_axi_scb_to_spb_clk
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/m_axi_scb_to_spb_tvalid
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/m_axi_scb_to_spb_tlast
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/m_axi_scb_to_spb_tdata
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/s_scb_cmd_clock_i
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/s_scb_cmd_reset_n_i
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/s_scb_cmd_tnext_i
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/Chan_Pkt
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/Chan_Str
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/Clk
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/reset_n
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tdata
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tenable
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tvalid
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tlast
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tstart
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tstart_i
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tstart_i_i
#add wave -noupdate /spb_top_cmd_tb/scb_cmd_gen_i/tcnt
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_axi_scb_to_spb_clk
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_axi_scb_to_spb_reset_n
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_axi_scb_to_spb_tvalid
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_axi_scb_to_spb_tlast
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_axi_scb_to_spb_tdata
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_rd_bf_ram_tenable_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_rd_bf_ram_taddr
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_rd_bf_ram_tdata
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_bf_ram_clock_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_bf_ram_tnext_o
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/wr_taddr_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/wr_taddr_high
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/rd_taddr_high
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/wr_taddr_high_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_ram_i/s_axi_scb_to_spb_tlast_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_rd_bf_cmd_reg_ram_tenable_o
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_rd_bf_cmd_reg_ram_taddr
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_rd_bf_cmd_reg_ram_tdata
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_rd_bf_cmd_reg_ram_tnext_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_axi_bf_cmd_reg_tvalid
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_axi_bf_cmd_reg_tlast
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_axi_bf_cmd_reg_tdata
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/s_bf_cmd_reg_ram_tclock_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/s_bf_cmd_reg_treset_n_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/s_bf_cmd_reg_tnext_o
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tenable
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tvaild
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tlast
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_taddr
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_tdata
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_start
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_start_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_start_i_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_start_i_i_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/next_tvalid
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/next_tready
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/next_tlast
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/next_taddr
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/next_tdata
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/Clk
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/reset_n
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/reset_n_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/reset_n_i_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/reset_n_i_i_i
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_sum
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/m_cur_error_status
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/Chan_Pkt
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/Chan_Str
#add wave -noupdate /spb_top_cmd_tb/bf_cmd_reg_i/CmdReg_Str
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_n_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_n_i/clk_sync
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_n_i/user_in
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_n_i/user_sync_out
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_n_i/user_in_i
#add wave -noupdate /spb_top_cmd_tb/bs_sync_axi_reset_n_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_sync_axi_reset_n_i/clk_sync
#add wave -noupdate /spb_top_cmd_tb/bs_sync_axi_reset_n_i/user_in
#add wave -noupdate /spb_top_cmd_tb/bs_sync_axi_reset_n_i/user_sync_out
#add wave -noupdate /spb_top_cmd_tb/bs_sync_axi_reset_n_i/user_in_i
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_cmd_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_cmd_i/clk_sync
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_cmd_i/user_in
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_cmd_i/user_sync_out
#add wave -noupdate /spb_top_cmd_tb/bs_sync_reset_cmd_i/user_in_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/reset_n
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/tstart_level
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/tpulse_5us
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/tstart_level_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/tpulse_5us_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/tpulse_5us_i_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_5us_i/tvalid
#add wave -noupdate /spb_top_cmd_tb/bs_sync_pulse_5us_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_sync_pulse_5us_i/clk_sync
#add wave -noupdate /spb_top_cmd_tb/bs_sync_pulse_5us_i/user_in
#add wave -noupdate /spb_top_cmd_tb/bs_sync_pulse_5us_i/user_sync_out
#add wave -noupdate /spb_top_cmd_tb/bs_sync_pulse_5us_i/user_in_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/reset_n
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/tstart_level
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/tpulse_oneshot
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/tstart_level_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/tpulse_oneshot_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/tpulse_oneshot_i_i
#add wave -noupdate /spb_top_cmd_tb/bs_pulse_oneshot_i/tvalid
#add wave -noupdate /spb_top_cmd_tb/bs_reset_expansion_i/clk
#add wave -noupdate /spb_top_cmd_tb/bs_reset_expansion_i/treset_n_in
#add wave -noupdate /spb_top_cmd_tb/bs_reset_expansion_i/treset_n_out
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
add wave -noupdate -radix binary /spb_top_cmd_tb/tb_axi_clock
add wave -noupdate -radix binary /spb_top_cmd_tb/tb_axi_reset_n
add wave -noupdate -radix binary /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tvalid
add wave -noupdate -radix binary /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tlast
add wave -noupdate -radix decimal /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tdata
add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tdata
#add wave -noupdate -radix binary /spb_top_cmd_tb/scb_cmd_gen_i/tcnt
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/bf_main_i/Clk
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tvalid
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tready
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tlast
add wave -noupdate -radix decimal /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tdata
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_rd_bf_main_tenable_o
#
add wave -noupdate -color white -itemcolor white -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_a_en
add wave -noupdate -color orange -itemcolor orange -radix unsigned /spb_top_cmd_tb/bf_main_i/tbf_dir_idx
add wave -noupdate -color orange -itemcolor orange -radix decimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata
add wave -noupdate -color orange -itemcolor orange -radix hexadecimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata
add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata(0)
#add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata(1)
#add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata(2)
#add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata(3)
#add wave -noupdate -format Analog-Step -height 74 -max 100000000.0 -min -100000000.0 -radix decimal /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata(4)
#
add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/Clk
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/bf_main_i/tdelay_19T(19)
add wave -noupdate -color yellow -itemcolor yellow -radix unsigned /spb_top_cmd_tb/bf_main_i/tpipeline_cnt
#
TreeUpdate [SetDefaultTree]
# WaveRestoreCursors {{Cursor 1} {95918058 ps} 0}
WaveRestoreCursors {{Cursor 1} {4 us} 0}
quietly wave cursor active 1
# WaveRestoreCursors {{Cursor 1} {88021000 ps} 0} {{Cursor 2} {308021000 ps} 0}
# quietly wave cursor active 2
configure wave -namecolwidth 191
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
WaveRestoreZoom {0 ps} {7 us}
run 6 us
# WaveRestoreZoom {98024160 ps} {98078708 ps}
# WaveRestoreZoom {98035714 ps} {98069286 ps}
#
# -- c0 : result time
# WaveRestoreZoom {98222003 ps} {98289143 ps}
# WaveRestoreCursors {{Cursor 1} {98275206 ps} 0}
# WaveRestoreZoom {0 ps} {1100 us}
# run 1000 us
