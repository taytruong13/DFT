module BIST_system(
	input wire clk, 
	input wire rst,
	input wire enable,
	output wire pass
);

	wire [7:0] lfsr_data;
	wire [7:0] multiplier_out;
	wire [3:0] misr_out;
	wire [3:0] expected_signature = 4'b1010; // e.g
	
	LFSR_8bit lfsr_inst (.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr_data));
	multiplier_4bit mul_inst (.a(lfsr_data[3:0]),.b(lfsr_data[7:4]),.product(multiplier_out));
	MISR_4bit misr_inst (.clk(clk),.rst(rst),.enable(enable),.data_in(multiplier_out[7:4]^multiplier_out[3:0]),.misr_out(misr_out));
	comparator comp_inst (.actual_signature(misr_out),.expected_signature(expected_signature),.pass(pass));
	
endmodule
	