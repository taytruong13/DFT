// Module 3-input AND gate system
module AND_gate_system(
	input [3:0] lfsr,
	output and_out
);
	assign and_out = lfsr[2] & lfsr[1] & lfsr [0]; // use LSBs of LFSR as inputs to AND gate. 
endmodule 
