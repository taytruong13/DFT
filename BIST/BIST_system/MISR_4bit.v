module MISR_4bit(
	input wire clk,
	input wire rst,
	input wire enable,
	input wire [3:0] data_in,
	output reg [3:0] misr_out
);
	always @(posedge clk or posedge rst) begin 
		if (rst) 
			misr_out <= 4'b0001; // Initial non-zero state
		else if(enable) 
			misr_out <= {misr_out[2:0], misr_out[3]^misr_out[0]} ^ data_in; // update misr 
	end
endmodule
			