----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 08:37:31
-- Design Name: 
-- Module Name: test_rx - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_rx is
    Port (  uart_rxd : in STD_LOGIC;
            uart_txd : out STD_LOGIC;
            clk : in STD_LOGIC;
            data_o : out std_logic_vector(7 downto 0);
            data_i : in std_logic_vector(7 downto 0);
            we : in std_logic
            );
end test_rx;



architecture Behavioral of test_rx is
constant c_CLKS_PER_BIT : integer := 10416;

signal r_RX_SERIAL : std_logic := '1';
signal w_RX_DV : std_logic := '0';
signal w_RX_BYTE : std_logic_vector(7 downto 0) ;
signal temp_o : std_logic_vector(7 downto 0) := "00000000";
signal r_TX_DV : std_logic;
signal r_TX_BYTE : std_logic_vector(7 downto 0);
signal w_tx_active : std_logic;
signal w_TX_SERIAL : std_logic;
signal w_TX_DONE : std_logic;

component UART_RX is
generic (
    g_CLKS_PER_BIT : integer := 10417
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
    g_CLKS_PER_BIT : integer := 115     -- Needs to be set correctly
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

r_TX_BYTE <= data_i;
uart_txd <= w_TX_SERIAL;

process(we, w_TX_DONE)
variable val : std_logic;
variable prev : std_logic;
begin
    prev := r_TX_DV;
    if we = '1' then
        val := '1';
    elsif w_TX_DONE = '1' then
        val := '0';
    else 
        val := prev;
    end if;
    r_TX_DV <= val;
end process;

r_RX_SERIAL <= uart_rxd;
data_o <= temp_o;

process(w_RX_DV)
begin
    if (rising_edge(w_RX_DV)) then
        temp_o <= w_RX_BYTE;
    end if;
end process;



end Behavioral;
