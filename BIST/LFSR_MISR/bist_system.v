// Top-level Module: BIST System
module bist_system(
	input wire clk, 
	input wire rst, 
	input wire enable,
	output [7:0] lfsr_out,
	output [3:0] misr_out
);
	wire [3:0] adder_A;
	wire [3:0] adder_B;
	wire [3:0] adder_S;
	
	// Instantiate 8-bit LFSR 
	lfsr_8bit lfsr_inst(.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr_out));
	
	// Connect LFSR output to Adder inputs
	assign adder_A = lfsr_out[7:4];
	assign adder_B = lfsr_out[3:0];
	
	// Instantiate 4-bit Adder 
	adder_4bit adder_inst(.A(adder_A),.B(adder_B),.S(adder_S));
	
	// Instantiate 4-bit MISR
	misr_4bit misr_inst(.clk(clk),.rst(rst),.enable(enable),.adder_out(adder_S),.misr(misr_out));

endmodule 
