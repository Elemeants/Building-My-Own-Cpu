library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Test_ALU_4bits is
	port (
		SW:   in STD_LOGIC_VECTOR  (9 downto 0);
		HEX0: out std_logic_vector (6 downto 0);
		HEX1: out std_logic_vector (6 downto 0);
		HEX2: out std_logic_vector (6 downto 0);
		HEX3: out std_logic_vector (6 downto 0);
		HEX4: out std_logic_vector (6 downto 0));
end Test_ALU_4bits;

architecture arch_Test_ALU_4bits of Test_ALU_4bits is
	signal output: std_logic_vector (3 downto 0);
	signal carry: std_logic;
begin
	display_0: entity work.HexTo7segment port map (SW(3 downto 0), HEX0);
	display_1: entity work.HexTo7segment port map (SW(7 downto 4), HEX1);
	display_2: entity work.HexTo7segment port map (output, HEX2);
	display_3: entity work.HexTo7segment port map ("000" & carry, HEX3);
	display_4: entity work.HexTo7segment port map ("00" & SW(9 downto 8), HEX4);

	alu: entity work.ALU_4bits port map (
		SW(7 downto 4),
		SW(3 downto 0),
		SW(9 downto 8),
		'0',
		output,
		carry
		);

end arch_Test_ALU_4bits;