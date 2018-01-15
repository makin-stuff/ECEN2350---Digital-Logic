module segdisplay(HEXB,SW);
output reg[6:0]HEXB;
input [3:0]SW;

//7-segment assignments
always @* 
	begin
		case(SW)
			4'b0000: HEXB = 7'b1000000;// Hexadecimal 0
			4'b0001: HEXB = 7'b1111001;// Hexadecimal 1
			4'b0010: HEXB = 7'b0100100;// Hexadecimal 2
			4'b0011: HEXB = 7'b0110000;// Hexadecimal 3
			4'b0100: HEXB = 7'b0011001;// Hexadecimal 4
			4'b0101: HEXB = 7'b0010010;// Hexadecimal 5
			4'b0110: HEXB = 7'b0000010;// Hexadecimal 6
			4'b0111: HEXB = 7'b1111000;// Hexadecimal 7
			4'b1000: HEXB = 7'b0000000;// Hexadecimal 8
			4'b1001: HEXB = 7'b0011000;// Hexadecimal 9
			4'b1010: HEXB = 7'b0001000;// Hexadecimal A
			4'b1011: HEXB = 7'b0000011;// Hexadecimal B
			4'b1100: HEXB = 7'b1000110;// Hexadecimal C
			4'b1101: HEXB = 7'b0100001;// Hexadecimal D
			4'b1110: HEXB = 7'b0000110;// Hexadecimal E
			4'b1111: HEXB = 7'b0001110;// Hexadecimal F  
		endcase 
	end
endmodule 