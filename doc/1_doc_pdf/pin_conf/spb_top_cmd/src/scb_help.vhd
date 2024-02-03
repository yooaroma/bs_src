-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
--
-- 이번시간은 Function 과 Procedure에 대해서 알아봅니다.
-- VHDL의 두개의 Subprogram 있느데 그게 바로 Function 과 Procedure 입니다.
-- 디자인이 커지고 복잡해 지다보면 디자인의 Sub Module들이 같은 기능을 하는 블럭들을 포함하게 됩니다.
-- 이 때 이런 블럭들을 Sub Module에 각각 다 써주게 되면 여러가지로 불편한 점이 많습니다.
-- 간단한 예로 만약 이 블럭에서 문제가 있어서 수정을 했을 때 각각의 블럭을 다 고쳐 주어야 하기 때문이죠.
-- 이런 블럭을 Subprogram으로 만들어 놓고 이것을 모듈에서 불러서 쓴다면 이런일은 없겠죠..
-- 그래서 Subprogram을 사용하게 됩니다.
-- 이런 Subprogram들은 여러 모듈에서 사용할 수 있도록
-- Package에 만들어 놓은 후 가각의 모듈에서는 이 Package를 포함 시킨 후 사용을 합니다.
-- 그런데 Function과 Procedure는 차이점 이 있습니다.
-- 대표적인 차이점은 리턴값입니다. Function은 C의 function처럼 한개의 리턴값만 가질 수 있습니다.
-- 하지만 Procedure는 여러개의 리터값을 전달할 수 있는 부분이 다릅니다.
-- 예제를 보면 쉽게 이해가 가겠죠.
-- ● Procedure Example
--
-- Package Declaration Section
library work;
use work.example_package.all;
--
package example_package is
  constant c_PIXELS : integer := 65536;
  type t_FROM_FIFO is record
    wr_full : std_logic;
    rd_empty : std_logic;
  end record t_FROM_FIFO;
  component example_component is
    port (
      i_data : in std_logic;
      o_rsult : out std_logic);
  end component example_component;
  function Bitwise_AND (
    i_vector : in std_logic_vector(3 downto 0)
  ) return std_logic;
end package example_package;
-- Package Body Section
package body example_package is
  function Bitwise_AND (
    i_vector : in std_logic_vector(3 downto 0)
  )    
  return std_logic is
  begin
    return (i_vector (0) and i_vector (1) and i_vector (2) and i_vector (3));
  end;
end package body example_package;
--
-- 여러개의 entity에서 프로시져를 사용해야 한다면 package 안에 프로시져를 선언해 두고 package body 안에 프로시져를 만듭니다.
--
library IEEE;
use IEEE.std_logic_1164.all;
use work.my_pack.all;
entity MOD1 is
  port (
    IN_BUS : in std_logic_vector (31 downto 0);--             . . .
    OUT_BUS : out std_logic_vector (31 downto0)
  );
end MOD1;
architecture RTL of MOD1 is
begin
  process (IN_BUS)
    variable TEMP_BUS : std_logic_vector (31 downto 0);
  begin
    BIT_REV_32 (IN_BUS, TEMP_BUS);
    OUT_BUS <= TEMP_BUS;
  end process;
end architecture RTL;
--
-- 위 예제와 같이 모듈에서 프로시져를 불러와서 사용합니다.
-- 만약 한개의 entity안에서만 사용한다면 프로시저를 architecture와 begin 사이에 만들어 놓고
-- begin과 end architecture사에서 프로시저를 사용하면 됩니다.
-- 이것은 function도 같습니다.
-- ● function Example
--
architecture RTL of Mod1 is
  --
  function PAR_GEN(BV : in bit_vector) return bit is
    variablePAR : bit := '0';
  begin
    for I in BV'rangeloop
      PAR := PAR xor BV (I);
    end loop;
    return PAR;
  end function PAR_GEN;
begin
  DATA_FRAME <= D_WORD & PAR_GEN (D_WORD);
end architecture RTL;
--
-- 위 예제와 같이 만들어서 사용하면 됩니다.
-- 마지막으로 이런 Subprogram을 사용할 때 자주 사용하게 되는 range attribute에 대해서 설명 드리겠습니다.
-- signalH_BYTE : std_logic_vector (7 downto 0);
-- signal WORD : std_logic_vector (0 to 3);
-- H_BYTE 'left returns 7,
-- H_BYTE 'right returns 0,
-- H_BYTE 'low returns 0,
-- H_BYTE 'range returns 7 downto 0,
-- WORD 'left returns 0,
-- WORD 'low returns 0,
-- WORD 'length returns 4,
-- WORD 'ascending returns true,
-- H - BYTE 'reverse_range returns 0 to 7
-- 위와 같은 attribute들이 있는데 위에 적어 놓은 리턴값들로 변환됩니다.
-- 이런 attribute를 사용한 예를 보면 쉽게 이해가 되실 겁니다.
-- procedure BIT_REVERSE (IN_VEC : in std_logic_vector;
-- OUT_VEC : out std_logic_vector) is
-- begin
-- for i in IN_VEC'range loop
--   OUT_VEC (i) := IN_VEC ((IN_VEC’length - 1) - i);
-- end loop;
-- end procedure BIT_REVERSE;
-- 'range 와 'length를 사용하여 프로시져가 좀 더 유연하게 작성이 되었습니다.
-- 위와 같은 attribute를 사용하면 좀 더 유연한 프로그램을 작성할 수 있습니다.
-- [출처] VHDL 기본 07 - function 과 procedure | 작성자 수원은찬
-- //=============================================================================
-- //=============================================================================