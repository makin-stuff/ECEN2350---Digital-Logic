module highscore (pullvalue, val0, val1, val2, val3, hs);
	input pullvalue;
	input [3:0]val0;
	input [3:0]val1;
	input [3:0]val2;
	input [3:0]val3;
	output reg [11:0]hs;
	
	
	always @ (pullvalue)
		begin
			if (pullvalue == 1)
				begin
					hs = {val3, val2, val1, val0};
				end
			else
				begin
					hs = hs;
				end
		end
			
	
		endmodule 
	