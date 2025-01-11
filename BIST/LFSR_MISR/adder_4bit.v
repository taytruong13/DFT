// Module 4-bit Adder 
module adder_4bit(
	input wire [3:0] A,
	input wire [3:0] B, 
	output [3:0] S
);
	assign S =  A + B; 
endmodule 