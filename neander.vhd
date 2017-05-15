----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:20 05/14/2017 
-- Design Name: 
-- Module Name:    neander - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity neander is
	Port (
		cargaAC, cargaPC: STD_LOGIC_VECTOR (7 downto 0);
		selUAL: STD_LOGIC_VECTOR (3 downto 0);
		incrementaPC, cargaREM, cargaRDM, sel, read, write: STD_LOGIC);
end neander;

architecture Behavioral of neander is
	signal out_pc, out_rdm, out_mux, out_rem, out_alu, out_ac: STD_LOGIC_VECTOR (7 downto 0);
	signal out_alu_n, out_alu_z: STD_LOGIC;
	signal out_nz: STD_LOGIC_VECTOR (2 downto 0);
begin

pc: entity work.counter generic map (8) port map (cargaRDM, clk, rst, out_pc); 
mux: entity work.mux port map(out_pc, out_rdm, out_mux);
-- ajusta dff para carga rem/rdm ser tipo um enable
remff: entity work.dff generic map (8) port map (out_mux, clk, rst, out_rem);

-- rdmff: entity work.dff generic (8) port map (

alu: entity work.alu port map (x, y, selUAL, out_alu_n, out_alu_z, out_alu);
nz: entity work.dff generic map (2) port map (out_alu_n&out_alu_z, clk, rst, out_nz);
ac: entity work.dff generic map (8) port map (out_alu, clk, rst, out_ac);


end Behavioral;

