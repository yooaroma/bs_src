-- Quartus II VHDL Template
-- True Dual-Port RAM with single clock
-- and individual controls for writing into seperate bytes of the memory word (byte-enable)
--
-- Read-during-write on port A or B returns old data
-- 
-- Read-during-write between A and B returns either new or old data depending
-- on the order in which the simulator executes the process statements.
-- Quartus II will consider this read-during-write scenario as a 
-- don't care condition to optimize the performance of the RAM.  If you
-- need a read-during-write between ports to return the old data, you
-- must instantiate the altsyncram Megafunction directly.

library ieee;
use ieee.std_logic_1164.all;
library work;

entity byte_enabled_true_dual_port_ram is

  generic (
    ADDR_WIDTH : natural := 8;
    BYTE_WIDTH : natural := 8;
    BYTES : natural := 4);

  port (
    we1, we2, clk : in std_logic;
    be1 : in std_logic_vector (BYTES - 1 downto 0);
    be2 : in std_logic_vector (BYTES - 1 downto 0);
    data_in1 : in std_logic_vector(BYTE_WIDTH - 1 downto 0);
    data_in2 : in std_logic_vector(BYTE_WIDTH - 1 downto 0);
    addr1 : in integer range 0 to 2 ** ADDR_WIDTH - 1;
    addr2 : in integer range 0 to 2 ** ADDR_WIDTH - 1;
    data_out1 : out std_logic_vector(BYTES * BYTE_WIDTH - 1 downto 0);
    data_out2 : out std_logic_vector(BYTES * BYTE_WIDTH - 1 downto 0));
end byte_enabled_true_dual_port_ram;

architecture rtl of byte_enabled_true_dual_port_ram is
  --  build up 2D array to hold the memory
  type word_t is array (0 to BYTES - 1) of std_logic_vector(BYTE_WIDTH - 1 downto 0);
  type ram_t is array (0 to 2 ** ADDR_WIDTH - 1) of word_t;

  shared variable ram : ram_t;
  signal q1_local : word_t;
  signal q2_local : word_t;

  attribute ramstyle : string;
  attribute ramstyle of ram : variable is "no_rw_check";

begin -- rtl
  -- Reorganize the read data from the RAM to match the output
  unpack : for i in 0 to BYTES - 1 generate
    data_out1(BYTE_WIDTH * (i + 1) - 1 downto BYTE_WIDTH * i) <= q1_local(i);
    data_out2(BYTE_WIDTH * (i + 1) - 1 downto BYTE_WIDTH * i) <= q2_local(i);
  end generate unpack;

  process (clk)
  begin
    if (rising_edge(clk)) then
      if (we1 = '1') then
        -- edit this code if using other than four bytes per word
        if (be1(0) = '1') then
          ram(addr1)(0) := data_in1;
        end if;
        if be1(1) = '1' then
          ram(addr1)(1) := data_in1;
        end if;
        if be1(2) = '1' then
          ram(addr1)(2) := data_in1;
        end if;
        if be1(3) = '1' then
          ram(addr1)(3) := data_in1;
        end if;
      end if;
      q1_local <= ram(addr1);
    end if;
  end process;

  process (clk)
  begin
    if (rising_edge(clk)) then
      if (we2 = '1') then
        -- edit this code if using other than four bytes per word
        if (be2(0) = '1') then
          ram(addr2)(0) := data_in2;
        end if;
        if be2(1) = '1' then
          ram(addr2)(1) := data_in2;
        end if;
        if be2(2) = '1' then
          ram(addr2)(2) := data_in2;
        end if;
        if be2(3) = '1' then
          ram(addr2)(3) := data_in2;
        end if;
      end if;
      q2_local <= ram(addr2);
    end if;
  end process;

end rtl;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- Byte Write Enable—True Dual Port READ_FIRST Mode (VHDL)
-- Filename: bytewrite_tdp_ram_rf.vhd
-- True-Dual-Port BRAM with Byte-wide Write Enable
-- Read First mode
--
-- bytewrite_tdp_ram_rf.vhd
--
-- READ_FIRST ByteWide WriteEnable Block RAM Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bytewrite_tdp_ram_rf is
  generic (
    SIZE : integer := 1024;
    ADDR_WIDTH : integer := 10;
    COL_WIDTH : integer := 9;
    NB_COL : integer := 4
  );

  port (
    clka : in std_logic;
    ena : in std_logic;
    wea : in std_logic_vector(NB_COL - 1 downto 0);
    addra : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    dia : in std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
    doa : out std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
    clkb : in std_logic;
    enb : in std_logic;
    web : in std_logic_vector(NB_COL - 1 downto 0);
    addrb : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    dib : in std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
    dob : out std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0)
  );

end bytewrite_tdp_ram_rf;

architecture byte_wr_ram_rf of bytewrite_tdp_ram_rf is
  type ram_type is array (0 to SIZE - 1) of std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
  shared variable RAM : ram_type := (others => (others => '0'));

begin

  ------- Port A -------
  process (clka)
  begin
    if rising_edge(clka) then
      if ena = '1' then
        doa <= RAM(conv_integer(addra));
        for i in 0 to NB_COL - 1 loop
          if wea(i) = '1' then
            RAM(conv_integer(addra))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) := dia((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
          end if;
        end loop;
      end if;
    end if;
  end process;

  ------- Port B -------
  process (clkb)
  begin
    if rising_edge(clkb) then
      if enb = '1' then
        dob <= RAM(conv_integer(addrb));
        for i in 0 to NB_COL - 1 loop
          if web(i) = '1' then
            RAM(conv_integer(addrb))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) := dib((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
          end if;
        end loop;
      end if;
    end if;
  end process;
end byte_wr_ram_rf;

-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
////////////////////////////////////////////////
//
// Name : Shubhi Agrawal
// Design : APB2 Protocol Slave - 1
// Date : 13 - 06 - 2021
//
///////////////////////////////////////////////
`timescale 1ns/1ns

module slave1(
input PCLK, PRESETn,
input PSEL, PENABLE, PWRITE,
input [7 : 0]PADDR, PWDATA,
output [7 : 0]PRDATA1,
output reg PREADY);

reg [7 : 0]reg_addr;
reg [7 : 0] mem [0 : 63];

assign PRDATA1 = mem[reg_addr];

always @( *)
begin
if (!PRESETn)
  PREADY = 0;
else
  if (PSEL & & !PENABLE & & !PWRITE)
  begin PREADY = 0;
  end

else
  if (PSEL & & PENABLE & & !PWRITE)
  begin PREADY = 1;
    reg_addr = PADDR;
  end
else
  if (PSEL & & !PENABLE & & PWRITE)
  begin PREADY = 0;
  end

else
  if (PSEL & & PENABLE & & PWRITE)
  begin PREADY = 1;
    mem[PADDR] = PWDATA;
  end

else
  PREADY = 0;
end
endmodule

-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

/ / Code your design here
module AMBA_APB(P_clk, P_rst, P_addr, P_selx, P_enable, P_write, P_wdata, P_ready, P_slverr, P_rdata);
//input configration
input P_clk;
input P_rst;
input [31 : 0]P_addr;

input P_selx;
input P_enable;
input P_write;
input [31 : 0]P_wdata;

//output configration
output reg P_ready;
output reg P_slverr;
output reg [31 : 0]P_rdata;
//memory decleration
reg [31 : 0]mem[31 : 0];
//state declaration communication
parameter [1 : 0] idle = 2'b00;
parameter [1 : 0] setup = 2'b01;
parameter [1 : 0] access = 2'b10;

//state declaration of present and next
reg [1 : 0] present_state, next_state;

always @(posedge P_clk) begin
if (P_rst) present_state <= idle;
else
  present_state <= next_state;
end
always @( *) begin
//next_state = present_state;
case (present_state)
    idle : begin
    if (P_selx & !P_enable)
      next_state = setup;
      P_ready = 0;
    end

    setup : begin if (!P_enable | !P_selx)
    next_state = idle;
  else
  begin
    next_state = access;

    if (P_write == 1) begin
      mem[P_addr] = P_wdata;
      P_ready = 1;
      P_slverr = 0;
    end
  else
  begin
    P_rdata = mem[P_addr];
    P_ready = 1;
    P_slverr = 0;
end
end
end
access : begin
if (!P_enable | !P_selx) begin
  next_state = idle;
  P_ready = 0;
end
end
endcase
end
endmodule
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================