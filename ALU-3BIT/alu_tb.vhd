library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity alu_tb is
--  Port ( );
end alu_tb;

architecture Behavioral of alu_tb is

component alu is
    Port (  clk: in std_logic;
            reset: in std_logic;
            opcode: in std_logic_vector(2 downto 0);
            x: in std_logic_vector(7 downto 0);
            y: in std_logic_vector(7 downto 0);
            z: out std_logic_vector(7 downto 0));
end component alu;

signal clk, reset: std_logic;
signal opcode: std_logic_vector(2 downto 0);
signal x, y, z: std_logic_vector(7 downto 0);
constant clk_per: time := 10 ns;

begin

uut: alu port map (clk => clk,
                   reset => reset,
                   opcode => opcode,
                   x => x,
                   y => y,
                   z => z);
                   
process
begin
    clk <= '0';
    wait for clk_per;
    clk <= '1';
    wait for clk_per;
end process;

process
begin
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    wait for 10 ns;
    wait;
end process;

process
begin
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "000";
    wait for 4*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "001";
    wait for 2*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "010";
    wait for 2*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "011";
    wait for 2*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "100";
    wait for 2*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "101";
    wait for 2*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "110";
    wait for 2*clk_per;
    
    x <= "10110011";
    y <= "11001001";
    opcode <= "111";
    wait for 2*clk_per;
    
end process;

end Behavioral;
