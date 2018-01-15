module Project1(HEXA, HEXB, LED, SW, BUT);
	input [9:0]SW;
	input	[1:0]BUT;
	output reg [9:0]LED;
	output [6:0]HEXA;
	output [6:0]HEXB;
	
	//Wires for comparison
	wire equal;
	wire greater;
	wire less;
	
	//Module outputs
	wire [7:0]logical_out;
	wire [7:0]arithmetic_out;
	wire carry;
	wire [7:0]compare_out;
	wire [7:0]segwire;
	
	//Module instantiation
	logical marinara(SW[3:0],SW[7:4],SW[9:8],logical_out);
	Compare2 alfredo(SW[3:0],SW[7:4],SW[9:8],compare_out, equal, greater, less);
	arithmetic pesto(SW[3:0],SW[7:4],SW[9:8],arithmetic_out, carry);
	
	//Multiplexer
	eightbitmux supersaucy (arithmetic_out, logical_out, compare_out, 8'b00000000, BUT, segwire);
	
	//7-seg displays instantiation
	segdisplay u1(HEXA,segwire[3:0]);
	segdisplay u2(HEXB,segwire[7:4]);
	
	wire light;
	onebitmux(carry, 0, 0, 0, BUT, light);
	
	//Carry LED instantiation
	always @ (light)
		begin
		LED[9] = light;
		end
	
endmodule
		
		
		