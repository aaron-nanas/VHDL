library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hw6_equalize_lengths_tb is
--  Port ( );
end hw6_equalize_lengths_tb;

architecture Behavioral of hw6_equalize_lengths_tb is

component hw6_equalize_lengths is
    generic (
           BITS1: natural := 8;
           BITS2: natural := 6;
           BITS3: natural := 8);
    Port ( a1: in signed(BITS1-1 downto 0);
           a2: in signed(BITS2-1 downto 0);
           b1: out signed(BITS3-1 downto 0);
           b2: out signed(BITS3-1 downto 0));
end component hw6_equalize_lengths;

constant BITS1_width, BITS3_width: natural := 8;
constant BITS2_width: natural := 6;

signal a1: signed(BITS1_width-1 downto 0);
signal a2: signed(BITS2_width-1 downto 0);
signal b1, b2: signed(BITS3_width-1 downto 0);

begin

G1: hw6_equalize_lengths 
        generic map (BITS1 => BITS1_width,
                 BITS2 => BITS2_width,
                 BITS3 => BITS3_width)
         port map (a1 => a1,
                   a2 => a2,
                   b1 => b1,
                   b2 => b2);

process
begin
    a1 <= "10001000";
    a2 <= "011100";
    wait for 10 ns;
    
    a1 <= "11110000";
    a2 <= "010101";
    wait for 10 ns;
    
    a1 <= "00010101";
    a2 <= "111000";
    wait for 10 ns;
 
end process;

end Behavioral;
