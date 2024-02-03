onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work spb_top_cmd_tb
delete wave *
quietly WaveActivateNextPane {} 0
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
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_s_en
#
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_e_en
#
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_1_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/bf_rd_ch_idx
#
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_2_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p1_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p1_dir_delay_weight_tbl_addr
#
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_3_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p2_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p2_dir_delay_tbl_data
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p2_dir_weight_tbl_data
#
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_4_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p3_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p3_dir_weight_tbl_data
add wave -noupdate -color white -itemcolor white -radix hexadecimal /spb_top_cmd_tb/bf_main_i/p3_ram_rd_address
#
add wave -noupdate -color orange -itemcolor orange -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_5_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p4_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p4_dir_weight_tbl_data
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p4_ram_data_out
#
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_6_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p5_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p5_pos_weight_mul_data_in
#
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_7_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p6_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p6_pos_weight_mul_data_in_1
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p6_pos_weight_mul_data_in_2
add wave -noupdate -color white -itemcolor white -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_up_weight_part
add wave -noupdate -color white -itemcolor white -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_down_weight_part
add wave -noupdate -color white -itemcolor white -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_right_weight_part
add wave -noupdate -color white -itemcolor white -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_left_weight_part
#
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_8_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p7_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_s
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_up
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_down
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_right
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_left
#
add wave -noupdate -color yellow -itemcolor yellow -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_9_en
add wave -noupdate -color white -itemcolor white -radix unsigned /spb_top_cmd_tb/bf_main_i/p8_bf_rd_ch_idx
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_s
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_up
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_down
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_right
add wave -noupdate -color white -itemcolor white -radix decimal /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_left
#
#add wave -noupdate -radix binary /spb_top_cmd_tb/tb_axi_clock
#add wave -noupdate -radix binary /spb_top_cmd_tb/tb_axi_reset_n
#add wave -noupdate -radix binary /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tvalid
#add wave -noupdate -radix binary /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tlast
#add wave -noupdate -radix decimal /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tdata
#add wave -noupdate -radix hexadecimal /spb_top_cmd_tb/tb_m_axi_scb_to_spb_tdata
#add wave -noupdate -radix binary /spb_top_cmd_tb/scb_cmd_gen_i/tcnt
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tvalid
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tready
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tlast
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_axi_bf_main_tdata
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_rd_bf_main_tenable_o
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_rd_bf_main_taddr
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_rd_bf_main_tdata
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_rd_bf_main_tnext_i
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_bf_main_ram_tclock_i
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_bf_main_ram_treset_n_i
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/m_bf_main_ram_tnext_o
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_delay_19_enable
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_s_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_e_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_1_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_2_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_3_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_4_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_5_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_6_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_7_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_8_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_9_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_a_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/pipeline_0_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_wr_ext_sync_buf
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_wr_ext_sync_low
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_ext_sync_buf
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_ext_sync_low
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_wr_sw_low
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_sw_sync_buf
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_sw_sync_low
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_all_sync_buf
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_all_sync_low
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_self_buf
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_reset_rd_self_low
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/ram_wr_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/ram_rd_en
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/ram_wr_address
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p3_ram_rd_address
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/ram_data_in
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/ram_data_out
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p4_ram_data_out
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_wr_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_wr_tdelay_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_wr_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_axi_rx_tlast_delay
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_wr_tdelay_idx_buf
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_wr_tdelay_idx_sync
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_rd_buff_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/ps_bf_rd_buff_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p1_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p2_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p3_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p4_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p5_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p8_bf_rd_ch_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_wr_tdelay_idx_sync_check
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/bf_dir_idx
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p1_dir_delay_weight_tbl_addr
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p2_dir_delay_tbl_data
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p2_dir_weight_tbl_data
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p3_dir_weight_tbl_data
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p4_dir_weight_tbl_data
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p5_pos_weight_mul_data_in
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_weight_mul_data_in_1
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_weight_mul_data_in_2
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_s
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_up
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_down
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_right
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_pos_data_out_left
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_s
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_up
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_down
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_right
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p7_bf_data_sum_left
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_up_weight_part
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_down_weight_part
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_right_weight_part
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/p6_pos_element_left_weight_part
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/t_bf_dir_odata
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_start_s
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_cnt_s
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_tcnt_s
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_tvalid
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_tready
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_tlast
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/last_check_tdata
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/Clk
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/reset_n
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/tstart
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/tstart_i
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/tdelay_19T
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/tpipeline_start
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/tpipeline_cnt
#add wave -noupdate -radix binary /spb_top_cmd_tb/bf_main_i/tbf_dir_idx
#
#
#
#
TreeUpdate [SetDefaultTree]
# WaveRestoreCursors {{Cursor 1} {95918058 ps} 0}
WaveRestoreCursors {{Cursor 1} {95 us} 0}
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
WaveRestoreZoom {0 ps} {1001 us}
run 1000 us
# WaveRestoreZoom {98024160 ps} {98078708 ps}
# WaveRestoreZoom {98035714 ps} {98069286 ps}
#
# -- c0 : result time
# WaveRestoreZoom {98222003 ps} {98289143 ps}
# WaveRestoreCursors {{Cursor 1} {98275206 ps} 0}
# WaveRestoreZoom {0 ps} {1100 us}
# run 1000 us
