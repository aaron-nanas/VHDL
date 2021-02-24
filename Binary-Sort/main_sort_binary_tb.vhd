library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main_sort_binary_tb is
--  Port ( );
end main_sort_binary_tb;

architecture Behavioral of main_sort_binary_tb is

component main_sort_binary is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : out STD_LOGIC_VECTOR (7 downto 0));
end component main_sort_binary;

signal a, b: std_logic_vector(7 downto 0);

begin

uut: main_sort_binary port map (a => a, b => b);

process
begin
    a <= "00101011";
    wait for 50 ns;
    
    a <= "00110111";
    wait for 50 ns;
    
    a <= "00001111";
    wait for 50 ns;
    
    a <= "01010111";
    wait for 50 ns;
    
    a <= "00000001";
    wait for 50 ns;
    
    a <= "10000001";
    wait for 50 ns;
    
    a <= "00000000";
    wait for 50 ns;
    
    a <= "01111111";
    wait for 50 ns;
end process;

end Behavioral;
