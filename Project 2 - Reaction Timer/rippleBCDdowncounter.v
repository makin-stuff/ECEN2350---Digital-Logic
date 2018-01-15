module rippleBCDdowncounter(rippleIn, rippleOut,dig);
	input rippleIn;
	output rippleOut;
	output reg [3:0]dig;
	
	always @ (negedge rippleIn)
		begin
			if (dig == 0)
				dig <= 9;
			else if (dig > 0)
				dig <= dig - 1;
			end
	assign rippleOut = (dig == 0) & rippleIn;
	endmodule