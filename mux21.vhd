----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:11 05/14/2017 
-- Design Name: 
-- Module Name:    mux21 - Behavioral 
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

entity mux21 is
	generic(
		size: integer := 1 -- defaults to 1
	);
    Port ( in0 : in  STD_LOGIC_VECTOR (size-1 downto 0);
           in1 : in  STD_LOGIC_VECTOR (size-1 downto 0);
           out_mux : out  STD_LOGIC_VECTOR (size-1 downto 0);
           sel : in  STD_LOGIC);
end mux21;

architecture Behavioral of mux21 is

begin

with sel select
              out_mux <= A0 when '0',
                         A1 when '1',
                         (others => '0') when others;

end Behavioral;

