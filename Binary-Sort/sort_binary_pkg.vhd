library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

package sort_binary_pkg is
    function sort_binary (input : std_logic_vector(7 downto 0)) return std_logic_vector;
end package sort_binary_pkg;

package body sort_binary_pkg is
        function sort_binary (input : std_logic_vector(7 downto 0)) return std_logic_vector is
        variable count : integer := 0;
        variable result : std_logic_vector(7 downto 0) := "00000000";
        variable numOfZeros : integer := 0;
        
        begin
                for i in 0 to 7 loop
                    if(input(i) = '1') then
                        count := count + 1;
                    end if;
                end loop;
                
                numOfZeros := 7 - count;
                for i in 7 downto 0 loop
                    if i > numofZeros then
                        result(i) := '1';
                    else
                        result(i) := '0';
                    end if;
               end loop;
               return result;
               
        end function sort_binary;
end package body;
            
