--Contador BCD Digitales 
--
--Fecha 26/9/20
library IEEE;
use IEEE.std_logic_1164.all;

entity cont_BCD is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		ena_sig: out std_logic;
		Q: out std_logic_vector(3 downto 0)
	);

end;

architecture cont_BCD_arq of cont_BCD is

	component cont_Nbits is
		generic(N: natural);
		port(
			clk: in std_logic;
			rst: in std_logic;
			ena: in std_logic;
			Q: out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	constant Nbits_cont: natural := 4;   --Digo que la salida de contador Nbits Q=0000 a 1111
	signal rst_aux: std_logic;
	signal q_aux: std_logic_vector(3 downto 0);
begin
	cont_4bit: cont_Nbits
		generic map(N => Nbits_cont)
		port map(
			clk => clk,  --mapeo el clock del cont_Nbits con el de BCD
			rst => rst_aux,   --mapeo el reset del cont_Nbits con la señal auxiliar 
			ena => ena,   --mapeo el enable del cont_Nbits con el de BCD
			Q => q_aux   --Q del cont_Nbits
		);

	Q <= q_aux;  --Q del BCD
	ena_sig <= q_aux(0) and q_aux(3) and ena;   --cuando q_aux sea 9 se pone en 1, habilita al siguiente BCD
	rst_aux <= rst or (q_aux(0) and q_aux(3) and ena);   --caundo q_aux 9 se pone en 1 resetea el cont_Nbits para que cuente de 0 a 9 
	
end;