----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:06 03/29/2018 
-- Design Name: 
-- Module Name:    l1_lru_mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity l2_lru_mem is
port(
	lru_in0 : in std_logic_vector(2 downto 0);
	lru_in1 : in std_logic_vector(2 downto 0);
	lru_in2 : in std_logic_vector(2 downto 0);
	lru_in3 : in std_logic_vector(2 downto 0);
	lru_in4 : in std_logic_vector(2 downto 0);
	lru_in5 : in std_logic_vector(2 downto 0);
	lru_in6 : in std_logic_vector(2 downto 0);
	lru_in7 : in std_logic_vector(2 downto 0);
	lru_out0 : out std_logic_vector(2 downto 0);
	lru_out1 : out std_logic_vector(2 downto 0);
	lru_out2 : out std_logic_vector(2 downto 0);
	lru_out3 : out std_logic_vector(2 downto 0);
	lru_out4 : out std_logic_vector(2 downto 0);
	lru_out5 : out std_logic_vector(2 downto 0);
	lru_out6 : out std_logic_vector(2 downto 0);
	lru_out7 : out std_logic_vector(2 downto 0);
	clka : in std_logic;
	lru_wea0 : in std_logic;
	lru_wea1 : in std_logic;
	lru_wea2 : in std_logic;
	lru_wea3 : in std_logic;
	lru_wea4 : in std_logic;
	lru_wea5 : in std_logic;
	lru_wea6 : in std_logic;
	lru_wea7 : in std_logic;
	addra : in std_logic_vector(6 downto 0)
);
end l2_lru_mem;

architecture Behavioral of l2_lru_mem is
COMPONENT l2_lru0
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru1
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru2
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru3
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru4
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru5
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru6
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l2_lru7
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;

begin

  lru0 : l2_lru0
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea0,
    addra => addra,
    dina => lru_in0,
    douta => lru_out0
  );
  lru1 : l2_lru1
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea1,
    addra => addra,
    dina => lru_in1,
    douta => lru_out1
  );
  lru2 : l2_lru2
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea2,
    addra => addra,
    dina => lru_in2,
    douta => lru_out2
  );
  lru3 : l2_lru3
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea3,
    addra => addra,
    dina => lru_in3,
    douta => lru_out3
  );
  lru4 : l2_lru4
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea4,
    addra => addra,
    dina => lru_in4,
    douta => lru_out4
  );
  lru5 : l2_lru5
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea5,
    addra => addra,
    dina => lru_in5,
    douta => lru_out5
  );
  lru6 : l2_lru6
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea6,
    addra => addra,
    dina => lru_in6,
    douta => lru_out6
  );
  lru7 : l2_lru7
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea7,
    addra => addra,
    dina => lru_in7,
    douta => lru_out7
  );
end Behavioral;

