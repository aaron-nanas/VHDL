library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_1011_detect_tb is
--  Port ( );
end fsm_1011_detect_tb;

architecture Behavioral of fsm_1011_detect_tb is

component fsm_1011_detect is
    Port ( a : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset_n : in STD_LOGIC;
           z : out STD_LOGIC);
end component fsm_1011_detect;

signal a, clk: std_logic;
signal reset_n: std_logic := '1';
signal z: std_logic;

constant clk_per: time := 10 ns;

begin

uut: fsm_1011_detect port map (clk => clk,
                               reset_n => reset_n,
                               a => a,
                               z => z);
-- Test vectors
process
begin
    clk <= '0';
    wait for clk_per/2;
    clk <= '1';
    wait for clk_per/2;
end process;

process
begin
    a <= '1';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '0';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '0';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '0';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    a <= '0';
    wait for clk_per;
    a <= '0';
    wait for clk_per;
    a <= '1';
    wait for clk_per;
    
end process;
    
end Behavioral;
