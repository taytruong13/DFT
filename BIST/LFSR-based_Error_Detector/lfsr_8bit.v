module LFSR_8bit(
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [7:0] lfsr
);
	always @(posedge clk or posedge rst) begin 
		if(rst)
			lfsr <= 8'b0000_0001;
		else if(enable)
			lfsr <= {lfsr[6:0], lfsr[7]^lfsr[5]}; // XOR Taps at [8, 6]
	end
endmodule