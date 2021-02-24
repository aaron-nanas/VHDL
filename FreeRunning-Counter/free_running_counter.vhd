library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity free_running_counter is
    Port (
        clk, reset: in std_logic;
        max_pulse: out std_logic;
        q: out std_logic_vector(5 downto 0));
end free_running_counter;

architecture Behavioral of free_running_counter is
    signal r_reg: unsigned(5 downto 0);
    signal r_next: unsigned (5 downto 0);
begin
    -- Register
    process (clk, reset)
    begin
        if (reset = '1') then
            r_reg <= (others => '0'); 
        elsif (rising_edge(clk)) then
            r_reg <= r_next;
        end if;
    end process;
-- Next state logic    
r_next <= r_reg + 1;

-- Output logic
q <= std_logic_vector(r_reg);
max_pulse <= '1' when r_reg = "11001" else '0';

end Behavioral;
