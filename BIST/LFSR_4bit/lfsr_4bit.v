// Module 4-bit LFSR (Linear Feedback Shift Register) with taps at [4, 1]
module lfsr_4bit(
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [3:0] lfsr
);
	always @(posedge clk or posedge rst) begin 
		if(rst) begin 
			lfsr <= 4'b0001; // Initial non-zero state 
		end else begin
			lfsr <= {lfsr[2:0], lfsr[3]^lfsr[0]}; // Feedback using XOR
		end
	end
endmodule