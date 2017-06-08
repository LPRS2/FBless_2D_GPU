-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

library fb_less_2d_gpu_periph_v1_00_a;
use fb_less_2d_gpu_periph_v1_00_a.all;

ENTITY fb_less_2d_gpu_standalone_tb IS
END fb_less_2d_gpu_standalone_tb;

ARCHITECTURE behavior OF fb_less_2d_gpu_standalone_tb IS 


	signal clk_24MHz_i : std_logic := '0';
	signal rst_in      : std_logic := '0';

	constant clk_period : time := 1000 ns/24;
BEGIN
	uut: entity fb_less_2d_gpu_periph_v1_00_a.fb_less_2d_gpu_standalone PORT MAP(
		clk_24MHz_i		=> clk_24MHz_i,
		rst_in			=> rst_in,

		vga_clk_o		=> open,
		red_o				=> open,
		green_o			=> open,
		blue_o			=> open,
		blank_on			=> open,
		h_sync_on		=> open,
		v_sync_on		=> open,
		sync_on			=> open,
		pow_save_on		=> open
	);


	process
	begin
		clk_24MHz_i <= not clk_24MHz_i;
		wait for clk_period/2;
	end process;



	tb : PROCESS
	BEGIN
		wait for 3*clk_period;
		rst_in <= '1';
		

		wait; -- will wait forever
	END PROCESS tb;

  END;
