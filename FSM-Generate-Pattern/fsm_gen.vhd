library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_gen is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input : in STD_LOGIC;
           z : out STD_LOGIC);
end fsm_gen;

architecture Behavioral of fsm_gen is
type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
signal current_state, next_state : state_type;

begin

next_state_logic: process(current_state, input)
begin
    case (current_state) is
        when S0 =>
            if (input = '1') then
                next_state <= S1;
            else
                next_state <= S0;
         end if;
         when S1 =>
            next_state <= S2;
         when S2 =>
            next_state <= S3;
         when S3 =>
            next_state <= S4;
         when S4 =>
            next_state <= S5;
         when S5 =>
            next_state <= S6;
         when S6 =>
            next_state <= S7;
         when S7 =>
            next_state <= S8;
         when S8 =>
            next_state <= S0;      
     end case;
end process;

process(clk, reset, next_state)
begin
    if (reset = '1') then
          current_state <= S0;
    elsif(rising_edge(clk)) then
          current_state <= next_state;
    end if;
end process;

with current_state select
    z <= '1' when S1,
         '1' when S3,
         '1' when S5,
         '1' when S7,
         '0' when S0,
         '0' when S2,
         '0' when S4,
         '0' when S6,
         '0' when S8;
         
end Behavioral;
