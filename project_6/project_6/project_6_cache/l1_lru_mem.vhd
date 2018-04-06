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

entity l1_lru_mem is
port(
	lru_in0 : in std_logic_vector(1 downto 0);
	lru_in1 : in std_logic_vector(1 downto 0);
	lru_in2 : in std_logic_vector(1 downto 0);
	lru_in3 : in std_logic_vector(1 downto 0);
	lru_out0 : out std_logic_vector(1 downto 0);
	lru_out1 : out std_logic_vector(1 downto 0);
	lru_out2 : out std_logic_vector(1 downto 0);
	lru_out3 : out std_logic_vector(1 downto 0);
	clka : in std_logic;
	lru_wea0 : in std_logic;
	lru_wea1 : in std_logic;
	lru_wea2: in std_logic;
	lru_wea3 : in std_logic;
	addra : in std_logic_vector(4 downto 0)
);
end l1_lru_mem;

architecture Behavioral of l1_lru_mem is
COMPONENT l1_lru0
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l1_lru1
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l1_lru2
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
COMPONENT l1_lru3
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
begin

lru0 : l1_lru0
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea0,
    addra => addra,
    dina => lru_in0,
    douta => lru_out0
  );
  lru1 : l1_lru1
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea1,
    addra => addra,
    dina => lru_in1,
    douta => lru_out1
  );
  lru2 : l1_lru2
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea2,
    addra => addra,
    dina => lru_in2,
    douta => lru_out2
  );
  lru3 : l1_lru3
  PORT MAP (
    clka => clka,
    wea(0) => lru_wea3,
    addra => addra,
    dina => lru_in3,
    douta => lru_out3
  );

end Behavioral;

