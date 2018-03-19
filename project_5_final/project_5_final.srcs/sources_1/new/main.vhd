----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2018 02:09:11 PM
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
        uart_txd : out std_logic;
        uart_rxd : in std_logic;
        data_o : out std_logic_vector(15 downto 0));
end main;

architecture Behavioral of main is
--1 -- mode_select is state in which board waits for some input to go down.
--2 -- wait_for_mode, wait_for_input are state in which board waits rx_DV signal to go down to prevent board from accepting same byte twice
--3 -- wait_for_display2 is state which in which board waits for tx_active signal to go up so that dv signal can be brought down so
-- as to prevent byte being send twice
--4 -- display_1 and display2 are states in which tx_dv goes up to starts transmission.
--5 -- in compute state computation is done
type state_types is (mode_select, wait_for_mode, wait_for_input, wait_for_display_2, input, compute, display_1, display_2);
type ram_t is array (0 to 15) of std_logic_vector(15 downto 0);

constant c_CLKS_PER_BIT : integer := 10416;

signal ram : ram_t := (others => (others => '0'));
signal address : std_logic_vector(3 downto 0);
signal state : state_types := mode_select;
signal compute_counter : std_logic_vector(3 downto 0);

signal r_RX_SERIAL : std_logic := '1';
signal w_RX_DV : std_logic := '0';
signal w_RX_BYTE : std_logic_vector(7 downto 0) ;

signal r_TX_DV : std_logic;
signal r_TX_BYTE : std_logic_vector(7 downto 0);
signal w_tx_active : std_logic;
signal w_TX_SERIAL : std_logic;
signal w_TX_DONE : std_logic;

component UART_RX is
generic (
    g_CLKS_PER_BIT : integer := 10416
);
port(
    i_clk       : in  std_logic;
      i_rx_serial : in  std_logic;
      o_rx_dv     : out std_logic;
      o_rx_byte   : out std_logic_vector(7 downto 0)
);
end component;

component UART_TX is
generic (
    g_CLKS_PER_BIT : integer := 10416     
);
port (
    i_Clk       : in  std_logic;
    i_TX_DV     : in  std_logic;
    i_TX_Byte   : in  std_logic_vector(7 downto 0);
    o_TX_Active : out std_logic;
    o_TX_Serial : out std_logic;
    o_TX_Done   : out std_logic
);
end component;

begin

-- components for receiver and transmitter.
UART_RX_INST : UART_RX
generic map (
  g_CLKS_PER_BIT => c_CLKS_PER_BIT
  )
port map (
  i_clk       => clk,
  i_rx_serial => r_RX_SERIAL,
  o_rx_dv     => w_RX_DV,
  o_rx_byte   => w_RX_BYTE
  );

 UART_TX_INST : uart_tx
 generic map (
   g_CLKS_PER_BIT => c_CLKS_PER_BIT
 )
port map (
   i_clk       => clk,
   i_tx_dv     => r_TX_DV,
   i_tx_byte   => r_TX_BYTE,
   o_tx_active => w_tx_active,
   o_tx_serial => w_TX_SERIAL,
   o_tx_done   => w_TX_DONE
);

uart_txd <= w_TX_SERIAL;
r_RX_SERIAL <= uart_rxd;

data_o <= ram(to_integer(unsigned(address)));

process(w_RX_DV, w_TX_ACTIVE, w_RX_BYTE, clk)
variable msg : std_logic_vector(7 downto 0);
variable temp_address, temp_counter : std_logic_vector(3 downto 0);
variable prev_state : state_types;
variable temp_array : ram_t := (others=>(others=>'0'));
variable temp_var : std_logic_vector(15 downto 0);
variable cnt1: integer range 0 to 255;
variable cnt2: integer range 0 to 255;
begin
    if rising_edge(clk) then
        msg := w_RX_BYTE;
        case state is
            when mode_select=>
                if(w_RX_DV='1') then
                    if msg(7 downto 4) = "0000" then
                        temp_address := msg(3 downto 0);
                        state <= wait_for_input;
                    elsif msg(7 downto 4) = "0001" then
                        state <= compute;
                    elsif msg(7 downto 4) = "0010" then
                        temp_address := msg(3 downto 0);
                        state <= display_1;
                        r_TX_BYTE <= ram(to_integer(unsigned(temp_address)))(15 downto 8);
                        r_TX_DV <= '1';
                    elsif msg(7 downto 4) = "0011" then
                        ram <= (others=>(others=>'0'));
                        address <= (others => '0'); 
                    end if;
                end if;
            when wait_for_input =>
                if(w_RX_DV='0') then
                    state <= input;
                else 
                    state <= wait_for_input;
                end if;
            when input =>
                if(w_RX_DV = '1') then
                    ram(to_integer(unsigned(address)))(7 downto 0) <= msg;
                    state <= wait_for_mode;
                end if;
            when wait_for_mode =>
                if(w_RX_DV='0') then
                    state <= mode_select;
                else 
                    state <= wait_for_mode;
                end if;
            when display_1 => 
                if w_TX_ACTIVE = '1' then
                    r_TX_DV <= '0';
                    state <= wait_for_display_2;
                end if;
            when wait_for_display_2 =>
                if w_TX_ACTIVE = '0' then
                    r_TX_BYTE <= ram(to_integer(unsigned(address)))(7 downto 0);
                    r_TX_DV <= '1';
                    state <= display_2;
                end if;
            when display_2 =>
                if w_TX_ACTIVE = '1' then
                    r_TX_DV <= '0';
                    state <= mode_select;
                end if;
            when compute =>
                temp_array := ram;
                --sorting array
                for i in 0 to 6 loop
                    for j in 0 to 6-i loop
                        if (temp_array(j) > temp_array(j+1)) then
                            temp_var := temp_array(j);
                            temp_array(j) := temp_array(j+1);
                            temp_array(j+1) := temp_var;
                        end if;
                    end loop;
                end loop;
                --sum
                temp_array(8) := temp_array(0) + temp_array(1) + temp_array(2) + temp_array(3) + temp_array(4) + temp_array(5) + temp_array(6) + temp_array(7);
                --mean
                temp_array(9)(12 downto 0) := temp_array(8)(15 downto 3);
                --median
                temp_array(10) := temp_array(3) + temp_array(4);
                temp_array(10)(14 downto 0) := temp_array(10)(15 downto 1);
                --max
                temp_array(11) := temp_array(7);
                --min
                temp_array(12) := temp_array(0);
                --max-min
                temp_array(14) := temp_array(7) - temp_array(0);
                --(max+min)/2
                temp_var := temp_array(0) + temp_array(7);
                temp_array(15)(14 downto 0) := temp_var(15 downto 1);
                --mode
                cnt1 := 1;
                cnt2 := 1;
                temp_array(13) := temp_array(0);
                if(temp_array(0) = temp_array(1)) then
                    cnt2 := cnt2 + 1;        
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(0);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(temp_array(1) = temp_array(2)) then
                    cnt2 := cnt2 + 1;
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(1);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(temp_array(2) = temp_array(3)) then
                    cnt2 := cnt2 + 1;
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(2);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(temp_array(3) = temp_array(4)) then
                    cnt2 := cnt2 + 1;
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(3);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(temp_array(4) = temp_array(5)) then
                    cnt2 := cnt2 + 1;
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(4);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(temp_array(5) = temp_array(6)) then
                    cnt2 := cnt2 + 1;
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(5);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(temp_array(6) = temp_array(7)) then
                    cnt2 := cnt2 + 1;
                else
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(6);
                    cnt1 := cnt2;
                end if;
                    cnt2 := 1;
                end if;
                if(cnt1 < cnt2) then
                    temp_array(13) := temp_array(7);
                end if;
                state <= mode_select;
                ram <= temp_array;
            when others =>
                state <= mode_select;
        end case;
    end if;
    address <= temp_address;
end process;

end Behavioral;
