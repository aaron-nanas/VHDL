-- FSM that removes one 1 from every string of 1s on the input

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity remove_1_fsm is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           x : in STD_LOGIC;
           z : out STD_LOGIC);
end remove_1_fsm;

architecture Behavioral of remove_1_fsm is

type state_type is (S0, S1);
signal current_state, next_state : state_type;

begin

-- Next state logic
process(x, current_state)
begin
    case(current_state) is
        when S0 =>
            if(x = '1') then
                next_state <= S1;
                z <= '0';
            else
                next_state <= S0;
                z <= '0';
            end if;
        when S1 =>
            if(x = '1') then
                next_state <= S1;
                z <= '1';
            else
                next_state <= S0;
                z <= '0';
            end if;
      end case;
end process;

-- Current state logic
process(clk, reset, next_state)
begin
    if(reset = '1') then
        current_state <= S0;
    elsif(rising_edge(clk)) then
        current_state <= next_state;
    end if;
end process;


end Behavioral;
