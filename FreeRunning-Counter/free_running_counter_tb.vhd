library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity free_running_counter_tb is
--  Port ( );
end free_running_counter_tb;

architecture Behavioral of free_running_counter_tb is

component free_running_counter is
    Port (
        clk, reset: in std_logic;
        max_pulse: out std_logic;
        q: out std_logic_vector(5 downto 0));
end component free_running_counter;

signal clk, reset: std_logic;
signal max_pulse: std_logic;
signal q: std_logic_vector(5 downto 0);

begin

uut: free_running_counter port map (clk => clk,
                                    reset => reset,
                                    max_pulse => max_pulse,
                                    q => q);
process
begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;

end process;

process
begin
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait for 10 ns;
    wait;

end process;

end Behavioral;
