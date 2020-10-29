library ieee;
use ieee.std_logic_1164.all;
use work.comparador_package.all;
use work.contador_package.all;
use work.display_package.all;

PACKAGE caminho_de_dados_package IS
	COMPONENT caminho_de_dados
	port( clk, reset : in std_logic;
			entrada, saida : in std_logic;
			placa1, placa2, codigo_ticket : in std_logic_vector(15 downto 0);
	      ticket_ok, lotado : out std_logic;
			display_vagas_ocupadas, codigo_ticket_impresso : out std_logic_vector(15 downto 0)
	    );
	END COMPONENT ;
END caminho_de_dados_package;