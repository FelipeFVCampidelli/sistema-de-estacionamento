library ieee;
use ieee.std_logic_1164.all;
use work.comparador_package.all;
use work.contador_package.all;
use work.display_package.all;
use work.caminho_de_dados_package.all;
use work.controladora_package.all;

entity sistema_de_estacionamento is
	port( clk, reset, sensor1, sensor2, printa_ticket, aguarda_ticket : in std_logic;
			placa1, placa2, codigo_ticket : in std_logic_vector(15 downto 0);
	      open_gate, imprime_ticket : out std_logic;
			display_vagas_ocupadas, codigo_ticket_impresso : out std_logic_vector(15 downto 0)
	    );
end sistema_de_estacionamento;

architecture arch of sistema_de_estacionamento is

	signal entrada, saida, ticket_ok, lotado : std_logic;
	
	
begin
	
	datapath : caminho_de_dados port map (clk, reset, entrada, saida, placa1, placa2, codigo_ticket,
													  ticket_ok, lotado,	display_vagas_ocupadas, codigo_ticket_impresso);

	controller  : controladora port map (clk, reset, sensor1, sensor2, printa_ticket, aguarda_ticket, ticket_ok, lotado,
													 entrada, saida, open_gate, imprime_ticket);
end arch;