module Compare2 (x, y, op, z, equal, greater, less);
	input [3:0]x;
	input [3:0]y;
	input [1:0]op;
	output [7:0]z;
	
	//Procedural assignment requires a register
	output reg equal;
	output reg greater;
	output reg less;
	
	wire[7:0]cmax;
	wire [7:0]cequal;
	wire[7:0]cgreater;
	wire[7:0]cless;
	
	//Comparison module operations
	always @ (x, y)
	begin : linda
		if (x<y) begin
			equal = 0;
			greater = 0;
			less = 1;
		end
		else if (x>y) begin
			equal = 0;
			greater = 1;
			less = 0;
		end
		else begin
			equal = 1;
			greater = 0;
			less = 0;
		end
	end
	
	//Concatenate zeros on output to form an 8-bit number
	assign cequal[7:1] = 7'b0000000;
	assign cequal[0] = equal;
	
	assign cgreater[7:1] = 7'b0000000;
	assign cgreater[0] = greater;
	
	assign cless[7:1] = 7'b0000000;
	assign cless[0] = less;
	
	assign cmax[7:4] = 4'b0000;
	
	//Max output
	genvar i;
	generate
		for (i = 0 ; i<4 ; i = i+1)
		begin : pizza
			maxmux pizzasauce (x[i], y[i], greater, cmax[i]);
		end
	endgenerate
	
	//Multiplexer
	eightbitmux muxed(cequal, cgreater, cless, cmax, op, z);
endmodule
		