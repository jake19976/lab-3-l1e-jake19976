//seven segment display 
`define ss_0 7'b1000000
`define ss_1 7'b1111001
`define ss_2 7'b0100100	
`define ss_3 7'b0110000
`define ss_4 7'b0011001
`define ss_5 7'b0010010
`define ss_6 7'b0000010
`define ss_7 7'b1011000
`define ss_8 7'b0000000
`define ss_9 7'b0010000
`define ss_off 7'b1111111

//decimal numbers
`define dec_7 10'b0000000111
`define dec_9 10'b0000001001
`define dec_3 10'b0000000011
`define dec_1 10'b0000000001
`define dec_2 10'b0000000010
`define dec_4 10'b0000000100
`define dec_5 10'b0000000101
`define dec_6 10'b0000000110
`define dec_8 10'b0000001000
`define dec_0 10'b0000000000

//state
`define state_0 4'b0000
`define state_1 4'b0001
`define state_2 4'b0010
`define state_3 4'b0011
`define state_4 4'b0100
`define state_5 4'b0101
`define state_6 4'b0110
`define false_state_7 4'b0111
`define false_state_8 4'b1000
`define false_state_9 4'b1001
`define false_state_10 4'b1010
`define false_state_11 4'b1011
`define false_state_12 4'b1100


//letters on the display
`define letter_E 7'b0000110
`define letter_r 7'b0101111
`define letter_O 7'b1000000
`define letter_P 7'b0001100
`define letter_n 7'b0101011
`define letter_C 7'b1000110
`define letter_L 7'b1000111
`define letter_S 7'b0010010
`define letter_D 7'b1000000

module lab3_top(SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR); //module starts
	input[9:0] SW; //inuput binary number
	input[3:0] KEY; //reset and clock
	output[9:0] LEDR; // optional: use these outputs for debugging on your DE1-SoC
	output reg[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	reg[3:0] state; //state of the number
	wire clk = ~KEY[0]; //clock 
	wire rst_n = KEY[3]; //reset 

	always_ff@(posedge clk) begin //begins at positive edge of clock
		if(rst_n==1'b0) begin //if reset is on state goes back to initial state
			state=`state_0; 
		end else begin
			case(state)
				//when the correct numbers are entered, "open",, if the numbers are incorrect, go to false state for an "error"
				`state_0: if(SW==`dec_7) begin  
						state=`state_1;
					end 
					else begin state=`false_state_7; end
				`state_1: if(SW==`dec_9) begin
						state=`state_2;
					end 
					else begin state=`false_state_8; end
				`state_2: if(SW==`dec_7) begin
						state=`state_3;
					end 
					else begin state=`false_state_9; end
				`state_3: if(SW==`dec_7) begin
						state=`state_4;
					end
					else begin state=`false_state_10; end
				`state_4: if(SW==`dec_7) begin
						state=`state_5;
					end
					else begin state=`false_state_11; end
				`state_5: if(SW==`dec_3) begin
						state=`state_6;
					end
					else begin state=`false_state_12; end
				`false_state_7: state=`false_state_8;
				`false_state_8: state=`false_state_9;
				`false_state_9: state=`false_state_10;	
				`false_state_10: state=`false_state_11;
				`false_state_11: state=`false_state_12;
				`false_state_12: state=`false_state_12;
				`state_6: state=`state_6;


			endcase
		end
	end

	always@(state, SW) begin //"always" for the number display on the seven segment display 
		//initially all the displays are off
		HEX0=`ss_off;
		HEX1=`ss_off;
		HEX2=`ss_off;
		HEX3=`ss_off;
		HEX4=`ss_off;
		HEX5=`ss_off;
		case(SW) //number displays based on binary numbers entered
			`dec_0: HEX0=`ss_0;
			`dec_1: HEX0=`ss_1;
			`dec_2: HEX0=`ss_2;
			`dec_3: HEX0=`ss_3;
			`dec_4: HEX0=`ss_4;
			`dec_5: HEX0=`ss_5;
			`dec_6: HEX0=`ss_6;
			`dec_7: HEX0=`ss_7;
			`dec_8: HEX0=`ss_8;
			`dec_9: HEX0=`ss_9;
		endcase
		if(SW>`dec_9) begin //if the number is bigger than 9, disiplay "ErrOr"
			HEX5=`ss_off;
			HEX4=`letter_E;
			HEX3=`letter_r;
			HEX2=`letter_r;
			HEX1=`letter_O;
			HEX0=`letter_r;
		end else
		if(state==`state_6) begin //if the correct password is entered, display "OPEn"
			HEX5=`ss_off;
			HEX4=`ss_off;
			HEX3=`letter_O;
			HEX2=`letter_P;
			HEX1=`letter_E;
			HEX0=`letter_n;
		end else
		if(state==`false_state_12) begin //if the password is incorrect, display "CLOSED"
			HEX5=`letter_C;
			HEX4=`letter_L;
			HEX3=`letter_O;
			HEX2=`letter_S;
			HEX1=`letter_E;
			HEX0=`letter_D;
		end
	end
endmodule
