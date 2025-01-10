`timescale 1ns/1ps

// Testbench for LFSR 4-bit
module tb_lfsr_4bit();
	reg clk; 
	reg rst;
	reg enable;
	wire [3:0] lfsr;
	
	// Initialize the LFSR module 
	lfsr_4bit uut(.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr));
	
	// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 10ns clock Period

	// Test sequence
initial begin
	$display("Time Reset Enable LFSR");
	$monitor("%3d    %b     %b    %b", $time, rst, enable, lfsr);
	
	// Initialize signals
	rst = 1;
	enable = 0;
	
	#10;
	rst = 0;
	enable = 1;
	
	// Run LFSR for 16 clock cycles
	#160;
	
	// Finish simulation
	$stop;
end 
endmodule 