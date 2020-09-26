--Contador BCD Digitales 
--
--Fecha 26/9/20
library IEEE;
use IEEE.std_logic_1164.all;

entity cont_BCD_5dig is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		Dig0: out std_logic_vector(3 downto 0);
		Dig1: out std_logic_vector(3 downto 0);
		Dig2: out std_logic_vector(3 downto 0);
		Dig3: out std_logic_vector(3 downto 0);
		Dig4: out std_logic_vector(3 downto 0)
	);

end;

architecture cont_BCD_5dig_arq of cont_BCD_5dig is

	component cont_BCD is
		port(
			clk: in std_logic;
			rst: in std_logic;
			ena: in std_logic;
			ena_sig: out std_logic;
			Q: out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal dig0_aux: std_logic_vector(3 downto 0);
	signal dig1_aux: std_logic_vector(3 downto 0);
	signal dig2_aux: std_logic_vector(3 downto 0);
	signal dig3_aux: std_logic_vector(3 downto 0);
	signal dig4_aux: std_logic_vector(3 downto 0);
	signal ena_aux: std_logic_vector(4 downto 0);

begin
	BCD0 : cont_BCD
		port map(
			clk => clk,
			rst => rst,
			ena => ena,
			ena_sig => ena_aux(0),
			Q => dig0_aux
		);
	
	BCD1 : cont_BCD
		port map(
			clk => clk,
			rst => rst,
			ena => ena_aux(0),
			ena_sig => ena_aux(1),
			Q => dig1_aux
		);
	
	BCD2 : cont_BCD
		port map(
			clk => clk,
			rst => rst,
			ena => ena_aux(1),
			ena_sig => ena_aux(2),
			Q => dig2_aux
		);
	
	BCD3 : cont_BCD
		port map(
			clk => clk,
			rst => rst,
			ena => ena_aux(2),
			ena_sig => ena_aux(3),
			Q => dig3_aux
		);
	
	BCD4 : cont_BCD
		port map(
			clk => clk,
			rst => rst,
			ena => ena_aux(3),
			ena_sig => ena_aux(4),
			Q => dig4_aux
		);
		
	Dig0 <= dig0_aux;
	Dig1 <= dig1_aux;
	Dig2 <= dig2_aux;
	Dig3 <= dig3_aux;
	Dig4 <= dig4_aux;
end;