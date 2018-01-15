module mux(bcdsevenseg, bsevenseg, highscoresevenseg, state, switch, sevenseg);
	input switch;
	input [6:0] bcdsevenseg;
	input [6:0] bsevenseg;
	input [6:0] highscoresevenseg;
	input [1:0] state;
	output reg [6:0] sevenseg;
	
	always @ *
		begin
			if (switch == 1)
				begin
					sevenseg = highscoresevenseg;
				end
				
			else
				begin
					case (state)
						0:
							sevenseg = bsevenseg;
						1:
							sevenseg = 7'b1111111;
						2:
							sevenseg = bcdsevenseg;
						3:
							sevenseg = bcdsevenseg;
					endcase
				end
		end
endmodule
	