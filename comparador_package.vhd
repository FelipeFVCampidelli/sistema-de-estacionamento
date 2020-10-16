LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

PACKAGE comparador_package IS
	COMPONENT comparador
	PORT (x, y : IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
	igual, maior, menor : OUT STD_LOGIC ) ;

	END COMPONENT ;
END comparador_package;