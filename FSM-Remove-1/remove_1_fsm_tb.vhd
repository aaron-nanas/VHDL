library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity remove_1_fsm_tb is
--  Port ( );
end remove_1_fsm_tb;

architecture Behavioral of remove_1_fsm_tb is

component remove_1_fsm is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           x : in STD_LOGIC;
           z : out STD_LOGIC);
end component remove_1_fsm;

signal clk, reset, x: std_logic;
signal z: std_logic;
constant clk_per: time := 10 ns;

begin

uut: remove_1_fsm port map(clk => clk,
                           reset => reset,
                           x => x,
                           z => z);

process
    begin
        clk <= '1';
        wait for clk_per/2;
        clk <= '0';
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
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        
        x <= '1';
        wait for clk_per;
        x <= '1';
        wait for clk_per;
        x <= '1';
        wait for clk_per;
        x <= '1';
        wait for clk_per;
        x <= '1';
        wait for clk_per;
        
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        
        x <= '1';
        wait for clk_per;
        x <= '1';
        wait for clk_per;
        x <= '1';
        wait for clk_per;
        
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        
        x <= '1';
        wait for clk_per;
        
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        x <= '0';
        wait for clk_per;
        
end process;

end Behavioral;
