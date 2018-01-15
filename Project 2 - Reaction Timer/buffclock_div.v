module buffclock_div(clock50M, buffclock);
	input clock50M;
	output reg buffclock;
	
	reg [23:0]divider;
	
	always @ (posedge clock50M)
		begin
			if (divider == 2500000)   //*2500000 this is 1ms* *Add 0's for longer time*
				begin
				buffclock = ~buffclock;
				divider=0;
				end
			else
				divider = divider + 1;
		end
endmodule