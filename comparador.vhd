library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comparador is

	port 
	(
		x	   : in std_logic_vector	(15 downto 0);
		y	   : in std_logic_vector	(15 downto 0);
		
		
		igual, maior, menor : out std_logic
	);

end entity;

architecture rtl of comparador is
begin
	
	igual <= '1' when x = y else '0' ;
	maior <= '1' when x > y else '0' ;
	menor <= '1' when x < y else '0' ;

end rtl;