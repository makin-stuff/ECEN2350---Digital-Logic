module eightbitmux (A, B, C, D, sel, out);
	input [7:0]A;
	input [7:0]B;
	input [7:0]C;
	input [7:0]D;
	input [1:0]sel;
	output[7:0]out;
	
	//Duplicate multiplexer for all 8 bits
	genvar i;
	generate
		for(i=0; i<8; i = i + 1) 
		begin: NMuxies
				onebitmux stage(A[i], B[i], C[i], D[i], sel[1:0], out[i]);
		end
	endgenerate 

endmodule 
			