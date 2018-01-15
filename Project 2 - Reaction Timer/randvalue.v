module randvalue(clock1k, state ,randval);
	input clock1k;
	output reg [9:0]randval;
	input [1:0]state;
	
//	always @ (state, posedge clock1k)
//		begin
//			case (state)
//				1: randval; //randval is held at state 1 (the wait state)
//				default :
//						randval = randval + 1;
//			endcase
//		end
endmodule
		