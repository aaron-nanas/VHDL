library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ring_osc_tb is
--  Port ( );
end ring_osc_tb;

architecture Behavioral of ring_osc_tb is
component ring_osc is
    Port ( ena: in std_logic;
           delay: in time;
           osc_out: out std_logic);
end component ring_osc;

-- Input
signal ena_sig : std_logic := '0';
signal delay_sig: time := 0.5 ns;

-- Output
signal osc_out_sig: std_logic;

begin
uut: ring_osc port map (ena => ena_sig,
                        delay => delay_sig,
                        osc_out => osc_out_sig);
              
    process
        begin
        ena_sig <= '0';
        delay_sig <= 0.5 ns;
        wait for 10 * 0.5 ns;
        
        ena_sig <= '1';
        wait for 10 ns;
        wait;
        
        end process;
end Behavioral;
