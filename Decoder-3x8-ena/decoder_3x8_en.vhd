library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_3x8_en is
   generic(NUM_BITS : integer :=3);
   port (
        ena: in std_logic;
        d_in: in std_logic_vector(NUM_BITS-1 downto 0);
        d_out: out std_logic_vector(2**NUM_BITS-1 downto 0));
end decoder_3x8_en;

architecture Behavioral of decoder_3x8_en is

begin
   d_out <= (others => '0') when ena='0' else
            "00000001" when ena='1' and d_in="000" else
            "00000010" when ena='1' and d_in="001" else
            "00000100" when ena='1' and d_in="010" else
            "00001000" when ena='1' and d_in="011" else
            "00010000" when ena='1' and d_in="100" else
            "00100000" when ena='1' and d_in="101" else
            "01000000" when ena='1' and d_in="110" else
            "10000000" when ena='1' and d_in="111";
            
end Behavioral;
