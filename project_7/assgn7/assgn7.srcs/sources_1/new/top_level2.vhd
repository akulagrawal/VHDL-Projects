----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2018 13:22:18
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
  Port (    clk : in STD_LOGIC;
            uart_rxd : in STD_LOGIC;
            data_o : out STD_LOGIC_vector(9 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0)
--            data_o2 : out STD_LOGIC_VECTOR(3 downto 0);
--            data_o3 : out STD_LOGIC_VECTOR(7 downto 0)
        );
end top_level;

architecture Behavioral of top_level is

--Communcation Part Begins
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
    

--Communication Part ends
    
    type ram_t is array (0 to 255) of std_logic_vector(127 downto 0);
    type cntr_t is array (0 to 255) of std_logic_vector(9 downto 0);
    type state_types is (
        config_res_words,
        wait_config,
        next_char,
        next_char_wait,
        allot_values,
        wait_incr,
        incr_cntr,
        wait_incr_2,
        incr_out,
        idle
    );
    signal state : state_types := config_res_words;
    signal res_words, comp_res_words : ram_t := (others => (others => '0'));
    signal test_word : std_logic_vector(127 downto 0) := (others => '0');
    signal wrd_ind : integer range 0 to 255 := 0;
    signal wrd_pos : integer range 0 to 15 := 15;
    signal equal : std_logic_vector(127 downto 0);
    signal cntr, cntr_in, cntr_out : cntr_t := (others => (others => '0'));
    signal cntr_ind : integer range 0 to 255 := 0;
    signal ind : std_logic_vector(2 downto 0) := "000";
    signal add_timer : std_logic_vector(2 downto 0) := "000";
 
    component word_comp is
    Port (
            test_word : in std_logic_vector(127 downto 0);
            res_word : in std_logic_vector(127 downto 0);
            equal : out std_logic
        );
    end component;
    
    component dsp_adder_wrapper is
      port (
        A_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
        B_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
        CE_0 : in STD_LOGIC;
        CLK_0 : in STD_LOGIC;
        S_0 : out STD_LOGIC_VECTOR ( 9 downto 0 )
      );
    end component;
begin
    
    data_o <= cntr(to_integer(unsigned(data_in)));
    process(clk, w_RX_BYTE, wrd_pos, wrd_ind)
        variable msg : std_logic_vector(7 downto 0);
        variable temp_char : std_logic_vector(7 downto 0);
        variable temp_wrd_ind : integer range 0 to 255;
        variable temp_wrd_pos : integer range 0 to 15;
        variable temp_test_word : std_logic_vector(127 downto 0);
    begin
        msg := w_RX_BYTE;
        temp_wrd_ind := wrd_ind;
        temp_wrd_pos := wrd_pos;
        temp_test_word := test_word;
        if rising_edge(clk) then
            case state is
                when config_res_words =>
                    if (w_RX_DV = '1') then
                        if(wrd_pos = 0) then
                            res_words(wrd_ind)(7 downto 0) <= msg;
                        elsif (wrd_pos = 1) then
                            res_words(wrd_ind)(15 downto 8) <= msg;
                        elsif (wrd_pos = 2) then
                            res_words(wrd_ind)(23 downto 16) <= msg;
                        elsif (wrd_pos = 3) then
                            res_words(wrd_ind)(31 downto 24) <= msg;
                        elsif (wrd_pos = 4) then
                            res_words(wrd_ind)(39 downto 32) <= msg;
                        elsif (wrd_pos = 5) then
                            res_words(wrd_ind)(47 downto 40) <= msg;
                        elsif (wrd_pos = 6) then
                            res_words(wrd_ind)(55 downto 48) <= msg;
                        elsif (wrd_pos = 7) then
                            res_words(wrd_ind)(63 downto 56) <= msg;
                        elsif (wrd_pos = 8) then
                            res_words(wrd_ind)(71 downto 64) <= msg;    
                        elsif (wrd_pos = 9) then
                            res_words(wrd_ind)(79 downto 72) <= msg;
                        elsif (wrd_pos = 10) then
                            res_words(wrd_ind)(87 downto 80) <= msg;
                        elsif (wrd_pos = 11) then
                            res_words(wrd_ind)(95 downto 88) <= msg;
                        elsif (wrd_pos = 12) then
                            res_words(wrd_ind)(103 downto 96) <= msg;
                        elsif (wrd_pos = 13) then
                            res_words(wrd_ind)(111 downto 104) <= msg;
                        elsif (wrd_pos = 14) then
                            res_words(wrd_ind)(119 downto 112) <= msg;
                        elsif (wrd_pos = 15) then
                            res_words(wrd_ind)(127 downto 120) <= msg;
                        end if;
                        state <= wait_config;
                    end if;
                when wait_config=>
                    if(w_RX_DV = '0') then
                        if(wrd_ind = 255 and wrd_pos = 0) then
                            state <= next_char;
                            wrd_ind <= 0;
                            wrd_pos <= 15;
                        else
                            if(wrd_pos = 0) then
                                wrd_pos <= 15;
                                wrd_ind <= temp_wrd_ind + 1;
                                state <= config_res_words;
                            else
                                wrd_pos <= temp_wrd_pos - 1;
                                state <= config_res_words;
                            end if;
                        end if;
                    end if;
                when next_char=>
                    if(w_RX_DV = '1') then
                        test_word <= temp_test_word(119 downto 0) & msg;
                        state <= next_char_wait;
                    end if;
                when next_char_wait=>
                    if(w_RX_DV = '0') then
                        state <= allot_values;
                    end if;
                when allot_values=>
                    if (ind = "000") then
                        comp_res_words(0 to 31) <= res_words(0 to 31);
                        state <= wait_incr; 
                    elsif(ind = "001") then
                        comp_res_words(0 to 31) <= res_words(32 to 63);
                        state <= wait_incr;
                    elsif(ind = "010") then
                        comp_res_words(0 to 31) <= res_words(64 to 95);
                        state <= wait_incr;
                    elsif(ind = "011") then
                        comp_res_words(0 to 31) <= res_words(96 to 127);
                        state <= wait_incr; 
                    elsif(ind = "100") then
                        comp_res_words(0 to 31) <= res_words(128 to 159);
                        state <= wait_incr;
                    elsif(ind = "101") then
                        comp_res_words(0 to 31) <= res_words(160 to 191);
                        state <= wait_incr;
                    elsif(ind = "110") then
                        comp_res_words(0 to 31) <= res_words(192 to 223);
                        state <= wait_incr;
                    elsif(ind = "111") then
                        comp_res_words(0 to 31) <= res_words(224 to 255);
                        state <= wait_incr;                    
                    end if;
                when wait_incr=>
                    state <= incr_cntr;
                when incr_cntr=>
                    for i in 0 to 31
--                when incr_cntr=>
--                    if(ind = "00") then 
--                        cntr_in(0 to 63) <= cntr(0 to 63);
--                        state <= wait_incr_2;
--                    elsif(ind = "01")then
--                        cntr_in(0 to 63) <= cntr(64 to 127);
--                        state <= wait_incr_2;
--                    elsif(ind = "10") then
--                        cntr_in(0 to 63) <= cntr(128 to 191);
--                        state <= wait_incr_2;
--                    else
--                        cntr_in(0 to 63) <= cntr(192 to 255);
--                        state <= wait_incr_2;
--                    end if;
--                when wait_incr_2=>
--                    state <= incr_out;
--                when incr_out=>
--                    if(ind = "00") then 
--                        cntr(0 to 63) <= cntr_out(0 to 63);
--                        state <= allot_values;
--                        ind <= "01";
--                    elsif(ind = "01")then
--                        cntr(64 to 127) <= cntr_out(0 to 63);
--                        state <= allot_values;
--                        ind <= "10";
--                    elsif(ind = "10") then
--                        cntr(128 to 191) <= cntr_out(0 to 63);
--                        state <= allot_values;
--                        ind <= "11";
--                    else
--                        cntr(192 to 255) <= cntr_out(0 to 63);
--                        state <= next_char;
--                        ind <= "00";
--                    end if;
                when others=>
                    state <= idle;
            end case;
        end if;
    end process;
    
    gen_comp: for i in 0 to 31 generate
        word_component : word_comp
            port map (
            test_word => test_word,
            res_word => comp_res_words(i),
            equal => equal(i)
        );
    end generate gen_comp;
    
--    gen_adder: for i in 0 to 63 generate
--        adder_component : dsp_adder_wrapper
--            port map (
--            A_0 => cntr_in(i),
--            B_0(1) => '0',
--            B_0(0) => equal(i),
--            CE_0 => '1',
--            CLK_0 => clk,
--            S_0 => cntr_out(i)
--        );
--    end generate gen_adder;
--Communication Part Begins
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
    
 
    r_RX_SERIAL <= uart_rxd;
--Communication Part Ends
   
end Behavioral;
