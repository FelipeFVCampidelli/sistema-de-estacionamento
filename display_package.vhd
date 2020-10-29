library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

PACKAGE display_package IS
	COMPONENT display
	port (
        clk           : in  std_logic;
        rst           : in  std_logic;
        visor       : in  std_logic_vector(3 downto 0);
        LED           : out std_logic_vector(15 downto 0)
    );
	END COMPONENT ;
END display_package;