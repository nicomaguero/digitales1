--Contador N-bits Digitales Test
--
--Fecha 20/9/20

library IEEE;
use IEEE.std_logic_1164.all;

entity cont_Nbits_tb is				--PASO 1: Definir la entidad TestBench sin añadir ningún puerto
end;

architecture cont_Nbits_tb_arq of cont_Nbits_tb is

	component cont_Nbits is					--PASO 2: Declarar como componente el circuito para simular
		generic(N: natural);
		port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		Q: out std_logic_vector(N-1 downto 0)
	);
	end component;
	
	constant N_t: natural := 10;			--PASO 3: Declarar una señal por cada puerto del componente.
	signal clk_t: std_logic := '0';
	signal rst_t: std_logic := '1';
	signal ena_t: std_logic := '1';
	signal q_t: std_logic_vector(N_t-1 downto 0);

begin

	DUT: cont_Nbits  	--PASO 4: Realizar una instancia al componente, conectando sus puertos a las señales correspondientes
		generic map(N => N_t)
		port map(
			clk => clk_t,
			rst => rst_t,
			ena => ena_t,
			Q => q_t
		);
		
	clk_t <= not clk_t after 10 ns;		--PASO 5: Generar los estímulos
	rst_t <= '0' after 100 ns;


end;