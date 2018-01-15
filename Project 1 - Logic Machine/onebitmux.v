module onebitmux(A, B, C, D, op, out);
	input A;
	input B;
	input C;
	input D;
	input [1:0]op;
	output out;
	
	//Multiplexer
	assign out = (~op[0] & ~op[1] & A ) | 
					 (~op[0] & op[1] & B) | 
					 (op[0] & ~op[1] & C) | 
					 (op[0] & op[1] & D);
endmodule	