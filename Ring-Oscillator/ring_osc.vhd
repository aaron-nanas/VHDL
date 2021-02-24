-- VHDL Code for Ring Oscillator 
-- Diagram provided from homework set

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ring_osc is
    Port ( ena: in std_logic;
           delay : in time;
           osc_out: out std_logic);
end ring_osc;

architecture Behavioral of ring_osc is

    signal gate_out: std_logic_vector(5 downto 0) := (others => '0');

begin
    gate_out(0) <= ena and gate_out(5) after delay;
    
    inv_g: for i in 1 to 5 generate
        gate_out(i) <= not gate_out(i - 1) after delay;
        end generate;
        
        osc_out <= gate_out(5);

end Behavioral;
