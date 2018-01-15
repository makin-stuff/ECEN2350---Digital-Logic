module countdown  (enable, clock1k, zero, count);

	input clock1k;
	input enable;
	output reg [11:0] count;
		
	wire [11:0] Q;
	output zero;
	
	LSRF rando (clock1k, Q);
		
		always @ (posedge clock1k)
			begin	
			if (enable == 0)
				begin
					count <= Q;
				end
			else if(count > 0)
				begin
					count <= count - 1;

				end
			end
	assign zero = (count==0);
endmodule 