module clock_div(clock50M, clock1k);
	input clock50M;
	output reg clock1k;
	
	reg [23:0]divider;
	
	always @ (posedge clock50M)
		begin
			if (divider == 25000)   //*25000 this is 1ms* *Add 0's for longer time*
				begin
				clock1k = ~clock1k;
				divider=0;
				end
			else
				divider = divider + 1;
		end
endmodule
