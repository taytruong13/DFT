module XOR_4bit(
	input wire [3:0] in1,
	input wire [3:0] in2,
	output wire [3:0] out
);
	assign out = in1 ^ in2;
endmodule