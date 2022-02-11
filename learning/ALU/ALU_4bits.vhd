library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_4bits is
	port (
		reg_a: in std_logic_vector (3 downto 0);
		reg_b: in std_logic_vector (3 downto 0);
		operator: in std_logic_vector (1 downto 0);
		logic_flag: in std_logic;
		
		output: out std_logic_vector (3 downto 0);
		carry: out std_logic
		);
end ALU_4bits;


architecture arch_ALU_4bits of ALU_4bits is
	constant LOGIC_OPERATOR: std_logic := '1';
	constant ARITM_OPERATOR: std_logic := '0';

	signal internal_out: std_logic_vector (4 downto 0);
begin

with logic_flag & operator select
internal_out <=
	"0" & (reg_a and reg_b) when "100",
	"0" & (reg_a or reg_b)  when "101",
	"0" & (not reg_a)       when "110",
	"0" & (reg_a xor reg_b) when "111",
	std_logic_vector(unsigned('0' & reg_a) + unsigned('0' & reg_b)) when "001",
	std_logic_vector(unsigned('0' & reg_a) - unsigned('0' & reg_b)) when "010",
	"00000"                 when others;
	
output <= internal_out(3 downto 0);
carry <= internal_out(4);

end arch_ALU_4bits;
