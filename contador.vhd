library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity contador is
	port (
			clock, reset, enableUp, enableDown : in std_logic;
			q : out std_logic_vector (3 downto 0));
end contador;

architecture arch of contador is
begin
	process (clock, reset)
	variable contagem : integer range 0 to 15;
	begin
		if reset = '1' then
			contagem := 0;
		elsif clock'event and clock='1' then
			if enableUp='1' then
				contagem := contagem+1;
			elsif enableDown='1' then
				contagem := contagem-1;
			end if;
		end if;
		q <= conv_std_logic_vector(contagem, 4);
	end process;
	
end arch;