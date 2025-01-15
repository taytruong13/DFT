module comparator(
	input wire [3:0] actual_signature,
	input wire [3:0] expected_signature,
	output reg pass_fail
);
	assign pass_fail = (actual_signature == expected_signature) ? 1'b1 : 1'b0;
endmodule	