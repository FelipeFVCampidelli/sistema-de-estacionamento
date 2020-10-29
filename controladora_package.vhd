LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

PACKAGE controladora_package IS
	COMPONENT controladora
	port ( clk, reset : in std_logic;
			  sensor1, sensor2, printa_ticket, aguarda_ticket, ticket_ok, lotado : in std_logic;
           entrada, saida, open_gate, imprime_ticket : out std_logic
          );

	END COMPONENT ;
END controladora_package;