----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:45 03/29/2018 
-- Design Name: 
-- Module Name:    l1_top_level - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity l1_top_level is
	port(
		l1_addra : in std_logic_vector(15 downto 0);
		l1_dina : in std_logic_vector(127 downto 0);
		clka : in std_logic;
		l1_wea : in std_logic;
		l1_hit : out std_logic;
		l1_douta : out std_logic_vector(127 downto 0);
		l1_lru_update : in std_logic;
		lru_0 : OUT std_logic_vector(1 downto 0);
		lru_1 : OUT std_logic_vector(1 downto 0);
		lru_2 : OUT std_logic_vector(1 downto 0);
		lru_3 : OUT std_logic_vector(1 downto 0);
		tag0 : out std_logic_vector(6 downto 0);
		tag1 : out std_logic_vector(6 downto 0);
		tag2 : out std_logic_vector(6 downto 0);
		tag3 : out std_logic_vector(6 downto 0);
		l1_lru_complete : out std_logic
	);
end l1_top_level;

architecture Behavioral of l1_top_level is
	type write_states is (
		enable_writing,
		disable_writing
	);
	type update_states is (
		start_update,
		l1_wea_down,
		l1_complete_down
	);
	type lru_array is array (0 to 31) of std_logic_vector(1 downto 0);
	signal lru_block0 : lru_array := (others => "00");
	signal lru_block1 : lru_array := (others => "01");
	signal lru_block2 : lru_array := (others => "10");
	signal lru_block3 : lru_array := (others => "11");
 	
	signal address : integer ;
	signal write_state : write_states := enable_writing;
	signal update_state : update_states := start_update;
	signal dina : std_logic_vector(135 downto 0);
	signal wea0 : std_logic := '0';
	signal wea1 : std_logic := '0';
	signal wea2 : std_logic := '0';
	signal wea3 : std_logic := '0';
	signal douta0 : std_logic_vector(135 downto 0);
	signal douta1 : std_logic_vector(135 downto 0);
	signal douta2 : std_logic_vector(135 downto 0);
	signal douta3 : std_logic_vector(135 downto 0);
	signal lru_in0 : std_logic_vector(1 downto 0);
	signal lru_in1 : std_logic_vector(1 downto 0);
	signal lru_in2 : std_logic_vector(1 downto 0);
	signal lru_in3 : std_logic_vector(1 downto 0);
	signal lru_out0 : std_logic_vector(1 downto 0);
	signal lru_out1 : std_logic_vector(1 downto 0);
	signal lru_out2 : std_logic_vector(1 downto 0);
	signal lru_out3 : std_logic_vector(1 downto 0);
	signal equal_0, equal_1, equal_2, equal_3 : std_logic;
	
	signal tag :std_logic_vector(6 downto 0);
	signal set_number : std_logic_vector(4 downto 0);
	signal ini : std_logic := '1';
	COMPONENT l1_cache_mem
	PORT(
		addra : IN std_logic_vector(4 downto 0);
		dina : IN std_logic_vector(135 downto 0);
		wea0 : IN std_logic;
		wea1 : IN std_logic;
		wea2 : IN std_logic;
		wea3 : IN std_logic;
		clka : IN std_logic;          
		douta0 : OUT std_logic_vector(135 downto 0);
		douta1 : OUT std_logic_vector(135 downto 0);
		douta2 : OUT std_logic_vector(135 downto 0);
		douta3 : OUT std_logic_vector(135 downto 0)
		);
	END COMPONENT;
	
	COMPONENT L1_comparator is
    PORT (
        add_tag : in std_logic_vector(6 downto 0);
        data_tag : in std_logic_vector(6 downto 0);
        valid_bit : in std_logic;
        equal : out std_logic
    );
    END COMPONENT L1_comparator; 
	
begin
	address <= to_integer(unsigned(l1_addra(8 downto 4)));
	lru_out0 <= lru_block0(address);
	lru_out1 <= lru_block1(address);
	lru_out2 <= lru_block2(address);
	lru_out3 <= lru_block3(address);
	tag <= l1_addra(15 downto 9);
	set_number <= l1_addra(8 downto 4);
	tag0 <= douta0(6 downto 0);
	tag1 <= douta1(6 downto 0);
	tag2 <= douta2(6 downto 0);
	tag3 <= douta3(6 downto 0);
	l1_mem : l1_cache_mem 
	PORT MAP(
		addra => set_number,
		dina => dina,
		douta0 => douta0,
		douta1 => douta1,
		douta2 => douta2,
		douta3 => douta3,
		wea0 => wea0,
		wea1 => wea1,
		wea2 => wea2,
		wea3 => wea3,
		clka => clka 
	);
	
	L1_comparator_0 : component L1_comparator
    port map(
        add_tag => tag,
        data_tag => douta0(6 downto 0),
        valid_bit => douta0(7),
        equal => equal_0
    );
    
    L1_comparator_1 : component L1_comparator
    port map(
        add_tag => tag,
        data_tag => douta1(6 downto 0),
        valid_bit => douta1(7),
        equal => equal_1
    );
    
    L1_comparator_2 : component L1_comparator
    port map(
        add_tag => tag,
        data_tag => douta2(6 downto 0),
        valid_bit => douta2(7),
        equal => equal_2
    );
    
    L1_comparator_3 : component L1_comparator
    port map(
        add_tag => tag,
        data_tag => douta3(6 downto 0),
        valid_bit => douta3(7),
        equal => equal_3
    );
    
	 L1_hit <= equal_0 or equal_1 or equal_2 or equal_3;
	 
	 lru_update : process(clka, lru_out0, lru_out1, lru_out2, lru_out3)
		variable prev_val0 : std_logic_vector(1 downto 0) := "00";
		variable prev_val1 : std_logic_vector(1 downto 0) := "01";
		variable prev_val2 : std_logic_vector(1 downto 0) := "10";
		variable prev_val3 : std_logic_vector(1 downto 0) := "11";
		variable min_val : std_logic_vector(1 downto 0) := "00";
	 begin
		prev_val0 := lru_out0;
		prev_val1 := lru_out1;
		prev_val2 := lru_out2;
		prev_val3 := lru_out3;
		if rising_edge(clka) then
			case update_state is
				when start_update=>
					if(l1_lru_update = '1') then
						if(equal_0 = '1') then
							min_val := prev_val0;
							lru_block0(address) <= "00";
						elsif (equal_1 = '1') then
							min_val := prev_val1;
							lru_block1(address) <= "00";
						elsif (equal_2 = '1') then
							min_val := prev_val2;
							lru_block2(address) <= "00";
						elsif (equal_3 = '1') then
							min_val := prev_val3;
							lru_block3(address) <= "00";
						end if;
						if (prev_val0 < min_val) then
							lru_block0(address) <= prev_val0 + 1;
						end if;
						if (prev_val1 < min_val) then
							lru_block1(address) <= prev_val1 + 1;
						end if;
						if (prev_val2 < min_val) then
							lru_block2(address) <= prev_val2 + 1;
						end if;
						if (prev_val3 < min_val) then
							lru_block3(address) <= prev_val3 + 1;
						end if;
						update_state <= l1_wea_down;
					end if;
				when l1_wea_down=>
					update_state <= l1_complete_down;
					l1_lru_complete <= '1';
				when l1_complete_down=>
					if(l1_lru_update = '0') then
						l1_lru_complete <= '0';
						update_state <= start_update;
					end if;
			end case;
		end if;
	 end process;
	 
	 write_data : process(clka)
	 begin
		if rising_edge(clka) then
			case write_state is
				when enable_writing=>
					if(lru_out0 = "11") then
						wea0 <= l1_wea;
					elsif(lru_out1 = "11") then
						wea1 <= l1_wea;
					elsif(lru_out2 = "11") then
						wea2 <= l1_wea;
					else
						wea3 <= l1_wea;
					end if;
					write_state <= disable_writing;
				when disable_writing=>
					wea0 <= '0';
					wea1 <= '0';
					wea2 <= '0';
					wea3 <= '0';
					write_state <= enable_writing;
			end case;
		end if;
	 end process;
	 
	 dina <= l1_dina & "1" & tag;
	 
end Behavioral;

