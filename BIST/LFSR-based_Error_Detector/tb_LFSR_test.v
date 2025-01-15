`timescale 1ns/1ps
module tb_LFSR_test();
	reg clk;
	reg rst;
	reg enable;
	wire [7:0] lfsr;
	wire [3:0] xor_out;
	wire [3:0] misr_out;
	wire pass_fail;
	
	reg [3:0] data_check;
	
	// Instantiate Modules
	LFSR_8bit lfsr_inst (.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr));
	XOR_4bit xor_inst (.in1(lfsr[3:0]),.in2(data_check),.out(xor_out));
	MISR_4bit misr_inst (.clk(clk),.rst(rst),.enable(enable),.data_in(xor_out),.misr_out(misr_out));
	comparator comp_inst (.actual_signature(misr_out),.expected_signature(4'b1111),.pass_fail(pass_fail));

	
	// Clock generation 
initial clk = 0;
always #5 clk = ~clk;

initial begin 
	// Initialize 
	rst = 1;
	enable = 0;
	data_check = 0;
	#10 rst = 0;
	
	// Test case 1: no error
	enable = 1;
	repeat (10) @(lfsr) data_check = lfsr[7:4];
	$display("Test case 1: No Error Found - Pass/Fail: %b", pass_fail);
	
	// Test case 2: with error (stock-at zero) 
	#10;
	enable = 0;
	rst = 1;
	#10 rst = 0;
	// Add the error of stuck-at to XOR gate (e.g fix an input with 4'b0
	enable = 1;
	data_check = 4'b0000;
	#100;
	$display("Test case 2: With Errow - Pass/Fail: %b", pass_fail);
	
	$stop;
end 
endmodule