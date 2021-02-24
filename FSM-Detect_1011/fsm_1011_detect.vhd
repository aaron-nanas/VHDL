library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_1011_detect is
    Port ( a : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset_n : in STD_LOGIC;
           z : out STD_LOGIC);
end fsm_1011_detect;

architecture Behavioral of fsm_1011_detect is

type state_type is (S0, S1, S2, S3);
signal current_state, next_state : state_type;

begin

-- Next state logic
process(a, current_state)
begin
    case (current_state) is
        when S0 =>
            if (a = '0') then
                next_state <= S0;
            elsif (a = '1') then
                next_state <= S1;
            end if;
        when S1 =>
            if (a = '1') then
                next_state <= S1;
            elsif (a = '0') then
                next_state <= S2;
            end if;
        when S2 =>
            if (a = '1') then
                next_state <= S3;
            elsif (a = '0') then
                next_state <= S0;
            end if;
        when S3 =>
            if (a = '1') then
                next_state <= S1;
            elsif (a = '0') then
                next_state <= S2;
            end if;
     end case;
end process;

-- Asynchronous active low reset
async_reset: process(clk, reset_n, next_state)
begin
    if(reset_n = '0') then
        current_state <= S0;
    elsif(rising_edge(clk)) then
        current_state <= next_state;
    end if;
end process async_reset;

with current_state select
    z <= '0' when S0,
         '0' when S1,
         '0' when S2,
         '1' when S3;

end Behavioral;
