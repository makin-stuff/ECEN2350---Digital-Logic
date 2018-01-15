module greaterthan(x,y,z);
	input [3:0]x;
	input [3:0]y;
	output reg z;
	
	always @ (x,y)
	begin: bob
		if (x[3]>y[3])
			begin
			z = 1'b1;
			end
		else if (x[3] == y[3])
			begin
			if (x[2]>y[2])
				begin
				z = 1'b1;
				end
			
			else if (x[2] == y[2])
				begin
				if (x[1]>y[1])
					begin
					z = 1'b1;
					end
			
				else if (x[1] == y[1])
					begin
					if (x[0]>y[0])
						begin
						z = 1'b1;
						end
					end
				end
			end
		else 
			begin
			z = 1'b0;
			end
	end 
endmodule 