----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2018 07:07:53 PM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.Numeric_Std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port (  clk : in std_logic;
            address : in std_logic_vector(3 downto 0);
            we : in std_logic;
            compute : in std_logic;
            mode_change : in  std_logic;
            mode_select : in std_logic_vector(1 downto 0);
            data_i : in std_logic_vector(7 downto 0);
            data_o : out std_logic_vector(7 downto 0);
            state_display : out std_logic_vector(1 downto 0);
            Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
            LED_out : out STD_LOGIC_VECTOR (6 downto 0)); 
end main;

architecture Behavioral of main is

type ram_t is array (0 to 15) of std_logic_vector(15 downto 0);

signal ram : ram_t := (others => (others => '0'));	
signal state : integer range 0 to 3;
signal temp : std_logic_vector(15 downto 0) := (others => '0');
signal LED_BCD: std_logic_vector(3 downto 0); -- for 7 segment
signal refresh_counter: STD_LOGIC_VECTOR (20 downto 0); --for 7 segment
signal LED_activating_counter: std_logic_vector(1 downto 0);
signal bcd_out : std_logic_vector(19 downto 0);
signal clk_div : std_logic_vector(4 downto 0);
signal red_clk : std_logic;

component binary_to_bcd
port(   binary_in : in STD_LOGIC_VECTOR (15 downto 0);
        bcd_out : out STD_LOGIC_VECTOR (19 downto 0);
        clk : in std_logic);
end component;

begin

converter: binary_to_bcd port map(
    clk => clk,
    bcd_out => bcd_out,
    binary_in => temp
);

red_clk <= clk_div(4);

clock_divider : process(clk)
begin
    if rising_edge(clk)then
        clk_div <= clk_div + 1;
    end if;
end process;

main_proc : process(red_clk)
    variable temp_var: std_logic_vector(15 downto 0);
    variable temp_array: ram_t := (others => (others => '0'));
    variable cnt1: integer range 0 to 255;
    variable cnt2: integer range 0 to 255;
begin
    if rising_edge(red_clk) then
        if (mode_change = '1' and we ='0' and compute = '0') then
            if(mode_select = "00") then
                state <= 0;
                state_display <= "00";
            elsif (mode_select = "01") then
                state <= 1;
                state_display <= "01";
            elsif (mode_select = "10") then
                state <= 2;
                state_display <= "10";
            else
                state <= 3;
                state_display <= "11";
            end if;
        elsif (we = '1' and state = 0 and compute = '0') then
            ram(to_integer(unsigned(address)))(7 downto 0) <= data_i;
        elsif (compute = '1' and state = 1) then
            temp_array := ram;
            for i in 0 to 6 loop
                for j in 0 to 6-i loop
                    if (temp_array(j) > temp_array(j+1)) then
                        temp_var := temp_array(j);
                        temp_array(j) := temp_array(j+1);
                        temp_array(j+1) := temp_var;
                    end if;
                end loop;
            end loop;
            temp_array(8) := temp_array(0) + temp_array(1) + temp_array(2) + temp_array(3) + temp_array(4) + temp_array(5) + temp_array(6) + temp_array(7);
            temp_array(9)(12 downto 0) := temp_array(8)(15 downto 3);
            temp_array(10) := temp_array(3) + temp_array(4);
            temp_array(10) := '0' & temp_array(10)(15 downto 1);
            temp_array(11) := temp_array(7);
            temp_array(12) := temp_array(0);
            cnt1 := 1;
            cnt2 := 1;
            temp_array(13) := temp_array(0);
            for i in 1 to 7 loop
                if(temp_array(i-1) = temp_array(i)) then
                    cnt2 := cnt2 + 1;
                elsif(cnt1 <= cnt2) then
                    temp_array(13) := temp_array(i-1);
                    cnt1 := cnt2;
                    cnt2 := 1;
                end if;
            end loop;
            if(cnt1 <= cnt2) then
                temp_array(13) := temp_array(7);
            end if;
            temp_array(14) := temp_array(7) - temp_array(0);
            temp_array(15) := '0' & temp_array(14)(15 downto 1);
            ram <= temp_array;
        else 
            if(state = 0 or state = 2) then
                temp <= ram(to_integer(unsigned(address)));
            elsif(state = 3) then
                ram <= (others => (others => '0'));
                temp <= (others => '0');
            end if;
        end if;
   end if;
end process;

data_o <= temp(7 downto 0);

process(Clk)
begin 
    if(rising_edge(Clk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
 LED_activating_counter <= refresh_counter(20 downto 19);

process(LED_activating_counter)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate <= "0111"; 
        -- activate LED1 and Deactivate LED2, LED3, LED4
          LED_BCD <= bcd_out(15 downto 12);
        -- the first hex digit of the 16-bit number
    when "01" =>
        Anode_Activate <= "1011"; 
        -- activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD <= bcd_out(11 downto 8);
        -- the second hex digit of the 16-bit number
    when "10" =>
        Anode_Activate <= "1101"; 
        -- activate LED3 and Deactivate LED2, LED1, LED4
             LED_BCD <= bcd_out(7 downto 4);
        -- the third hex digit of the 16-bit number
    when "11" =>
        Anode_Activate <= "1110"; 
        -- activate LED4 and Deactivate LED2, LED3, LED1);
         LED_BCD <= bcd_out(3 downto 0);
        -- the fourth hex digit of the 16-bit number   
     when others => NULL; 
    end case;
end process;

process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => LED_out <= "0000001"; -- "0"     
    when "0001" => LED_out <= "1001111"; -- "1" 
    when "0010" => LED_out <= "0010010"; -- "2" 
    when "0011" => LED_out <= "0000110"; -- "3" 
    when "0100" => LED_out <= "1001100"; -- "4" 
    when "0101" => LED_out <= "0100100"; -- "5" 
    when "0110" => LED_out <= "0100000"; -- "6" 
    when "0111" => LED_out <= "0001111"; -- "7" 
    when "1000" => LED_out <= "0000000"; -- "8"     
    when "1001" => LED_out <= "0000100"; -- "9" 
--    when "1010" => LED_out <= "0000010"; -- a
--    when "1011" => LED_out <= "1100000"; -- b
--    when "1100" => LED_out <= "0110001"; -- C
--    when "1101" => LED_out <= "1000010"; -- d
--    when "1110" => LED_out <= "0110000"; -- E
--    when "1111" => LED_out <= "0111000"; -- F
    when others => NULL;
    end case;
end process;

end Behavioral;
