module subtractor ( x, y, bin, z, bout);
	input x;
	input y;
	input bin;
	output z;
	output bout; 
	
	//Ripple borrow subtractor logical equations
	assign z = x ^ y ^ bin;
	assign bout = (~x & bin) | (~x & y) | (y & bin);
endmodule 