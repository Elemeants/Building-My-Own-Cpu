entity HexTo7segment is
	port (
		hex_input: in bit_vector(3 downto 0);
		display_out: out bit_vector(6 downto 0)
		);
end HexTo7segment;

architecture HexTo7segment_arch of HexTo7segment is

begin

display_out <= "0111111" when hex_input = "0000" else
					"0000110" when hex_input = "0001" else
					"1011011" when hex_input = "0010" else
					"1001111" when hex_input = "0011" else
					"1100110" when hex_input = "0100" else
					"1101101" when hex_input = "0101" else
					"1111101" when hex_input = "0110" else
					"0000111" when hex_input = "0111" else
					"1111111" when hex_input = "1000" else
					"1101111" when hex_input = "1001" else
					"1110111" when hex_input = "1010" else
					"1111100" when hex_input = "1011" else
					"0111001" when hex_input = "1100" else
					"1011110" when hex_input = "1101" else
					"1111001" when hex_input = "1110" else
					"1110001";

end HexTo7segment_arch;


entity HelloWorld is
	port (
		hex_input: in bit_vector(3 downto 0);
		display_out: out bit_vector(6 downto 0)
		);
end HelloWorld;

architecture HelloWorld_arch of HelloWorld is
	signal decoder_out: bit_vector(6 downto 0);
begin

	decoder: entity work.HexTo7segment port map (hex_input, decoder_out);
	display_out <= not decoder_out;

end HelloWorld_arch;