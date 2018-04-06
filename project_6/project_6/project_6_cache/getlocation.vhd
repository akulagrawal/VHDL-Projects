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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_rx is
    Port (  uart_rxd : in STD_LOGIC;
            uart_txd : out STD_LOGIC;
            clk : in STD_LOGIC;
				data_o : out std_logic_vector(6 downto 0);
				data_i : in std_logic
            );
end test_rx;



architecture Behavioral of test_rx is
constant c_CLKS_PER_BIT : integer := 10416;

type state_types is (
    write_msb,
    write_lsb,
    wait_for_msb,
    wait_for_lsb,
    start_send,
    start_send2,
    send_msb,
    sending_msb,
    send_lsb,
    sending_lsb,
	 hit_l1,
	 wait_for_l1_write,
	 wait_for_l1_lru,
	 hit_l2,
	 wait_for_l2_write,
	 wait_for_l2_lru,
	 incr_addra,
	 send_l1_hc1,
	 wait_l1_hc1,
	 send_l1_hc2,
	 wait_l1_hc2,
    send_l2_hc1,
	 wait_l2_hc1,
    send_l2_hc2,
	 wait_l2_hc2,
    idle,
	 print_hit,
	 wait_hit,
	 print_miss,
	 wait_miss
);

signal state : state_types := write_msb;
signal addra : STD_LOGIC_VECTOR ( 9 downto 0 ) := "0000000000";
signal dina : STD_LOGIC_VECTOR ( 15 downto 0 );
signal douta : STD_LOGIC_VECTOR ( 15 downto 0 );
signal wea : STD_LOGIC;
signal trace_addra : std_logic_vector(9 downto 0);

signal r_RX_SERIAL : std_logic := '1';
signal w_RX_DV : std_logic := '0';
signal w_RX_BYTE : std_logic_vector(7 downto 0) ;
signal write_byte : std_logic_vector(7 downto 0) := "00000000";
signal r_TX_DV : std_logic;
signal r_TX_BYTE : std_logic_vector(7 downto 0);
signal w_tx_active : std_logic;
signal w_TX_SERIAL : std_logic;
signal w_TX_DONE : std_logic;

signal l1_dina : std_logic_vector(127 downto 0);
signal l1_wea : std_logic;
signal l1_lru_update : std_logic;          
signal l1_hit : std_logic;
signal l1_douta : std_logic_vector(127 downto 0);
signal l1_lru_complete : std_logic;
signal l1_hit_cntr : std_logic_vector(9 downto 0) := (others => '0');
signal l1_miss_cntr : std_logic_vector(9 downto 0) := (others => '0');

signal l2_dina : std_logic_vector(127 downto 0);
signal l2_wea : std_logic;
signal l2_lru_update : std_logic;          
signal l2_hit : std_logic;
signal l2_douta : std_logic_vector(127 downto 0);
signal l2_lru_complete : std_logic;
signal l2_hit_cntr : std_logic_vector(9 downto 0) := (others => '0');
signal l2_miss_cntr : std_logic_vector(9 downto 0) := (others => '0');

signal wait_cntr : std_logic_vector(5 downto 0) := (others => '0');

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

component trace_ram_wrapper is
    port (
    addra_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clka_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component;

	COMPONENT l1_top_level
	PORT(
		l1_addra : IN std_logic_vector(15 downto 0);
		l1_dina : IN std_logic_vector(127 downto 0);
		clka : IN std_logic;
		l1_wea : IN std_logic;
		l1_lru_update : IN std_logic;          
		l1_hit : OUT std_logic;
		l1_douta : OUT std_logic_vector(127 downto 0);
		l1_lru_complete : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT l2_top_level
	PORT(
		l2_addra : IN std_logic_vector(15 downto 0);
		l2_dina : IN std_logic_vector(127 downto 0);
		clka : IN std_logic;
		l2_wea : IN std_logic;
		l2_lru_update : IN std_logic;          
		l2_hit : OUT std_logic;
		l2_douta : OUT std_logic_vector(127 downto 0);
		l2_lru_complete : OUT std_logic
		);
	END COMPONENT;
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

uart_txd <= w_TX_SERIAL;
r_RX_SERIAL <= uart_rxd;

trace_ram: component trace_ram_wrapper
port map (
    addra_0(9 downto 0) => addra(9 downto 0),
    clka_0 => clk,
    dina_0(15 downto 0) => dina(15 downto 0),
    douta_0(15 downto 0) => douta(15 downto 0),
    wea_0(0) => wea
);

	Inst_l1_top_level: l1_top_level 
	PORT MAP(
		l1_addra => douta,
		l1_dina => l1_dina,
		clka => clk,
		l1_wea => l1_wea,
		l1_hit => l1_hit,
		l1_douta => l1_douta,
		l1_lru_update => l1_lru_update,
		l1_lru_complete => l1_lru_complete
	);
	
	Inst_l2_top_level: l2_top_level PORT MAP(
		l2_addra => douta,
		l2_dina => l2_dina,
		clka => clk,
		l2_wea => l2_wea,
		l2_hit => l2_hit,
		l2_douta => l2_douta,
		l2_lru_update => l2_lru_update,
		l2_lru_complete => l2_lru_complete
	);
	
	data_o <= l1_hit_cntr(6 downto 0) when data_i = '0' else
					l2_hit_cntr(6 downto 0);
	
	process(clk)
	variable msg : std_logic_vector(7 downto 0);
	variable trace_msb : std_logic_vector(7 downto 0);
	variable trace_lsb : std_logic_vector(7 downto 0);
	variable prev_addra : std_logic_vector(9 downto 0);
	variable temp_l1_hit_cntr : std_logic_vector(9 downto 0);
	variable temp_l1_miss_cntr : std_logic_vector(9 downto 0);
	variable temp_l2_hit_cntr : std_logic_vector(9 downto 0);
	variable temp_l2_miss_cntr : std_logic_vector(9 downto 0);
	begin
	  if rising_edge(clk) then
			msg := w_rx_byte;
			trace_msb := douta(15 downto 8);
			trace_lsb := douta(7 downto 0);
			prev_addra := addra;
			temp_l1_hit_cntr := l1_hit_cntr;
			temp_l1_miss_cntr := l1_miss_cntr;
			temp_l2_hit_cntr := l2_hit_cntr;
			temp_l2_miss_cntr := l2_miss_cntr;
			case state is
				 when write_msb=>
					  if(w_rx_dv = '1') then
							dina <= msg & trace_lsb;
							wea <= '1';
							state <= wait_for_lsb;
					  end if;
				 when wait_for_lsb=>
					  if(w_rx_dv = '0') then
							wea <= '0';
							state <= write_lsb;
					  end if;
				 when write_lsb=>
					  if(w_rx_dv = '1') then
							dina <= trace_msb & msg;
							wea <= '1';
							state <= wait_for_msb;
					  end if;
				 when wait_for_msb=>
					  if(prev_addra = "1111111111") then
							state <= start_send;
							addra <= "0000000000";
							wea <= '0';
					  elsif(w_rx_dv = '0') then
							wea <= '0';
							addra <= prev_addra + 1;
							state <= write_msb;
					  end if;
				 when start_send=>
					  state <= start_send2;
				 when start_send2=>
						if(wait_cntr = "111111") then
							wait_cntr <= "000000";
							state <= hit_l1;
						else 
							wait_cntr <= wait_cntr + 1;
						end if;
--				 when send_msb=>
--					  if(w_tx_active = '0') then
--							r_tx_byte <= trace_msb;
--							r_tx_dv <= '1';
--							state <= sending_msb;
--					  end if;
--				 when sending_msb=>
--					  if(w_tx_active = '1') then
--							r_tx_dv <= '0';
--							state <= send_lsb;
--					  end if;
--				 when send_lsb=>
--					  if(w_tx_active = '0') then
--							r_tx_byte <= trace_lsb;
--							r_tx_dv <= '1';
--							state <= sending_lsb;
--					  end if;
--				 when sending_lsb=>
--					  if(prev_addra = "0011111111") then
--							addra <= "0000000000";
--							r_tx_dv <= '0';
--							state <= send_l1_hc1;
--					  elsif(w_tx_active = '1') then
--							addra <= prev_addra + 1;
--							state <= send_msb;
--							r_tx_dv <= '0';
--					  end if;
--				when print_hit=>
--					 if(w_tx_active = '0') then
--						  r_tx_dv <= '1';
--						  r_tx_byte <= x"01";
--						  state <= wait_hit;
--					 end if;
--				when wait_hit=>
--					 if(w_tx_active = '1') then
--						  r_tx_dv <= '0';
--						  l1_lru_update <= '1';
--						  state <= wait_for_l1_lru;
--					 end if;
--				when print_miss=>
--					 if(w_tx_active = '0') then
--						  r_tx_dv <= '1';
--						  r_tx_byte <= x"00";
--						  state <= wait_miss;
--					 end if;
--				when wait_miss=>
--					 if(w_tx_active = '1') then
--						  r_tx_dv <= '0';
--						  state <= hit_l2;
--					 end if;
				 when hit_l1=>
						if(l1_hit = '1') then
							l1_hit_cntr <= temp_l1_hit_cntr + 1;
							l1_lru_update <= '1';
							state <= wait_for_l1_lru;
						else
							l1_miss_cntr <= temp_l1_miss_cntr + 1;
							state <= hit_l2;
						end if;
				 when wait_for_l1_lru => 
						if(l1_lru_complete = '1') then
							l1_lru_update <= '0';
							state <= incr_addra;
						end if;
				when wait_for_l1_write =>
						if(l1_hit = '1') then
							l1_wea <= '0';
							l1_lru_update <= '1';
							state <= wait_for_l1_lru;
						end if;
				when incr_addra => 
						if(prev_addra = "1111111111") then
							state <= send_l1_hc1;
							addra <= "0000000000";
						else 
							addra <= prev_addra + 1;
							state <= start_send;
						end if;
				when hit_l2=>
						if(l2_hit = '1') then
							l2_hit_cntr <= temp_l2_hit_cntr + 1;
							l2_lru_update <= '1';
							state <= wait_for_l2_lru;
						else
							l2_miss_cntr <= temp_l2_miss_cntr + 1;
							l2_wea <= '1';
							state <= wait_for_l2_write;
						end if;
			   when wait_for_l2_lru =>
						if(l2_lru_complete = '1') then
							l2_lru_update <= '0';
							l1_wea <= '1';
							state <= wait_for_l1_write;
						end if;
				when wait_for_l2_write =>
						if(l2_hit = '1') then
							l2_wea <= '0';
							l2_lru_update <= '1';
							state <= wait_for_l2_lru;
						end if;
				when send_l1_hc1 =>
						if(w_tx_active = '0') then
							r_tx_byte <= "000000" & l1_hit_cntr(9 downto 8);
							r_tx_dv <= '1';
							state <= wait_l1_hc1;
						end if;
				when wait_l1_hc1 =>
						if(w_tx_active = '1') then
							r_tx_dv <= '0';
							state <= send_l1_hc2;
						end if;
				when send_l1_hc2 =>
						if(w_tx_active = '0') then
							r_tx_byte <= l1_hit_cntr(7 downto 0);
							r_tx_dv <= '1';
							state <= wait_l1_hc2;
						end if;
				when wait_l1_hc2 =>
						if(w_tx_active = '1') then
							r_tx_dv <= '0';
							state <= send_l2_hc1;
						end if;
				when send_l2_hc1 =>
						if(w_tx_active = '0') then
							r_tx_byte <= "000000" & l2_hit_cntr(9 downto 8);
							r_tx_dv <= '1';
							state <= wait_l2_hc1;
						end if;
				when wait_l2_hc1 =>
						if(w_tx_active = '1') then
							r_tx_dv <= '0';
							state <= send_l2_hc2;
						end if;
				when send_l2_hc2 =>
						if(w_tx_active = '0') then
							r_tx_byte <= l2_hit_cntr(7 downto 0);
							r_tx_dv <= '1';
							state <= wait_l2_hc2;
						end if;
				when wait_l2_hc2 =>
						if(w_tx_active = '1') then
							r_tx_dv <= '0';
							state <= idle;
						end if;
				 when others=>
					  state <= idle;
			end case;
	  end if;
	end process;

end Behavioral;
