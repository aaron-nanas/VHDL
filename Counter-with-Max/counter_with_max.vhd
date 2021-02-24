library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_with_max is
    generic ( 
        MAX: natural := 6;
        BITS: natural := 3);
    Port (
        clk: in std_logic;
        count: out std_logic_vector(BITS-1 downto 0);
        is_max: out std_logic);
end counter_with_max;

architecture Behavioral of counter_with_max is
    signal i: natural range 0 to MAX;
begin

PROC: process (clk)
    begin
        if rising_edge(clk) then
            if i = MAX-1 then
                is_max <= '1';
                i <= i + 1;
            elsif i = MAX then
                is_max <= '0';
                i <= 0;
            else
                i <= i + 1;
            end if;
        end if;
    end process;
    count <= std_logic_vector(to_unsigned(i, BITS));

end Behavioral;
