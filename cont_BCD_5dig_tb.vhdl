--Contador BCD Digitales 
--
--Fecha 26/9/20
library IEEE;
use IEEE.std_logic_1164.all;

entity cont_BCD_5dig_tb is
end;

architecture cont_BCD_5dig_tb_arq of cont_BCD_5dig_tb is

	component cont_BCD_5dig is
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
	end component;
	
	signal clk_t: std_logic := '0';
	signal rst_t: std_logic := '1';
	signal ena_t: std_logic := '1';
	signal dig0_t: std_logic_vector(3 downto 0);
	signal dig1_t: std_logic_vector(3 downto 0);
	signal dig2_t: std_logic_vector(3 downto 0);
	signal dig3_t: std_logic_vector(3 downto 0);
	signal dig4_t: std_logic_vector(3 downto 0);

begin

	DUT: cont_BCD_5dig
		port map(
			clk => clk_t,
			rst => rst_t,
			ena => ena_t,
			Dig0 => d0_t,
			Dig1 => d1_t,
			Dig2 => d2_t,
			Dig3 => d3_t,
			Dig4 => d4_t
		);
		
	clk_t <= not clk_t after 10 ns;
	rst_t <= '0' after 100 ns, '1' after 300 ns, '0' after 800 ns;


end;