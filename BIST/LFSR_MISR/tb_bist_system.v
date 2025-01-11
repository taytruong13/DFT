`timescale 1ns/1ps
module tb_bist_system();
	reg clk;
	reg rst;
	reg enable;
	wire [7:0] lfsr_out;
	wire [3:0] misr_out;
	
	// Instantiate the BIST system
	bist_system bist_inst(.clk(clk),.rst(rst),.enable(enable),.lfsr_out(lfsr_out),.misr_out(misr_out));
	
	// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 10ns clock period 

	// Test sequence
initial begin 
	$display("Time Reset Enable	LFSR_out  A    B    MISR_out");
	$monitor("%4d   %b     %b    %b %b %b   %b", $time, rst, enable, lfsr_out, lfsr_out[7:4], lfsr_out[3:0], misr_out);
	
	// Initialize signals
	rst = 1;
	enable = 0;
	
	#10;
	rst  = 0;
	enable = 1;
	
	// Run the system for 20 clock cycles
	#200;
	
	// Finish the simulation 
	$stop;
end 
endmodule 