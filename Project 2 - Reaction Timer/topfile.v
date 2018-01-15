module topfile(clk, button, reset, LED, sevenseg1, sevenseg2, sevenseg3, state, waitcount);
	input clk;
	input button;
	input reset;
	
	output reg LED;
	output reg [3:0]sevenseg1;
	output reg [3:0]sevenseg2;
	output reg [3:0]sevenseg3;
	
	output reg [1:0]state;
	
	output reg [9:0]waitcount;
	
	always  @ (negedge reset, posedge clk)
		if (reset == 0)
			state = 0;
		//else
			//state;
	
	always @ (state)
		case (state)
			0: //zero state
				begin
					sevenseg1 = 0;
					sevenseg2 = 0;
					sevenseg3 = 0;
					LED = 0;
				end
				
			1: //wait for random time
				begin
					LED = 0;
					//LSRF();
				end
				
			2: //turn on LED and time
				begin
					LED = 1;
				end
				
			3: //display output
				begin
					LED = 0;
				end
			default:	
				begin
					state = 0;
					sevenseg1 = 0;
					sevenseg2 = 0;
					sevenseg3 = 0;
					LED = 0;
				end
			endcase
	endmodule 
