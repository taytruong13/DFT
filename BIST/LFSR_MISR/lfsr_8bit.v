module lfsr_8bit(
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [7:0] lfsr
);
	always @(posedge clk or posedge rst) begin 
		if(rst) begin
			lfsr <= 8'b0000_0001; // Initial non-zero state
		end else if(enable) begin 
			// Feedback using XOR with taps at [8, 6]
			lfsr <= {lfsr[6:0], lfsr[7]^lfsr[5]}; 
		end 
	end
endmodule 