library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter_with_max_tb is
--  Port ( );
end counter_with_max_tb;

architecture Behavioral of counter_with_max_tb is

component counter_with_max is
    generic ( 
        MAX: natural := 6;
        BITS: natural := 3);
    Port (
        clk: in std_logic;
        count: out std_logic_vector(BITS-1 downto 0);
        is_max: out std_logic);
end component counter_with_max;

constant MAX: natural := 6;
constant BITS: natural := 3;
signal clk: std_logic := '1';
signal count: std_logic_vector(BITS-1 downto 0);
signal is_max: std_logic;

begin

uut: counter_with_max
        generic map (MAX => 6,
                    BITS => 3)
        port map    (clk => clk,
                    count => count,
                    is_max => is_max);
process
begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
end process;

end Behavioral;
