// Module 4-bit MISR
module misr_4bit(
	input wire clk, 
	input wire rst, 
	input wire enable,
	input wire [3:0] adder_out,
	output reg [3:0] misr 
);
	always @(posedge clk or posedge rst) begin 
		if(rst) begin 
			misr <= 4'b0001; // Initial non-zero state
		end else if (enable) begin 
			misr <= {misr[2:0], misr[3]^adder_out[3]} ^ adder_out[2:0];
		end
	end 
endmodule 