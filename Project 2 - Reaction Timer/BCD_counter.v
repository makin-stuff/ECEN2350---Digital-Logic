module BCD_counter (clock1k,dig0,dig1,dig2,dig3);
	input clock1k;
	
	output reg [3:0]dig0;
	output reg [3:0]dig1;
	output reg [3:0]dig2;
	output reg [3:0]dig3;
	//output counterstate;
	
	always @ (posedge clock1k)
		begin
			if(dig0 == 9)
				begin
					dig0 = 0;
					dig1 = dig1 + 1;
					if (dig1 == 9)
						begin
							//dig0 = 0;
							dig1 = 0;
							dig2 = dig2 + 1;
							if (dig2 == 9)
								begin
									//dig0 = 0;
									//dig1 = 0;
									dig2 = 0;
									dig3 = dig3 + 1;
									if (dig3 == 9)
										begin
											//dig0 = 0;
											//dig1 = 0;
											//dig2 = 0;
											dig3 = 0;
										end
								end
						end
				end
			else
				dig0 = dig0 + 1;
		end
endmodule