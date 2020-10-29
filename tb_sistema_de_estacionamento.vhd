library ieee;
use ieee.std_logic_1164.all;

entity tb_sistema_de_estacionamento is
end tb_sistema_de_estacionamento;

architecture teste of tb_sistema_de_estacionamento is

component sistema_de_estacionamento is
	port( clk, reset, sensor1, sensor2, printa_ticket, aguarda_ticket : in std_logic;
			placa1, placa2, codigo_ticket : in std_logic_vector(15 downto 0);
	      open_gate, imprime_ticket : out std_logic;
			display_vagas_ocupadas, codigo_ticket_impresso : out std_logic_vector(15 downto 0)
	    );
end component;
	
	signal clk : std_logic := '0';
	signal reset, sensor1, sensor2, printa_ticket, aguarda_ticket : std_logic;
	signal placa1, placa2, codigo_ticket : std_logic_vector(15 downto 0);
	signal open_gate, imprime_ticket : std_logic;
	signal display_vagas_ocupadas, codigo_ticket_impresso : std_logic_vector(15 downto 0);
	
	constant periodo_clock : time := 10 ns;
	
	
	begin
	instancia_sistema_de_estacionamento: sistema_de_estacionamento 
		port map( clk=>clk, reset=>reset, sensor1=>sensor1, sensor2=>sensor2, printa_ticket=>printa_ticket, aguarda_ticket=>aguarda_ticket,
					 placa1=>placa1, placa2=>placa2, codigo_ticket=>codigo_ticket, open_gate=>open_gate, imprime_ticket=>imprime_ticket,
					 display_vagas_ocupadas=>display_vagas_ocupadas, codigo_ticket_impresso=>codigo_ticket_impresso );
	

	processo_clock : process
		begin
			clk <= '0';
		wait for periodo_clock/2;
			clk <= '1';
		wait for periodo_clock/2;
	end process;
	
	processo_estimulo : process
		begin  
				reset <= '0';
				sensor1 <= '0';
				sensor2 <= '0';
				printa_ticket <= '0';
				aguarda_ticket <= '0';
				placa1 <= "0000000000000000";
				placa2 <= "0000000000000000";
				codigo_ticket <= "0000000000000000";
			
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000110";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 1 entrou no estacionamento
			
			wait for periodo_clock*10;
				sensor2 <= '1';
				placa2 <= "0000000000000110";
			wait for periodo_clock*2; 
				aguarda_ticket <= '1';
				codigo_ticket <= "0000000000000110";
			wait for periodo_clock*2;
				aguarda_ticket <= '0';
				sensor1 <= '1';
				sensor2 <= '0'; 		 
			wait for periodo_clock*2;
				sensor1 <= '0';        --Carro 1 saiu do estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000001";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 2 entrou no estacionamento
			
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000010";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 3 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000011";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 4 entrou no estacionamento

			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000100";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 5 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000101";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 6 entrou no estacionamento
			
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000110";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 7 entrou no estacionamento
			
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000000111";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 8 entrou no estacionamento
			
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001000";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 9 entrou no estacionamento
			
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001001";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 10 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001010";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 11 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001011";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 12 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001100";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 13 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001101";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 14 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001101";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 15 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001110";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 16 entrou no estacionamento
				
			wait for periodo_clock*10;
				sensor1 <= '1';
				placa1 <= "0000000000001111";
			wait until imprime_ticket = '1';
				printa_ticket <= '1';
			wait for periodo_clock*2;
				sensor2 <= '1';
				sensor1 <= '0'; 			
				printa_ticket <= '0'; 
			wait for periodo_clock*2;
				sensor2 <= '0';         --Carro 17 entrou no estacionamento	
			
			wait;
	end process;
end teste;