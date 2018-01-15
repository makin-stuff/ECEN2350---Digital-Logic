module maxmux(x,y,sel,z);
	input x;
	input y;
	input sel;
	output z;
	
	//Multiplexer used to find max number
	assign z = (x & sel) | (y & ~sel);
endmodule 