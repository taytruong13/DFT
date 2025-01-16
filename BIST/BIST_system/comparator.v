module comparator(
	input wire [3:0] actual_signature,
	input wire [3:0] expected_signature,
	output wire pass
);
	assign pass = (actual_signature == expected_signature) ? 1'b1 : 1'b0;
endmodule	