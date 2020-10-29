library ieee;
use ieee.std_logic_1164.all;

entity controladora is
    port ( clk, reset : in std_logic;
			  sensor1, sensor2, printa_ticket, aguarda_ticket, ticket_ok, lotado : in std_logic;
           entrada, saida, open_gate, imprime_ticket : out std_logic
          );
end controladora;

architecture RTL OF controladora is
	type FSM_States is (IDLE, WARNING, PRINT_TICKET, ESPERA_TICKET, CONFERE_TICKET, ENTRAR, SAIR, AGUARDA);
	signal current_state,next_state: FSM_States;
	
begin

process(clk,reset)
begin
	 if(reset='1') then
		current_state <= IDLE;
	 elsif(rising_edge(clk)) then
		current_state <= next_state;
	 end if;
end process;


process(current_state, sensor1, sensor2, printa_ticket, aguarda_ticket, ticket_ok, lotado)
begin
	case current_state is 
		when IDLE =>
		entrada <= '0';
		saida <= '0';
		open_gate <= '0';
			if(sensor1 = '1' and sensor2 = '0' and lotado = '0') then
				imprime_ticket <= '1';
				next_state <= PRINT_TICKET;
			elsif(sensor1 = '0' and sensor2 = '1') then
			   imprime_ticket <= '0';
				next_state <= ESPERA_TICKET;
			elsif(sensor1 = '1' and sensor2 = '1') then
				imprime_ticket <= '0';
				next_state <= WARNING;
			else
				imprime_ticket <= '0';
				next_state <= IDLE;
			end if;
		
		when WARNING =>
		entrada <= '0';
		saida <= '0'; 
		imprime_ticket <= '0';
		open_gate <= '0';
			if(sensor1 = '0' or sensor2 = '0') then
				next_state <= IDLE;
			else
				next_state <= WARNING;
			end if;
		
		when AGUARDA =>
		entrada <= '0';
		saida <= '0';
		imprime_ticket <= '0';
		open_gate <= '1';
			if(sensor1 = '1' or sensor2 = '1') then
				next_state <= AGUARDA;
			else		
				next_state <= IDLE;
			end if;
		
		when PRINT_TICKET =>
		entrada <= '0';
		saida <= '0';
		imprime_ticket <= '1';
		open_gate <= '0';
			if(printa_ticket = '1') then
				next_state <= ENTRAR;
			else
				next_state <= PRINT_TICKET;
			end if;
		
		when ESPERA_TICKET =>
		entrada <= '0';
		saida <= '0';
		imprime_ticket <= '0';
		open_gate <= '0';
			if(aguarda_ticket = '1') then
				next_state <= CONFERE_TICKET;
			else
				next_state <= ESPERA_TICKET;
			end if;
		
		when CONFERE_TICKET =>
		entrada <= '0';
		saida <= '0'; 
		imprime_ticket <= '0';
		open_gate <= '0';
			if(ticket_ok = '1') then
				next_state <= SAIR;
			else
				next_state <= ESPERA_TICKET;
			end if;
			
		when ENTRAR =>
		saida <= '0';
		entrada <= '1';
		imprime_ticket <= '0';
		open_gate <= '1';
			if(sensor1 = '0' and sensor2 = '1') then
				next_state <= AGUARDA;
			else
				next_state <= ENTRAR;
			end if;

		when SAIR =>
		entrada <= '0';
		saida <= '1';
		imprime_ticket <= '0';
		open_gate <= '1';
			if(sensor1 = '1' and sensor2 = '0') then
				next_state <= AGUARDA;
			else
				next_state <= SAIR;
			end if;
	end case;
end process;
end RTL;