onerror {resume}
vsim -msgmode both -displaymsgmode both -lib work uart_tb
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
add wave -noupdate -radix binary /uart_tb/r_CLOCK
add wave -noupdate -radix binary /uart_tb/r_TX_DV
add wave -noupdate -radix hexadecimal /uart_tb/r_TX_BYTE
add wave -noupdate -color yellow -itemcolor yellow -radix binary /uart_tb/w_TX_SERIAL
add wave -noupdate -color yellow -itemcolor yellow  -radix binary /uart_tb/w_TX_DONE
add wave -noupdate -radix binary /uart_tb/w_RX_DV
add wave -noupdate -radix hexadecimal /uart_tb/w_RX_BYTE
add wave -noupdate -color yellow -itemcolor yellow -radix binary /uart_tb/r_RX_SERIAL
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/r_RX_Data
add wave -noupdate -radix hexadecimal /uart_tb/UART_RX_INST/uart_rx_filter
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/r_char_bit
#
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/i_Clk
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/i_TX_DV
add wave -noupdate -radix hexadecimal /uart_tb/UART_TX_INST/i_TX_Byte
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/o_TX_Active
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/o_TX_Serial
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/o_TX_Done
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/r_SM_Main
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/r_Clk_Count
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/r_Bit_Index
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/r_TX_Data
add wave -noupdate -radix binary /uart_tb/UART_TX_INST/r_TX_Done
#
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/i_Clk
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/i_RX_Serial
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/o_RX_DV
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/o_RX_Byte
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/r_SM_Main
add wave -noupdate -radix hexadecimal /uart_tb/UART_RX_INST/r_RX_Data_R
add wave -noupdate -radix hexadecimal /uart_tb/UART_RX_INST/r_RX_Data
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/r_Clk_Count
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/r_Bit_Index
add wave -noupdate -radix hexadecimal /uart_tb/UART_RX_INST/r_RX_Byte
add wave -noupdate -radix binary /uart_tb/UART_RX_INST/r_RX_DV
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
run 100 us
