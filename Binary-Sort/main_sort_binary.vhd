library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.sort_binary_pkg.ALL;

entity main_sort_binary is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : out STD_LOGIC_VECTOR (7 downto 0));
end main_sort_binary;

architecture Behavioral of main_sort_binary is

begin

b <= sort_binary(a);

end Behavioral;
