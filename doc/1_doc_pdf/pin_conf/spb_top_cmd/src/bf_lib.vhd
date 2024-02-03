-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
package BS_define is
  --
  constant C_37_CH_MAX : natural := 37;
  constant C_6_CH_BIT_WIDTH : natural := 6; -- 0 to 37
  constant C_24_CH_DATA_BIT : natural := 24;
  constant C_5_CH_DELAY_BIT_WIDTH : natural := 5; -- 0 to 18
  constant C_5_POS_MAX : natural := 5; -- 0 to 4 [POST:SUM,UP,DOWN,RIGHT,LEFT] 
  constant C_2_POS_W_BIT_WIDTH : natural := 2; -- 0, 1, 2
  constant C_7_DIR_MAX : natural := 7; -- 0 to 6 [DIRT:C0,L1,L2,L3,R1,R2,R3]
  constant C_3_DIR_BIT_WIDTH : natural := 3; -- 0 to 6
  constant C_16_DIR_W_DATA_BIT : natural := 16;
  constant C_40_DIR_MUL_DATA_BIT : natural := (C_24_CH_DATA_BIT + C_16_DIR_W_DATA_BIT);
  constant C_46_DIR_SUM_DATA_BIT : natural := (C_24_CH_DATA_BIT + C_16_DIR_W_DATA_BIT + C_6_CH_BIT_WIDTH);
  --
  --
  type bf_output_type is array (0 to (C_5_POS_MAX - 1)) of std_logic_vector (31 downto 0); -- [POST:SUM,UP,DOWN,RIGHT,LEFT] 
  --
end BS_define;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- library ieee;
-- use ieee.numeric_bit.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.bs_define.all;
-- int mDirBeamDelay[_M_DIR_BEAM_TYPE_MAX_][_M_RX_SIG_MAX_] = {
--     /*(CHANNEL) : [ 0][ 1][ 2][ 3][ 4][ 5][ 6][ 7][ 8][ 9][10][11][12][13][14][15][16][17][18][19][20][21][22][23][24][25][26][27][28][29][30][31][32][33][34][35][36]  */
--     /*[DIR DELAY]  [ 0] */ {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
--     /*[DIR DELAY]  [ 1] */ {0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6},
--     /*[DIR DELAY]  [ 2] */ {0, 0, 0, 0, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 6, 6, 6, 6, 6, 6, 6, 8, 8, 8, 8, 8, 8, 10, 10, 10, 10, 10, 12, 12, 12, 12},
--     /*[DIR DELAY]  [ 3] */ {0, 0, 0, 0, 3, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 9, 9, 9, 9, 9, 9, 9, 12, 12, 12, 12, 12, 12, 15, 15, 15, 15, 15, 18, 18, 18, 18},
--     /*[DIR DELAY]  [ 4] */ {0, 0, 0, 0, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1},
--     /*[DIR DELAY]  [ 5] */ {0, 0, 0, 0, 12, 12, 12, 12, 12, 10, 10, 10, 10, 10, 10, 8, 8, 8, 8, 8, 8, 8, 6, 6, 6, 6, 6, 6, 4, 4, 4, 4, 4, 2, 2, 2, 2},
--     /*[DIR DELAY]  [ 6] */ {0, 0, 0, 0, 18, 18, 18, 18, 18, 15, 15, 15, 15, 15, 15, 12, 12, 12, 12, 12, 12, 12, 9, 9, 9, 9, 9, 9, 6, 6, 6, 6, 6, 3, 3, 3, 3}
--     /**/}; /* end of int mDirBeamDelay[_M_DIR_BEAM_TYPE_MAX_][_M_RX_SIG_MAX_] */
entity ct_dir_delay is
  generic (
    ADDRESS_WIDTH : natural := (C_3_DIR_BIT_WIDTH + C_6_CH_BIT_WIDTH); -- 9; -- [7][37]
    DATA_WIDTH : natural := (C_5_CH_DELAY_BIT_WIDTH) -- 5 -- 0 to 18
  );
  port (
    clock : in std_logic;
    address : in std_logic_vector ((ADDRESS_WIDTH - 1) downto 0);
    data_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0)
  );
end ct_dir_delay;
--
architecture arch of ct_dir_delay is
  type rom_type is array (0 to (2 ** (ADDRESS_WIDTH) - 1)) of natural; -- std_logic_vector ((DATA_WIDTH - 1) downto 0);
  -- set the data on each adress to some value)
  constant mem : rom_type :=
  (
  -- /*   C0                [DIR DELAY]  [ 0] */
  9, 9, 9, 9, 9, 9, 9, 9, -- addr[       7] 
  9, 9, 9, 9, 9, 9, 9, 9, -- addr[      15] 
  9, 9, 9, 9, 9, 9, 9, 9, -- addr[      23] 
  9, 9, 9, 9, 9, 9, 9, 9, -- addr[      31] 
  9, 9, 9, 9, 9, 0, 0, 0, -- addr[      39] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[      47] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[      55] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[      63] 
  -- /*    L1                [DIR DELAY]  [ 1] */
  12, 12, 12, 12, 11, 11, 11, 11, -- addr[      71] 
  11, 10, 10, 10, 10, 10, 10, 9, -- addr[      79] 
  9, 9, 9, 9, 9, 9, 8, 8, -- addr[      87] 
  8, 8, 8, 8, 7, 7, 7, 7, -- addr[      95] 
  7, 6, 6, 6, 6, 0, 0, 0, -- addr[     103] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     111] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     119] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     127] 
  -- /*    L2               [DIR DELAY]  [ 2] */
  15, 15, 15, 15, 13, 13, 13, 13, -- addr[     135] 
  13, 11, 11, 11, 11, 11, 11, 9, -- addr[     143] 
  9, 9, 9, 9, 9, 9, 7, 7, -- addr[     151] 
  7, 7, 7, 7, 5, 5, 5, 5, -- addr[     159] 
  5, 3, 3, 3, 3, 0, 0, 0, -- addr[     167] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     175] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     183] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     191] 
  -- /*    L3               [DIR DELAY]  [ 3] */
  18, 18, 18, 18, 15, 15, 15, 15, -- addr[     199] 
  15, 12, 12, 12, 12, 12, 12, 9, -- addr[     207] 
  9, 9, 9, 9, 9, 9, 6, 6, -- addr[     215] 
  6, 6, 6, 6, 3, 3, 3, 3, -- addr[     223] 
  3, 0, 0, 0, 0, 0, 0, 0, -- addr[     231] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     239] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     247] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     255] 
  -- /*     R1              [DIR DELAY]  [ 4] */
  6, 6, 6, 6, 7, 7, 7, 7, -- addr[     263] 
  7, 8, 8, 8, 8, 8, 8, 9, -- addr[     271] 
  9, 9, 9, 9, 9, 9, 10, 10, -- addr[     279] 
  10, 10, 10, 10, 11, 11, 11, 11, -- addr[     287] 
  11, 12, 12, 12, 12, 0, 0, 0, -- addr[     295] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     303] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     311] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     319] 
  -- /*     R2              [DIR DELAY]  [ 5] */
  3, 3, 3, 3, 5, 5, 5, 5, -- addr[     327] 
  5, 7, 7, 7, 7, 7, 7, 9, -- addr[     335] 
  9, 9, 9, 9, 9, 9, 11, 11, -- addr[     343] 
  11, 11, 11, 11, 13, 13, 13, 13, -- addr[     351] 
  13, 15, 15, 15, 15, 0, 0, 0, -- addr[     359] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     367] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     375] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     383] 
  -- /*     R3              [DIR DELAY]  [ 6] */
  0, 0, 0, 0, 3, 3, 3, 3, -- addr[     391] 
  3, 6, 6, 6, 6, 6, 6, 9, -- addr[     399] 
  9, 9, 9, 9, 9, 9, 12, 12, -- addr[     407] 
  12, 12, 12, 12, 15, 15, 15, 15, -- addr[     415] 
  15, 18, 18, 18, 18, 0, 0, 0, -- addr[     423] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     431] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     439] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     447] 
  -- /*   not used                [DIR DELAY]  [ 7] */
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     455] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     463] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     471] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     479] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     487] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     495] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     503] 
  0, 0, 0, 0, 0, 0, 0, 0 -- addr[     511] 
  );
  --
begin
  --
  process (clock) is
  begin
    if (rising_edge(clock)) then
      data_output <= std_logic_vector(to_unsigned(mem(conv_integer(address)), DATA_WIDTH));
    end if;
  end process;
  --
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- library ieee;
-- use ieee.numeric_bit.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.bs_define.all;
-- double mDirBeamWeight[_M_DIR_BEAM_TYPE_MAX_][_M_RX_SIG_MAX_] = {
--     /*(CHANNEL) : [ 0][ 1][ 2][ 3][ 4][ 5][ 6][ 7][ 8][ 9][10][11][12][13][14][15][16][17][18][19][20][21][22][23][24][25][26][27][28][29][30][31][32][33][34][35][36]  */
--     /*[DIR WEIGHT][C0]  [ 0] */ {0.1870, 0.254500, 0.254500, 0.1870, 0.301400, 0.488800, 0.568200, 0.488800, 0.301400, 0.309500, 0.618400, 0.841900, 0.841900, 0.618400, 0.309500, 0.267100, 0.530300, 0.860300, 1.0000, 0.860300, 0.530300, 0.267100, 0.309500, 0.618400, 0.841900, 0.841900, 0.618400, 0.309500, 0.301400, 0.488800, 0.568200, 0.488800, 0.301400, 0.1870, 0.254500, 0.254500, 0.187000},
--     /*[DIR WEIGHT][L1]  [ 1] */ {0.151500, 0.213700, 0.213700, 0.151500, 0.264900, 0.454900, 0.537900, 0.454900, 0.264900, 0.269500, 0.596900, 0.827700, 0.827700, 0.596900, 0.269500, 0.203400, 0.492400, 0.845700, 1.0000, 0.845700, 0.492400, 0.203400, 0.269500, 0.596900, 0.827700, 0.827700, 0.596900, 0.269500, 0.264900, 0.454900, 0.537900, 0.454900, 0.264900, 0.151500, 0.213700, 0.213700, 0.151500},
--     /*[DIR WEIGHT][L2]  [ 2] */ {0.124900, 0.182500, 0.182500, 0.124900, 0.233700, 0.424800, 0.510800, 0.424800, 0.233700, 0.235100, 0.557500, 0.814400, 0.814400, 0.557500, 0.235100, 0.156900, 0.457500, 0.831600, 1.0000, 0.831600, 0.457500, 0.156900, 0.235100, 0.557500, 0.814400, 0.814400, 0.557500, 0.235100, 0.233700, 0.424800, 0.510800, 0.424800, 0.233700, 0.124900, 0.182500, 0.182500, 0.124900},
--     /*[DIR WEIGHT][L3]  [ 3] */ {0.0990, 0.151400, 0.151400, 0.0990, 0.199100, 0.389900, 0.479300, 0.389900, 0.199100, 0.196500, 0.521600, 0.7980, 0.7980, 0.521600, 0.196500, 0.113300, 0.415400, 0.813300, 1.0000, 0.831100, 0.415400, 0.113300, 0.196500, 0.521600, 0.7980, 0.7980, 0.521600, 0.196500, 0.199100, 0.389900, 0.479300, 0.389900, 0.199100, 0.0990, 0.151400, 0.151400, 0.099000},
--     /*[DIR WEIGHT][R1]  [ 4] */ {0.151500, 0.213700, 0.213700, 0.151500, 0.264900, 0.454900, 0.537900, 0.454900, 0.264900, 0.269500, 0.596900, 0.827700, 0.827700, 0.596900, 0.269500, 0.203400, 0.492400, 0.845700, 1.0000, 0.845700, 0.492400, 0.203400, 0.269500, 0.596900, 0.827700, 0.827700, 0.596900, 0.269500, 0.264900, 0.454900, 0.537900, 0.454900, 0.264900, 0.151500, 0.213700, 0.213700, 0.151500},
--     /*[DIR WEIGHT][R2]  [ 5] */ {0.124900, 0.182500, 0.182500, 0.124900, 0.233700, 0.424800, 0.510800, 0.424800, 0.233700, 0.235100, 0.557500, 0.814400, 0.814400, 0.557500, 0.235100, 0.156900, 0.457500, 0.831600, 1.0000, 0.831600, 0.457500, 0.156900, 0.235100, 0.557500, 0.814400, 0.814400, 0.557500, 0.235100, 0.233700, 0.424800, 0.510800, 0.424800, 0.233700, 0.124900, 0.182500, 0.182500, 0.124900},
--     /*[DIR WEIGHT][R3]  [ 6] */ {0.0990, 0.151400, 0.151400, 0.0990, 0.199100, 0.389900, 0.479300, 0.389900, 0.199100, 0.196500, 0.521600, 0.7980, 0.7980, 0.521600, 0.196500, 0.113300, 0.415400, 0.813300, 1.0000, 0.831100, 0.415400, 0.113300, 0.196500, 0.521600, 0.7980, 0.7980, 0.521600, 0.196500, 0.199100, 0.389900, 0.479300, 0.389900, 0.199100, 0.0990, 0.151400, 0.151400, 0.099000}
--     /**/}; /* end of double mDirBeamWeight[_M_DIR_BEAM_TYPE_MAX_][_M_RX_SIG_MAX_] */
entity ct_dir_weight is
  generic (
    ADDRESS_WIDTH : natural := (C_3_DIR_BIT_WIDTH + C_6_CH_BIT_WIDTH); -- 9; -- [7][37]
    DATA_WIDTH : natural := (C_16_DIR_W_DATA_BIT) -- 16 bit...
  );
  port (
    clock : in std_logic;
    address : in std_logic_vector ((ADDRESS_WIDTH - 1) downto 0);
    data_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0)
  );
end ct_dir_weight;
--
architecture arch of ct_dir_weight is
  type rom_type is array (0 to (2 ** (ADDRESS_WIDTH) - 1)) of natural; -- std_logic_vector ((DATA_WIDTH - 1) downto 0);
  -- set the data on each adress to some value)
  constant mem : rom_type :=
  (
  -- /*                  [DIR WEIGHT]  [ 0] */
  1870, 2545, 2545, 1870, 3014, 4888, 5682, 4888, -- addr[       7]  
  3014, 3095, 6184, 8419, 8419, 6184, 3095, 2671, -- addr[      15] 
  5303, 8603, 10000, 8603, 5303, 2671, 3095, 6184, -- addr[      23] 
  8419, 8419, 6184, 3095, 3014, 4888, 5682, 4888, -- addr[      31] 
  3014, 1870, 2545, 2545, 1870, 0, 0, 0, -- addr[      39] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[      47] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[      55] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[      63] 
  -- 1870, 2545, 2545, 1870, 3014, 4888, 5682, 4888, -- addr[       7] 
  -- 3014, 3095, 6183, 8419, 8419, 6183, 3095, 2671, -- addr[      15] 
  -- 5303, 8603, 10000, 8603, 5303, 2671, 3095, 6183, -- addr[      23] 
  -- 8419, 8419, 6183, 3095, 3014, 4888, 5682, 4888, -- addr[      31] 
  -- 3014, 1870, 2545, 2545, 1870, 0, 0, 0, -- addr[      39] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[      47] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[      55] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[      63] 
  -- /*                  [DIR WEIGHT]  [ 1] */
  1515, 2137, 2137, 1515, 2649, 4549, 5379, 4549, -- addr[      71] 
  2649, 2695, 5969, 8277, 8277, 5969, 2695, 2034, -- addr[      79] 
  4924, 8457, 10000, 8457, 4924, 2034, 2695, 5969, -- addr[      87] 
  8277, 8277, 5969, 2695, 2649, 4549, 5379, 4549, -- addr[      95] 
  2649, 1515, 2137, 2137, 1515, 0, 0, 0, -- addr[     103] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     111] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     119] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     127] 
  -- /*                  [DIR WEIGHT]  [ 2] */
  1249, 1825, 1825, 1249, 2337, 4248, 5108, 4248, -- addr[     135] 
  2337, 2351, 5575, 8144, 8144, 5575, 2351, 1569, -- addr[     143] 
  4575, 8316, 10000, 8316, 4575, 1569, 2351, 5575, -- addr[     151] 
  8144, 8144, 5575, 2351, 2337, 4248, 5108, 4248, -- addr[     159] 
  2337, 1249, 1825, 1825, 1249, 0, 0, 0, -- addr[     167] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     175] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     183] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     191] 
  -- /*                  [DIR WEIGHT]  [ 3] */
  990, 1514, 1514, 990, 1991, 3899, 4793, 3899, -- addr[     199] 
  1991, 1965, 5215, 7980, 7980, 5215, 1965, 1133, -- addr[     207] 
  4154, 8133, 10000, 8311, 4154, 1133, 1965, 5215, -- addr[     215] 
  7980, 7980, 5215, 1965, 1991, 3899, 4793, 3899, -- addr[     223] 
  1991, 990, 1514, 1514, 990, 0, 0, 0, -- addr[     231] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     239] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     247] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     255] 
  -- /*                  [DIR WEIGHT]  [ 4] */
  1515, 2137, 2137, 1515, 2649, 4549, 5379, 4549, -- addr[     263] 
  2649, 2695, 5969, 8277, 8277, 5969, 2695, 2034, -- addr[     271] 
  4924, 8457, 10000, 8457, 4924, 2034, 2695, 5969, -- addr[     279] 
  8277, 8277, 5969, 2695, 2649, 4549, 5379, 4549, -- addr[     287] 
  2649, 1515, 2137, 2137, 1515, 0, 0, 0, -- addr[     295] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     303] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     311] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     319] 
  -- /*                  [DIR WEIGHT]  [ 5] */
  1249, 1825, 1825, 1249, 2337, 4248, 5108, 4248, -- addr[     327] 
  2337, 2351, 5575, 8144, 8144, 5575, 2351, 1569, -- addr[     335] 
  4575, 8316, 10000, 8316, 4575, 1569, 2351, 5575, -- addr[     343] 
  8144, 8144, 5575, 2351, 2337, 4248, 5108, 4248, -- addr[     351] 
  2337, 1249, 1825, 1825, 1249, 0, 0, 0, -- addr[     359] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     367] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     375] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     383] 
  -- /*                  [DIR WEIGHT]  [ 6] */
  990, 1514, 1514, 990, 1991, 3899, 4793, 3899, -- addr[     391] 
  1991, 1965, 5215, 7980, 7980, 5215, 1965, 1133, -- addr[     399] 
  4154, 8133, 10000, 8311, 4154, 1133, 1965, 5215, -- addr[     407] 
  7980, 7980, 5215, 1965, 1991, 3899, 4793, 3899, -- addr[     415] 
  1991, 990, 1514, 1514, 990, 0, 0, 0, -- addr[     423] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     431] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     439] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     447] 
  -- /*                  [DIR WEIGHT]  [ 7] */
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     455] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     463] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     471] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     479] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     487] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     495] 
  0, 0, 0, 0, 0, 0, 0, 0, -- addr[     503] 
  0, 0, 0, 0, 0, 0, 0, 0 -- addr[     511] 
  -- -- /*                  [DIR WEIGHT]  [ 0] */
  -- 1870, 2545, 2545, 1870, 3014, 4888, 5682, 4888, -- addr[       7]  
  -- 3014, 3095, 6184, 8419, 8419, 6184, 3095, 2671, -- addr[      15] 
  -- 5303, 8603, 10000, 8603, 5303, 2671, 3095, 6184, -- addr[      23] 
  -- 8419, 8419, 6184, 3095, 3014, 4888, 5682, 4888, -- addr[      31] 
  -- 3014, 1870, 2545, 2545, 1870, 0, 0, 0, -- addr[      39] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[      47] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[      55] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[      63] 
  -- -- /*                  [DIR WEIGHT]  [ 1] */
  -- 1515, 2137, 2137, 1515, 2649, 4549, 5379, 4549, -- addr[      71] 
  -- 2649, 2695, 5969, 8277, 8277, 5969, 2695, 2034, -- addr[      79] 
  -- 4924, 8457, 10000, 8457, 4924, 2034, 2695, 5969, -- addr[      87] 
  -- 8277, 8277, 5969, 2695, 2649, 4549, 5379, 4549, -- addr[      95] 
  -- 2649, 1515, 2137, 2137, 1515, 0, 0, 0, -- addr[     103] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     111] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     119] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     127] 
  -- -- /*                  [DIR WEIGHT]  [ 2] */
  -- 1249, 1825, 1825, 1249, 2337, 4248, 5108, 4248, -- addr[     135] 
  -- 2337, 2351, 5575, 8144, 8144, 5575, 2351, 1569, -- addr[     143] 
  -- 4575, 8316, 10000, 8316, 4575, 1569, 2351, 5575, -- addr[     151] 
  -- 8144, 8144, 5575, 2351, 2337, 4248, 5108, 4248, -- addr[     159] 
  -- 2337, 1249, 1825, 1825, 1249, 0, 0, 0, -- addr[     167] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     175] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     183] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     191] 
  -- -- /*                  [DIR WEIGHT]  [ 3] */
  -- 990, 1514, 1514, 990, 1991, 3899, 4793, 3899, -- addr[     199] 
  -- 1991, 1965, 5216, 7980, 7980, 5216, 1965, 1133, -- addr[     207] 
  -- 4154, 8133, 10000, 8311, 4154, 1133, 1965, 5216, -- addr[     215] 
  -- 7980, 7980, 5216, 1965, 1991, 3899, 4793, 3899, -- addr[     223] 
  -- 1991, 990, 1514, 1514, 990, 0, 0, 0, -- addr[     231] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     239] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     247] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     255] 
  -- -- /*                  [DIR WEIGHT]  [ 4] */
  -- 1515, 2137, 2137, 1515, 2649, 4549, 5379, 4549, -- addr[     263] 
  -- 2649, 2695, 5969, 8277, 8277, 5969, 2695, 2034, -- addr[     271] 
  -- 4924, 8457, 10000, 8457, 4924, 2034, 2695, 5969, -- addr[     279] 
  -- 8277, 8277, 5969, 2695, 2649, 4549, 5379, 4549, -- addr[     287] 
  -- 2649, 1515, 2137, 2137, 1515, 0, 0, 0, -- addr[     295] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     303] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     311] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     319] 
  -- -- /*                  [DIR WEIGHT]  [ 5] */
  -- 1249, 1825, 1825, 1249, 2337, 4248, 5108, 4248,
  -- 2337, 2351, 5575, 8144, 8144, 5575, 2351, 1569,
  -- 4575, 8316, 10000, 8316, 4575, 1569, 2351, 5575,
  -- 8144, 8144, 5575, 2351, 2337, 4248, 5108, 4248,
  -- 2337, 1249, 1825, 1825, 1249, 0, 0, 0,

  -- 1249, 1825, 1825, 1249, 2337, 4248, 5108, 4248, -- addr[     327] 
  -- 2337, 2351, 5575, 8144, 8144, 5575, 2351, 1569, -- addr[     335] 
  -- 4575, 8316, 10000, 8316, 4575, 1569, 2351, 5575, -- addr[     343] 
  -- 8144, 8144, 5575, 2351, 2337, 4248, 5108, 4248, -- addr[     351] 
  -- 2337, 1249, 1825, 1825, 1249, 0, 0, 0, -- addr[     359] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     367] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     375] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     383] 
  -- -- /*                  [DIR WEIGHT]  [ 6] */
  -- 990, 1514, 1514, 990, 1991, 3899, 4793, 3899, -- addr[     391] 
  -- 1991, 1965, 5216, 7980, 7980, 5216, 1965, 1133, -- addr[     399] 
  -- 4154, 8133, 10000, 8311, 4154, 1133, 1965, 5216, -- addr[     407] 
  -- 7980, 7980, 5216, 1965, 1991, 3899, 4793, 3899, -- addr[     415] 
  -- 1991, 990, 1514, 1514, 990, 0, 0, 0, -- addr[     423] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     431] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     439] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     447] 
  -- -- /*                  [DIR WEIGHT]  [ 7] */
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     455] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     463] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     471] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     479] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     487] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     495] 
  -- 0, 0, 0, 0, 0, 0, 0, 0, -- addr[     503] 
  -- 0, 0, 0, 0, 0, 0, 0, 0 -- addr[     511] 
  );
  --
begin
  --
  process (clock) is
  begin
    if (rising_edge(clock)) then
      data_output <= std_logic_vector(to_unsigned(mem(conv_integer(address)), DATA_WIDTH));
    end if;
  end process;
  --
end arch;
--
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
--
-- int mPosBeamType_SUM_ChannelWeight[_M_RX_SIG_MAX_] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
-- int mPosBeamType_UP_ChannelWeight[_M_RX_SIG_MAX_] = {1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 2, 2, 2, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 2, 2, 2, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0};
-- int mPosBeamType_DOWN_ChannelWeight[_M_RX_SIG_MAX_] = {0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 2, 2, 2, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 2, 2, 2, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1};
-- int mPosBeamType_RIGHT_ChannelWeight[_M_RX_SIG_MAX_] = {1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2, 1, 0, 1, 2, 2, 2, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
-- int mPosBeamType_LEFT_ChannelWeight[_M_RX_SIG_MAX_] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 1, 0, 0, 1, 2, 2, 2, 1, 0, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 2, 1};
-- 
package BS_W_define is
  type ps_w_rom_type is array (0 to (2 ** 6 - 1)) of natural; -- std_logic_vector ((DATA_WIDTH - 1) downto 0);
  -- set the data on each adress to some value)
  -- constant mem : s_type :=
  -- (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -- addr[      31]
  -- 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);-- addr[      63]
  constant t_up : ps_w_rom_type :=
  (1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 2, 2, 2, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 2, 2, 2, 1, 0, 1, 1, 1, 1, -- addr[      31]
  0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);-- addr[      63]
  constant t_down : ps_w_rom_type :=
  (0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 2, 2, 2, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 2, 2, 2, 1, 0, 1, 1, 1, -- addr[      31]
  1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);-- addr[      63]
  constant t_right : ps_w_rom_type :=
  (1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2, 1, 0, 1, 2, 2, 2, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0, 0, -- addr[      31]
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);-- addr[      63]
  constant t_left : ps_w_rom_type :=
  (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 1, 0, 0, 1, 2, 2, 2, 1, 0, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, -- addr[      31]
  1, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);-- addr[      63]
  --
end BS_W_define;
--
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.bs_define.all;
use work.BS_W_define.all;
--
entity ct_pos_ele_weight is
  generic (
    ADDRESS_WIDTH : natural := (C_6_CH_BIT_WIDTH); -- 9; -- [7][37]
    DATA_WIDTH : natural := (2) --
  );
  port (
    clock : in std_logic;
    address : in std_logic_vector ((ADDRESS_WIDTH - 1) downto 0);
    data_up_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0);
    data_down_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0);
    data_right_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0);
    data_left_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0)
  );
end ct_pos_ele_weight;
--
architecture arch of ct_pos_ele_weight is
  constant t_pos_element_weight : ps_w_rom_type :=
  (t_left(0) * 64 + t_right(0) * 16 + t_down(0) * 4 + t_up(0),
  t_left(1) * 64 + t_right(1) * 16 + t_down(1) * 4 + t_up(1),
  t_left(2) * 64 + t_right(2) * 16 + t_down(2) * 4 + t_up(2),
  t_left(3) * 64 + t_right(3) * 16 + t_down(3) * 4 + t_up(3),
  t_left(4) * 64 + t_right(4) * 16 + t_down(4) * 4 + t_up(4),
  t_left(5) * 64 + t_right(5) * 16 + t_down(5) * 4 + t_up(5),
  t_left(6) * 64 + t_right(6) * 16 + t_down(6) * 4 + t_up(6),
  t_left(7) * 64 + t_right(7) * 16 + t_down(7) * 4 + t_up(7),
  t_left(8) * 64 + t_right(8) * 16 + t_down(8) * 4 + t_up(8),
  t_left(9) * 64 + t_right(9) * 16 + t_down(9) * 4 + t_up(9),
  t_left(10) * 64 + t_right(10) * 16 + t_down(10) * 4 + t_up(10),
  t_left(11) * 64 + t_right(11) * 16 + t_down(11) * 4 + t_up(11),
  t_left(12) * 64 + t_right(12) * 16 + t_down(12) * 4 + t_up(12),
  t_left(13) * 64 + t_right(13) * 16 + t_down(13) * 4 + t_up(13),
  t_left(14) * 64 + t_right(14) * 16 + t_down(14) * 4 + t_up(14),
  t_left(15) * 64 + t_right(15) * 16 + t_down(15) * 4 + t_up(15),
  t_left(16) * 64 + t_right(16) * 16 + t_down(16) * 4 + t_up(16),
  t_left(17) * 64 + t_right(17) * 16 + t_down(17) * 4 + t_up(17),
  t_left(18) * 64 + t_right(18) * 16 + t_down(18) * 4 + t_up(18),
  t_left(19) * 64 + t_right(19) * 16 + t_down(19) * 4 + t_up(19),
  t_left(20) * 64 + t_right(20) * 16 + t_down(20) * 4 + t_up(20),
  t_left(21) * 64 + t_right(21) * 16 + t_down(21) * 4 + t_up(21),
  t_left(22) * 64 + t_right(22) * 16 + t_down(22) * 4 + t_up(22),
  t_left(23) * 64 + t_right(23) * 16 + t_down(23) * 4 + t_up(23),
  t_left(24) * 64 + t_right(24) * 16 + t_down(24) * 4 + t_up(24),
  t_left(25) * 64 + t_right(25) * 16 + t_down(25) * 4 + t_up(25),
  t_left(26) * 64 + t_right(26) * 16 + t_down(26) * 4 + t_up(26),
  t_left(27) * 64 + t_right(27) * 16 + t_down(27) * 4 + t_up(27),
  t_left(28) * 64 + t_right(28) * 16 + t_down(28) * 4 + t_up(28),
  t_left(29) * 64 + t_right(29) * 16 + t_down(29) * 4 + t_up(29),
  t_left(30) * 64 + t_right(30) * 16 + t_down(30) * 4 + t_up(30),
  t_left(31) * 64 + t_right(31) * 16 + t_down(31) * 4 + t_up(31),
  t_left(32) * 64 + t_right(32) * 16 + t_down(32) * 4 + t_up(32),
  t_left(33) * 64 + t_right(33) * 16 + t_down(33) * 4 + t_up(33),
  t_left(34) * 64 + t_right(34) * 16 + t_down(34) * 4 + t_up(34),
  t_left(35) * 64 + t_right(35) * 16 + t_down(35) * 4 + t_up(35),
  t_left(36) * 64 + t_right(36) * 16 + t_down(36) * 4 + t_up(36),
  t_left(37) * 64 + t_right(37) * 16 + t_down(37) * 4 + t_up(37),
  t_left(38) * 64 + t_right(38) * 16 + t_down(38) * 4 + t_up(38),
  t_left(39) * 64 + t_right(39) * 16 + t_down(39) * 4 + t_up(39),
  t_left(40) * 64 + t_right(40) * 16 + t_down(40) * 4 + t_up(40),
  t_left(41) * 64 + t_right(41) * 16 + t_down(41) * 4 + t_up(41),
  t_left(42) * 64 + t_right(42) * 16 + t_down(42) * 4 + t_up(42),
  t_left(43) * 64 + t_right(43) * 16 + t_down(43) * 4 + t_up(43),
  t_left(44) * 64 + t_right(44) * 16 + t_down(44) * 4 + t_up(44),
  t_left(45) * 64 + t_right(45) * 16 + t_down(45) * 4 + t_up(45),
  t_left(46) * 64 + t_right(46) * 16 + t_down(46) * 4 + t_up(46),
  t_left(47) * 64 + t_right(47) * 16 + t_down(47) * 4 + t_up(47),
  t_left(48) * 64 + t_right(48) * 16 + t_down(48) * 4 + t_up(48),
  t_left(49) * 64 + t_right(49) * 16 + t_down(49) * 4 + t_up(49),
  t_left(50) * 64 + t_right(50) * 16 + t_down(50) * 4 + t_up(50),
  t_left(51) * 64 + t_right(51) * 16 + t_down(51) * 4 + t_up(51),
  t_left(52) * 64 + t_right(52) * 16 + t_down(52) * 4 + t_up(52),
  t_left(53) * 64 + t_right(53) * 16 + t_down(53) * 4 + t_up(53),
  t_left(54) * 64 + t_right(54) * 16 + t_down(54) * 4 + t_up(54),
  t_left(55) * 64 + t_right(55) * 16 + t_down(55) * 4 + t_up(55),
  t_left(56) * 64 + t_right(56) * 16 + t_down(56) * 4 + t_up(56),
  t_left(57) * 64 + t_right(57) * 16 + t_down(57) * 4 + t_up(57),
  t_left(58) * 64 + t_right(58) * 16 + t_down(58) * 4 + t_up(58),
  t_left(59) * 64 + t_right(59) * 16 + t_down(59) * 4 + t_up(59),
  t_left(60) * 64 + t_right(60) * 16 + t_down(60) * 4 + t_up(60),
  t_left(61) * 64 + t_right(61) * 16 + t_down(61) * 4 + t_up(61),
  t_left(62) * 64 + t_right(62) * 16 + t_down(62) * 4 + t_up(62),
  t_left(63) * 64 + t_right(63) * 16 + t_down(63) * 4 + t_up(63));
  --
begin
  --
  process (clock)
    variable vdata_all_output : std_logic_vector(7 downto 0) := (others => '0');
  begin
    if (rising_edge(clock)) then
      vdata_all_output := std_logic_vector(to_unsigned(t_pos_element_weight(conv_integer(address)), 8));
      data_up_output <= vdata_all_output(1 downto 0);
      data_down_output <= vdata_all_output(3 downto 2);
      data_right_output <= vdata_all_output(5 downto 4);
      data_left_output <= vdata_all_output(7 downto 6);
    end if;
  end process;
  --
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- library ieee;
-- use ieee.numeric_bit.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.bs_define.all;
--
entity c_pos_mux is
  generic (
    data_input_length : natural := C_46_DIR_SUM_DATA_BIT; -- 40; -- RxSig(24) * mDirBeamWeight(16)
    data_output_length : natural := C_46_DIR_SUM_DATA_BIT; -- 46; -- RxSig(24) * mDirBeamWeight(16) , 37 channel plus (6bit)
    weight_length : natural := (C_2_POS_W_BIT_WIDTH) -- 2 -- 24 bit...
  );
  port (
    clock : in std_logic;
    enable : in std_logic;
    weight : in std_logic_vector ((weight_length - 1) downto 0);
    data_input_1 : in std_logic_vector ((data_input_length - 1) downto 0);
    data_input_2 : in std_logic_vector ((data_input_length - 1) downto 0);
    data_output : out std_logic_vector ((data_output_length - 1) downto 0)
  );
end entity;
--
architecture rtl of c_pos_mux is
begin
  process (clock)
    variable vdata_in_1 : signed((data_input_length - 1) downto 0) := (others => '0');
    variable vdata_in_2 : signed((data_output_length - 1) downto 0) := (others => '0');
    variable vdata_out : signed((data_output_length - 1) downto 0) := (others => '0');
  begin
    if (rising_edge(clock) and enable = '1') then
      vdata_in_1 := signed(data_input_1);
      vdata_in_2 := signed(data_input_2);
      --
      if weight = B"01" then
        vdata_out := vdata_in_1;
      elsif weight = B"10" then
        vdata_out := vdata_in_2;
      else
        vdata_out := (others => '0');
      end if;
      data_output <= std_logic_vector(vdata_out);
    end if;
  end process;
end rtl;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- Simple Dual-Port Block RAM with Two Clocks
-- Correct Modelization with a Shared Variable
-- File: dpram_chip.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.bs_define.all;
--
-- ram(address[11bit]) = data[24bit]
--
entity dpram_chip is
  generic (
    ADDRESS_WIDTH : natural := (C_5_CH_DELAY_BIT_WIDTH + C_6_CH_BIT_WIDTH); -- 11; -- [18][37] -- 5 + 6 =  11
    DATA_WIDTH : natural := (C_24_CH_DATA_BIT) -- 24 bit...
  );
  port (
    clka : in std_logic;
    clkb : in std_logic;
    wea : in std_logic;
    addra : in std_logic_vector((ADDRESS_WIDTH - 1) downto 0);
    addrb : in std_logic_vector((ADDRESS_WIDTH - 1) downto 0);
    dia : in std_logic_vector((DATA_WIDTH - 1) downto 0);
    dob : out std_logic_vector((DATA_WIDTH - 1) downto 0)
  );
end entity;
--
architecture rtl of dpram_chip is
  type ram_type is array (0 to (2 ** (ADDRESS_WIDTH) - 1)) of std_logic_vector((DATA_WIDTH - 1) downto 0);
  signal ram : ram_type := (others => (others => '0'));
  --
begin
  --
  process (clka)
  begin
    if (clka'event and clka = '1') then
      if (wea = '1') then
        ram(conv_integer(addra)) <= dia;
      end if;
    end if;
  end process;
  --
  process (clkb)
  begin
    if (clkb'event and clkb = '1') then
      dob <= ram(conv_integer(addrb));
    end if;
  end process;
  --
end rtl;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================