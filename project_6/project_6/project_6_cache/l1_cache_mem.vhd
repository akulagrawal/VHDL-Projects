----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:58 03/29/2018 
-- Design Name: 
-- Module Name:    l1_cache_mem - Behavioral 
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

entity l1_cache_mem is
	port(
		addra : in std_logic_vector(4 downto 0);
		dina : in std_logic_vector(135 downto 0); -- 128 data bits -- 7 tag bits -- 1 valid bti--
		douta0 : out std_logic_vector(135 downto 0);
		douta1 : out std_logic_vector(135 downto 0);
		douta2 : out std_logic_vector(135 downto 0);
		douta3 : out std_logic_vector(135 downto 0);
		wea0 : in std_logic;
		wea1 : in std_logic;
		wea2 : in std_logic;
		wea3 : in std_logic;
		clka : in std_logic
	);
end l1_cache_mem;

architecture Behavioral of l1_cache_mem is



COMPONENT L1_cache_block
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(135 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(135 DOWNTO 0)
  );
END COMPONENT;
begin

l1_block0 : L1_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea0,
    addra => addra,
    dina => dina,
    douta => douta0
  );
  
l1_block1 : L1_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea1,
    addra => addra,
    dina => dina,
    douta => douta1
  );
  
l1_block2 : L1_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea2,
    addra => addra,
    dina => dina,
    douta => douta2
  );

l1_block3 : L1_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea3,
    addra => addra,
    dina => dina,
    douta => douta3
  );
  
  

end Behavioral;

