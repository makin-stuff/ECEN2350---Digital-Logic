//module compare (x, y, op, z);
//	input [3:0]x;
//	input [3:0]y;
//	input [1:0]op;
//	output reg [7:0]z;
//	
//	wire [7:0]cequal;
//	wire [7:0]cgreaterthan;
//	wire [7:0]clessthan;
//	wire [7:0]cmax;
//	
//	assign cequal[7:1] = 7'b0000000;
//
//	assign clessthan[7:1] = 7'b0000000;
//	assign cmax[7:4] = 4'b0000;
//	
//	assign cequal[0] = (x[0] ~^ y[0]) & (x[1] ~^ y[1]) & (x[2] ~^ y[2]) & (x[3] ~^ y[3]);
//	
//	always @(x,y)
//		begin: mushroom
//		if (x>y)
//		
//			cgreaterthan[7:0] = 8'b00000001;
//			
//		else
//			
//			cgreaterthan[7:0] = 8'b00000000;
//	
//		end
//	
//			
//	assign clessthan[0] = ~cgreaterthan[0];
//	
//	genvar i;
//	generate
//		for (i=0; i<3; i=i+1)
//			begin: gmax
//			maxmux stage(x[i], y[i], cgreaterthan[0], cmax[i]);
//			end
//	endgenerate 
//
//	eightbitmux sauce (cequal, cgreaterthan, clessthan, cmax, op, z);	
//endmodule 
