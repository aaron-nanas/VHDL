-- Equalize lengths of two vectors with given widths

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hw6_equalize_lengths is
    generic (
           BITS1: natural := 8;
           BITS2: natural := 6;
           BITS3: natural := 8);
    Port ( a1: in signed(BITS1-1 downto 0);
           a2: in signed(BITS2-1 downto 0);
           b1: out signed(BITS3-1 downto 0);
           b2: out signed(BITS3-1 downto 0));
end hw6_equalize_lengths;

architecture Behavioral of hw6_equalize_lengths is

    procedure equalize_lengths(in1, in2: in signed; signal out1, out2: out signed) is
    
    begin
        if (in1'length > in2'length) then
            out1 <= in1;
            out2 <= resize(in2, in1'length);
        else
            out1 <= resize(in1, in2'length);
            out2 <= in2;
        end if;
    end procedure equalize_lengths;

    begin
        equalize_lengths(a1, a2, b1, b2);

end Behavioral;
