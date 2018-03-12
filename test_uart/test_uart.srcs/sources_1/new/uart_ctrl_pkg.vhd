-----------------------------------------------------------------------------
---- UART Control Package
---- Author       : Josh Chong
---- Date         : November 12, 1999
---- File Name    : uart_ctrl_pkg.vhd
---- Description  : Package of all components used by uart_ctrl.vhd
-----------------------------------------------------------------------------

--library ieee;
--use ieee.std_logic_1164.all;

--package uart_ctrl_pkg is
--   component txmit is
--   PORT (
--      mclkx16: IN std_logic;
--      write  : IN std_logic;
--      reset  : IN std_logic;
--      data   : IN std_logic_vector(7 downto 0);
--      tx     : OUT std_logic;
--      txrdy  : OUT std_logic);
--   end component;

--   component rxcver is 
--   PORT (
--      mclkx16   : IN std_logic;
--      read      : IN std_logic;
--      rx        : IN std_logic;
--      reset     : IN std_logic;
--      rxrdy     : OUT std_logic;
--      parityerr : OUT std_logic;
--      framingerr: OUT std_logic;
--      overrun   : OUT std_logic;
--      data      : OUT std_logic_vector(7 downto 0));
--   end component;

---- An 16x8-bit FIFO from Altera's MegaWizard Plug-In Manager
--   component fifo is
--   port (
--      data  : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--      wrreq : IN STD_LOGIC;
--      rdreq : IN STD_LOGIC;
--      clock : IN STD_LOGIC;
--      sclr  : IN STD_LOGIC;
--	  q     : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
--      full  : OUT STD_LOGIC;
--      empty : OUT STD_LOGIC;
--      usedw : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) );
--   end component;

--end package;
