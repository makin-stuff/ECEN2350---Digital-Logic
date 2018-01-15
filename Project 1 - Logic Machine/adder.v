module adder( x, y, cin, z, cout);
	input x;
	input y;
	input cin;
	output cout;
	output z;
	
	//Ripple carry adder logical equations
	assign z = x ^ y ^ cin;
	assign cout = (x & y) | (x & cin) | (y & cin);
endmodule 