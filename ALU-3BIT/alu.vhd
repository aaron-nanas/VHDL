library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (  clk: in std_logic;
            reset: in std_logic;
            opcode: in std_logic_vector(2 downto 0);
            x: in std_logic_vector(7 downto 0);
            y: in std_logic_vector(7 downto 0);
            z: out std_logic_vector(7 downto 0));
end alu;

architecture Behavioral of alu is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                z <= "00000000";
            else
                case opcode is
                    when "000" =>
                        z <= not(x);
                    when "001" =>
                        z <= not(x xor y);
                    when "010" =>
                        z <= not(x or y);
                    when "011" =>
                        z <= not(x and y);
                    when "100" =>
                        z <= x;
                    when "101" =>
                        z <= (x xor y);
                    when "110" =>
                        z <= (x or y);
                    when "111" =>
                        z <= (x and y);
                    when others =>
                        z <= (others => '0');
                 end case;
                end if;
        end if;
    end process;
end Behavioral;
