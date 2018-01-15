module gobuffs_decoder( val, disp);

	output reg [6:0]disp;
	input[3:0] val;

always@*


			begin
				case(val)
					4'b0000: disp = 7'b0000010; // G
					4'b0001: disp = 7'b1000000; //O
					4'b0010: disp = 7'b1111111; // space
					4'b0011: disp = 7'b0000000; // B
					4'b0100: disp = 7'b1000001;// U
					4'b0101: disp = 7'b0001110; // F
					4'b0110: disp = 7'b0010010; // S
				endcase
			end
	

endmodule 