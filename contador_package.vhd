LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE contador_package IS
	COMPONENT contador
	PORT (clock, reset, enableUp, enableDown : IN STD_LOGIC;
	q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ) ;

	END COMPONENT ;
END contador_package;