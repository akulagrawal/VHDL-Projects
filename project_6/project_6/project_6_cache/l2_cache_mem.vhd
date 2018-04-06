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

entity l2_cache_mem is
	port(
		addra : in std_logic_vector(6 downto 0);
		dina : in std_logic_vector(133 downto 0); -- 128 data bits -- 5 tag bits -- 1 valid bti--
		douta0 : out std_logic_vector(133 downto 0);
		douta1 : out std_logic_vector(133 downto 0);
		douta2 : out std_logic_vector(133 downto 0);
		douta3 : out std_logic_vector(133 downto 0);
		douta4 : out std_logic_vector(133 downto 0);
		douta5 : out std_logic_vector(133 downto 0);
		douta6 : out std_logic_vector(133 downto 0);
		douta7 : out std_logic_vector(133 downto 0);
		wea0 : in std_logic;
		wea1 : in std_logic;
		wea2 : in std_logic;
		wea3 : in std_logic;
		wea4 : in std_logic;
		wea5 : in std_logic;
		wea6 : in std_logic;
		wea7 : in std_logic;
		clka : in std_logic
	);
end l2_cache_mem;

architecture Behavioral of l2_cache_mem is



COMPONENT L2_cache_block
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(133 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(133 DOWNTO 0)
  );
END COMPONENT;
begin

l1_block0 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea0,
    addra => addra,
    dina => dina,
    douta => douta0
  );
  
l1_block1 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea1,
    addra => addra,
    dina => dina,
    douta => douta1
  );
  
l1_block2 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea2,
    addra => addra,
    dina => dina,
    douta => douta2
  );

l1_block3 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea3,
    addra => addra,
    dina => dina,
    douta => douta3
  );
l1_block4 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea4,
    addra => addra,
    dina => dina,
    douta => douta4
  );
  
l1_block5 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea5,
    addra => addra,
    dina => dina,
    douta => douta5
  );
  
l1_block6 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea6,
    addra => addra,
    dina => dina,
    douta => douta6
  );

l1_block7 : L2_cache_block
  PORT MAP (
    clka => clka,
    wea(0) => wea7,
    addra => addra,
    dina => dina,
    douta => douta7
  );
  

end Behavioral;

