// Module: 4-bit LFSR
// Feedback using XOR with taps at [4, 1]
module lfsr_4bit(
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [3:0] lfsr
);
	always @(posedge clk or posedge enable) begin
		if(rst) begin
			lfsr <= 4'b0001; // Initial non-zere state
		end else if (enable) begin 
			lfsr <= {lfsr[2:0], lfsr[3]^lfsr[0]};
		end 
	end
endmodule
