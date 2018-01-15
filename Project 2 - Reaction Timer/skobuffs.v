module skobuffs(enable, clock, displaystate, disp0, disp1, disp2, disp3, disp4, disp5 );
	input clock;
	input enable;
	output reg [3:0]disp0;
	output reg [3:0]disp1;
	output reg [3:0]disp2;
	output reg [3:0]disp3;
	output reg [3:0]disp4;
	output reg [3:0]disp5;
	
	
	output reg [3:0]displaystate;
	initial displaystate = 0;
	
	always @ (posedge clock)
		begin
			if (enable == 1)
				begin
					displaystate = displaystate+1;
						case (displaystate)
							0:
								begin
								disp0 = 6;
								disp1 = 10;
								disp2 = 10;
								disp3 = 10;
								disp4 = 10;
								disp5 = 10;
								end
							1:
								begin
								disp0 = 0;
								disp1 = 6;
								disp2 = 10;
								disp3 = 10;
								disp4 = 10;
								disp5 = 10;
								end
							2:
								begin
								disp0 = 10;
								disp1 = 0;
								disp2 = 6;
								disp3 = 10;
								disp4 = 10;
								disp5 = 10;
								end
							3:
								begin
								disp0 = 8;
								disp1 = 10;
								disp2 = 0;
								disp3 = 6;
								disp4 = 10;
								disp5 = 10;
								end
							4:
								begin
								disp0 = 11;
								disp1 = 8;
								disp2 = 10;
								disp3 = 0;
								disp4 = 6;
								disp5 = 10;
								end
							5:
								begin
								disp0 = 12;
								disp1 = 11;
								disp2 = 8;
								disp3 = 10;
								disp4 = 0;
								disp5 = 6;
								end
							6:
								begin
								disp0 = 12;
								disp1 = 12;
								disp2 = 11;
								disp3 = 8;
								disp4 = 10;
								disp5 = 0;
								end
							7:
								begin
								disp0 = 5;
								disp1 = 12;
								disp2 = 12;
								disp3 = 11;
								disp4 = 8;
								disp5 = 10;
								end
							8:
								begin
								disp0 = 10;
								disp1 = 5;
								disp2 = 12;
								disp3 = 12;
								disp4 = 11;
								disp5 = 8;
								end
							9:
								begin
								disp0 = 10;
								disp1 = 10;
								disp2 = 5;
								disp3 = 12;
								disp4 = 12;
								disp5 = 11;
								end
							10:
								begin
								disp0 = 10;
								disp1 = 10;
								disp2 = 10;
								disp3 = 5;
								disp4 = 12;
								disp5 = 12;
								end
							11:
								begin
								disp0 = 10;
								disp1 = 10;
								disp2 = 10;
								disp3 = 10;
								disp4 = 5;
								disp5 = 12;
								end
							12:
								begin
								disp0 = 10;
								disp1 = 10;
								disp2 = 10;
								disp3 = 10;
								disp4 = 10;
								disp5 = 5;
								end
							default:
								displaystate = 0;
						endcase
			end
			end
			
		endmodule 
				