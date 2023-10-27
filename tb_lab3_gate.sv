
`timescale 1 ps/ 1 ps

module tb_lab3_gate; //testbench module
	reg[9:0] sim_SW;
	reg[3:0] sim_KEY;
	wire[6:0] sim_HEX0, sim_HEX1, sim_HEX2, sim_HEX3, sim_HEX4, sim_HEX5;
	
	lab3_top dut( //instantiate
	.SW(sim_SW),
	.KEY(sim_KEY),
	.HEX0(sim_HEX0),
	.HEX1(sim_HEX1),
	.HEX2(sim_HEX2),
	.HEX3(sim_HEX3),
	.HEX4(sim_HEX4),
	.HEX5(sim_HEX5)
	);
	
	initial begin 
	//TEST ERROR
	#5 sim_KEY[3]=0;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000001111;
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	$display("%d, %d, %d, %d, %d, %d", sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0);
	//TEST RESET
	#5 sim_KEY[3]=1;
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_KEY[3]=0;
	 $display("%d, %d, %d, %d, %d, %d", sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0);
	//TEST 797773(Correct Number)
	#5 sim_SW=10'b0000000111; //7
	#1 sim_KEY[0]=1;
	#1 sim_KEY[0]=0;
	#5 sim_SW=10'b0000001001; //9
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000111; //7
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000111; //7
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000111; //7
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000011; //3
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	$display("%d, %d, %d, %d, %d, %d", sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0);
	//RESET
	#5 sim_KEY[3]=1;
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_KEY[3]=0;
	#5 $display("%d, %d, %d, %d, %d, %d", sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0);

	//TEST 793235(Wrong number) 
	#5 sim_SW=10'b0000000111; //7
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000001001; //9
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000011; //3
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000010; //2
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000011; //3
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_SW=10'b0000000101; //5
	$display("%d, %d, %d, %d, %d, %d", sim_HEX5, sim_HEX4, sim_HEX3, sim_HEX2, sim_HEX1, sim_HEX0);
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	#5 sim_KEY[0]=1;
	#5 sim_KEY[0]=0;
	
	$stop;
	end
endmodule
