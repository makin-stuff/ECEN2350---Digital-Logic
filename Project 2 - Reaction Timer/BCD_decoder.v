module BCD_decoder(enable, val, disp);
	input enable;
	output reg [6:0]disp;	
	input [3:0] val;

always@*
	begin
		if (enable == 1)
			begin
				case(val)
					4'b0000: disp = 7'b1000000; // 0 or O
					4'b0001: disp = 7'b1111001; //1
					4'b0010: disp = 7'b0100100; //2
					4'b0011: disp = 7'b0110000; //3
					4'b0100: disp = 7'b0011001; //4
					4'b0101: disp = 7'b0010010; //5 or S
					4'b0110: disp = 7'b0000010; //6 or G
					4'b0111: disp = 7'b1111000; //7
					4'b1000: disp = 7'b0000000; //8 or B
					4'b1001: disp = 7'b0011000; //9

					4'b1010: disp = 7'b1111111; // space

					4'b1011: disp = 7'b1000001;// U
					4'b1100: disp = 7'b0001110; // F



				endcase
			end
	end

endmodule 