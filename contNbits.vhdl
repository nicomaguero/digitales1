library IEEE;
use IEEE.std_logic_1164.all;

entity cont_Nbits is
	generic(N: natural);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		Q: out std_logic_vector(N-1 downto 0)
	);

end;

architecture cont_Nbits_arq of cont_Nbits is
	signal d_aux: std_logic_vector(N-1 downto 0);
	signal q_aux: std_logic_vector(N-1 downto 0);
	signal and_aux: std_logic_vector(N downto 0);

	component ffd is
		port(
			clk: in std_logic;
			arst: in std_logic;
			srst: in std_logic;
			ena: in std_logic;
			D: in std_logic;	
			Q: out std_logic
		);
	end component;
	

	begin

	and_aux(0) <= '1';
	gg: for i in 0 to N-1 generate
    ffd_inst : ffd port map(
					clk => clk,
					arst => '0',
					srst => rst,
					ena => ena,
					D => d_aux(i),
					Q => q_aux(i)				
				);	 
	d_aux(i) <= and_aux(i) xor q_aux(i);
	and_aux(i+1) <= q_aux(i) and and_aux(i);
	end generate;
	Q <= q_aux;
	
end;