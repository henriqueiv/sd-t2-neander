----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:42 05/14/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
	-- generic (address size, opcode size) talvez?
    Port ( x, y : in  STD_LOGIC_VECTOR (7 downto 0);
           selUAL : in  STD_LOGIC_VECTOR (3 downto 0);
           n,z : out  STD_LOGIC;
           ual_out : out  STD_LOGIC_VECTOR (7 downto 0));
end alu;

architecture Behavioral of alu is
signal out_aux: STD_LOGIC_VECTOR (7 down to 0);
begin

	case selUAL is
		when "000" => -- X + Y 
			out_aux <= x + y;
			
		when "001" => -- X AND Y
			out_aux <= x and y;
		
		when "010" => -- X OR Y
			out_aux <= x OR y;
		
		when "011" => -- NOT X
			out_aux <= !x;
		
		when "100" => -- Y
			out_aux <= y;
		
--		when "0101" => segment <= "0100100";  -- '5'
--		when "0110" => segment <= "0100000";  -- '6'
--		when "0111" => segment <= "0001111";  -- '7'
		when others => segment <= "1111111";  -- outras instrucoes
	end case;
	
	if (out_aux = "00000000") then
		z <= '0';
	else
		z <= '1';
	end if;
	
	if out_aux >= "10000000" then
		n <= '1';
	else
		n <= '0';
	end if;
	
	ual_out <= out_aux;

end Behavioral;

