module rippleBCDcounter(enable, reset, rippleIn, rippleOut,dig);
	input reset;
	input rippleIn;
	input enable;
	output  rippleOut;
	output reg [3:0]dig;
	
	
	
	always @ (negedge rippleIn, negedge reset)
		begin
			if (reset == 0)
				begin
					dig <= 0;
					
				end
				
			else if (enable == 1)
				begin
					if (dig == 9)
						dig <= 0;
					else if (dig < 9)
						dig <= dig + 1;
					
						
				end
				
		end
		
		

		assign rippleOut = (dig ==9 & rippleIn);
endmodule 