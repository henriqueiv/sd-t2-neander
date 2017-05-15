----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:08 05/14/2017 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity dff is
	generic(
		size: integer := 1 -- defaults to 1 bit
	);
    Port ( d : in  STD_LOGIC_VECTOR (size-1 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  q : out  STD_LOGIC_VECTOR (size-1 downto 0));
end dff;

architecture Behavioral of dff is
signal aux_q: STD_LOGIC_VECTOR (size-1 down to 0);
begin

	bla: process(clk, rst) begin
		if rst = '1' then
			aux_q <= (others => '0');
		elsif rising_edge(clk) then
			aux_q <= d;
		end if;
	end process;

	q <= aux_q;

end Behavioral;

