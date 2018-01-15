module Project2(clock50M, key0, key1, sevenseg0, sevenseg1, sevenseg2, sevenseg3, sevenseg4, sevenseg5, led, decimal, switch, state, nextstate, downenable, skobuffenable, upenable, displayscoreenable , w, highscore, resetcount);
	
	//clock
	input clock50M;
	wire clock1k;
	wire buffclock;
	
	//buttons
	input key0;
	input key1;
	
	//switch
	input switch;
	
	//Seven Seg Display
	output [6:0]sevenseg0;
	output [6:0]sevenseg1;
	output [6:0]sevenseg2;
	output [6:0]sevenseg3;
	output [6:0]sevenseg4;
	output [6:0]sevenseg5;
	output reg [5:0] decimal;
	
	wire [6:0]bsevenseg0;
	wire [6:0]bsevenseg1;
	wire [6:0]bsevenseg2;
	wire [6:0]bsevenseg3;
	wire [6:0]bsevenseg4;
	wire [6:0]bsevenseg5;
	
	wire [6:0]bcdsevenseg0;
	wire [6:0]bcdsevenseg1;
	wire [6:0]bcdsevenseg2;
	wire [6:0]bcdsevenseg3;
	wire [6:0]bcdsevenseg4;
	wire [6:0]bcdsevenseg5;
	
	wire [6:0]highscoresevenseg0;
	wire [6:0]highscoresevenseg1;
	wire [6:0]highscoresevenseg2;
	wire [6:0]highscoresevenseg3;
	wire [6:0]highscoresevenseg4;
	wire [6:0]highscoresevenseg5;
	
	output reg [9:0] led;
	
	//input encoded values characters into seven seg for up counter
	wire [3:0]val0;
	wire [3:0]val1;
	wire [3:0]val2;
	wire [3:0]val3;
	wire [3:0]val4;
	wire [3:0]val5;
	
	//input encoded values characters into seven seg for go buff stream
	wire [3:0]bval0;
	wire [3:0]bval1;
	wire [3:0]bval2;
	wire [3:0]bval3;
	wire [3:0]bval4;
	wire [3:0]bval5;
	
	
	
	wire [5:0]ripple;
	
	wire [15:0]count;
	
	//state
	output reg [1:0]state;
	output reg [1:0]nextstate;
	
	//enable registers
	output reg upenable;
	output reg downenable;
	output reg skobuffenable;
	output reg displayscoreenable;
	
	
	output reg [15:0]highscore;
	//createclocks
	clock_div steve (clock50M, clock1k); //create 1k clock
	buffclock_div buff (clock50M, buffclock); //Slow clock
		
	reg [15:0]currentscore;
	output reg resetcount;
	
	wire [3:0] displaystate;
	
	skobuffs display (skobuffenable, buffclock, displaystate, bval0, bval1, bval2, bval3,bval4, bval5);
	
	//scrolling sko buffs
	BCD_decoder bdecode0 (skobuffenable, bval0, bsevenseg0);
	BCD_decoder bdecode1 (skobuffenable, bval1, bsevenseg1);
	BCD_decoder bdecode2 (skobuffenable, bval2, bsevenseg2);
   BCD_decoder bdecode3 (skobuffenable, bval3, bsevenseg3);
	BCD_decoder bdecode4 (skobuffenable, bval4, bsevenseg4);
	BCD_decoder bdecode5 (skobuffenable, bval5, bsevenseg5);
	
	//count up
	BCD_decoder decode0 (upenable, val0, bcdsevenseg0);
	BCD_decoder decode1 (upenable, val1, bcdsevenseg1);
	BCD_decoder decode2 (upenable, val2, bcdsevenseg2);
   BCD_decoder decode3 (upenable, val3, bcdsevenseg3);
	BCD_decoder decode4 (upenable, val4, bcdsevenseg4);
	BCD_decoder decode5 (upenable, val5, bcdsevenseg5);
	
	//countdown
	wire zero;
	countdown  (downenable, clock1k, zero, count);
	
	
	
	//Create BCD counter
	rippleBCDcounter bit0 (upenable, resetcount, clock1k, ripple[0], val0);
	rippleBCDcounter bit1 (upenable, resetcount, ripple[0], ripple[1], val1);
	rippleBCDcounter bit2 (upenable, resetcount, ripple[1], ripple[2], val2);
	rippleBCDcounter bit3 (upenable, resetcount, ripple[2], ripple[3], val3);
	rippleBCDcounter bit4 (upenable, resetcount, ripple[3], ripple[4], val4);
	rippleBCDcounter bit5 (upenable, resetcount, ripple[4], ripple[5], val5);
	
		//BCD Decoder for Seven Seg display
	BCD_decoder hsdecode0 (1, highscore[3:0], highscoresevenseg0);
	BCD_decoder hsdecode1 (1, highscore[7:4], highscoresevenseg1);
	BCD_decoder hsdecode2 (1, highscore[11:8], highscoresevenseg2);
   BCD_decoder hsdecode3 (1, highscore[15:12], highscoresevenseg3);
	BCD_decoder hsdecode4 (1, 10, highscoresevenseg4);
	BCD_decoder hsdecode5 (1, 10, highscoresevenseg5);
	
	mux(bcdsevenseg0, bsevenseg0, highscoresevenseg0, state, switch, sevenseg0);
	mux(bcdsevenseg1, bsevenseg1, highscoresevenseg1, state, switch, sevenseg1);
	mux(bcdsevenseg2, bsevenseg2, highscoresevenseg2, state, switch, sevenseg2);
	mux(bcdsevenseg3, bsevenseg3, highscoresevenseg3, state, switch, sevenseg3);
	mux(bcdsevenseg4, bsevenseg4, highscoresevenseg4, state, switch, sevenseg4);
	mux(bcdsevenseg5, bsevenseg5, highscoresevenseg5, state, switch, sevenseg5);

	
	always @ (posedge clock1k)
		begin
			state <= nextstate;
		end
	
output reg [2:0]w;
initial w = 0;

	
	always @ (posedge key0)
		begin
		if (switch == 0)
			begin
				if (w < 3 && state !=1)
					w = w+1;
				else if (w == 3)
					w = 1;
			end
		if (switch == 1)
			w  = 0;
		end
		
		
		always @ (state)
			begin
			if (switch == 0) //play mode
				begin
					case(state)
						
						0: 
							begin
								downenable = 0;
								resetcount = 0;
								upenable = 0;
								skobuffenable = 1;
								displayscoreenable = 0;
								decimal = 6'b111111;
								led[8:0] = 0;
								
								if (w ==1) 
									
										nextstate= 1;
								else 
									nextstate = 0;
							end
						1:
							begin
								resetcount = 1;
								downenable = 1;
								upenable = 0;
								skobuffenable = 0;
								displayscoreenable = 0;
								decimal = 6'b111111;
								led[8:0] = 0;
								
								if (zero == 1)	
									nextstate= 2;
								else 
									nextstate = 1;
								
							end
						2:
							begin
								resetcount = 1;
								downenable = 0;
								upenable = 1;
								skobuffenable = 0;
								displayscoreenable = 0;
								decimal = 6'b110111;
								led[8:0] = 9'b111111111;
								
								if (w ==2)
									nextstate= 3;
								else 
									nextstate = 2;
							end
						3:
							begin
								
								resetcount = 1;
								upenable = 0;
								currentscore = {val3, val2, val1, val0};
								skobuffenable = 0;
								displayscoreenable = 1;
								downenable = 0;
								decimal = 6'b110111;
								led[8:0] = 0;
								
						
								if (w ==3)
								
									nextstate= 0;

								else 
									nextstate = 3;
							end
						endcase
				end
				else if (switch == 1) //highscore mode
					begin
					nextstate = 0;
					upenable = 0;
					downenable = 0;
					displayscoreenable = 0;
					skobuffenable = 0;
					decimal = 6'b110111;
					
					end
				
		end
	




initial highscore = 16'b1001100110011001;
	
	
	always @ (currentscore)
		begin
			if ((currentscore < highscore) && (currentscore > 0))
				begin
					highscore <= currentscore;
				end

			else
				begin
					highscore <= highscore;
				end
		end

	endmodule 
