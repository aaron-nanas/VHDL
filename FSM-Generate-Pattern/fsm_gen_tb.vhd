-- FSM that generates a “10101010” pattern

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_gen_tb is
--  Port ( );
end fsm_gen_tb;

architecture Behavioral of fsm_gen_tb is

component fsm_gen is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input : in STD_LOGIC;
           z : out STD_LOGIC);
end component fsm_gen;

signal clk, reset, input: std_logic;
signal z: std_logic;
constant clk_per: time := 10ns;

begin

uut: fsm_gen port map (clk => clk,
                       reset => reset,
                       input => input,
                       z => z);
                       
process
    begin
        clk <= '0';
        wait for clk_per/2;
        clk <= '1';
        wait for clk_per/2;
end process;

process
    begin
        reset <= '1';
        wait for clk_per/2;
        reset <= '0';
        wait for clk_per/2;
        wait;
end process;

process
    begin
        input <= '0';
        wait for 50 ns;
        input <= '1';
        wait for 50 ns;
end process;
end Behavioral;
