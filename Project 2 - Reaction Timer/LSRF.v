module LSRF (clock, randval );
	input clock;
	output reg [11:0]randval ;
	initial randval <= 1;
	

	always@(posedge clock)
		begin
			randval[11:1] <= randval[10:0];
			randval[0] <= randval[11] ^ randval[10];
		end
		
endmodule 