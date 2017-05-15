----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:37:15 05/14/2017 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	generic(
		size: integer := 1 -- defaults to 1;
	);
    Port ( load : in  STD_LOGIC_VECTOR (size-1 downto 0);
			  clk, rst : in  STD_LOGIC;
           out_counter : out  STD_LOGIC_VECTOR (size-1 downto 0));
end counter;

architecture Behavioral of counter is
signal aux_out_counter : std_logic_vector(size-1 downto 0);
begin

	up_counter : process(clk, rst)
	begin
		if rst = '0' then
			aux_out_counter <= (others => '0');
		elsif rising_edge(clk) then
			aux_out_counter <= aux_out_counter + 1;
		end if;
	end process;

	out_counter <= aux_out_counter;

end Behavioral;

