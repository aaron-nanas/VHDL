library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_3x8_en_tb is
--  Port ( );
end decoder_3x8_en_tb;

architecture Behavioral of decoder_3x8_en_tb is
    component decoder_3x8_en is
      generic(NUM_BITS : integer := 3);
      Port (d_in: in std_logic_vector(NUM_BITS-1 downto 0);
        ena: in std_logic;
        d_out: out std_logic_vector(2**NUM_BITS-1 downto 0));
end component;

constant NUM_BITS: integer := 3;

-- Inputs
signal ena_sig : std_logic := '1';
signal d_in_sig : std_logic_vector(NUM_BITS-1 downto 0) := (others => '0');

-- Outputs
signal d_out_sig : std_logic_vector(2**NUM_BITS-1 downto 0);

begin
    uut: decoder_3x8_en generic map (NUM_BITS => 3)
    port map (
        d_in => d_in_sig,
        ena => ena_sig,
        d_out => d_out_sig);

    process
        begin

        d_in_sig <= "000";
        wait for 10 ns;
        
        d_in_sig <= "001";
        wait for 10 ns;

        d_in_sig <= "010";
        wait for 10 ns;

        d_in_sig <= "011";
        wait for 10 ns;
        
        d_in_sig <= "100";
        wait for 10 ns;
        
        d_in_sig <= "101";
        wait for 10 ns;
        
        d_in_sig <= "110";
        wait for 10 ns;
        
        d_in_sig <= "111";
        wait for 10 ns;

    end process;

end Behavioral;
