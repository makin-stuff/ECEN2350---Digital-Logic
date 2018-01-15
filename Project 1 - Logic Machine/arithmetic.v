module arithmetic (x, y, op, z, carry);
	input [3:0]x;
	input [3:0]y;
	input [1:0]op;
	output [7:0]z;
	output carry;
	
	wire [7:0]aadd;
	wire [7:0]asubtract;
	wire [7:0]amultiply;
	wire [7:0]adivide;
	
	//Wires holding carries for arithmetic operations
	wire [4:0]coutadd;
	wire [4:0]bsub;
	wire coutmult;
	wire remdiv;
	
	//Add
	assign coutadd[0] = 1'b0;
	genvar i; 
	generate
		for (i=0; i<4; i = i + 1)
			begin : tortellini
				adder stage(x[i], y[i], coutadd[i], aadd[i], coutadd[i+1]);
				end
			endgenerate
			
	//Subtract
	assign bsub[0] = 1'b0;
	genvar j;
	generate
		for (j=0; j<4; j=j+1)
			begin : ravioli
				subtractor stage(x[j], y[j], bsub[j], asubtract[j], bsub[j+1]);
				end
			endgenerate
	
	//Multiply
	assign amultiply[7:0] = {y,x} << 1;
	assign coutmult = y[3];
	
	//Divide
	assign adivide[7:0] = {y,x} >> 1;
	assign remdiv = x[0];
	
	//Multiplexer for arithmetic operations and carries
	eightbitmux remi(aadd, asubtract, amultiply, adivide, op, z);
	onebitmux collete(coutadd[4], bsub[4], coutmult, remdiv, op, carry);
	
endmodule
	