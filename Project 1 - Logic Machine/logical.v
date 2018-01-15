module logical(x, y, op, z);
	input [3:0]x;
	input[3:0]y;
	input	[1:0]op;
	output [7:0]z;
	
	wire [7:0]land;
	wire [7:0]lor;
	wire [7:0]lxor;
	wire [7:0]lnot;
	
	//Concatenate 4 bits of zeros to operation output
	assign land [7:4] = 4'b0000;
	assign lor [7:4] = 4'b0000;
	assign lxor [7:4] = 4'b0000;
	
	//Logical operations
	assign land[3:0] = x[3:0] & y[3:0];
	assign lor[3:0] = x[3:0] | y[3:0];
	assign lxor[3:0] = x[3:0] ^ y[3:0];
	assign lnot = ~{y,x};
	
	//Multiplexer
	eightbitmux answer(land, lor,  lxor, lnot, op, z); 
endmodule 
