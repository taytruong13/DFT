`timescale 1ns/1ps
// Testbench for LFSR-based test system 
module tb_lfsr_4bit_AND();
	reg clk;
	reg rst;
	reg enable;
	wire [3:0] lfsr;
	wire and_out;
	
	// Instantiate the LFSR module 
	lfsr_4bit lfsr_inst(.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr));
	
	// Instantiate the AND gate system 
	AND_gate_system AND_inst(.lfsr(lfsr),.and_out(and_out));
	
	// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 10ns clock period

	// Test sequence
initial begin 
	$display("Time Reset Enable LFSR AND_output");
	$monitor("%3d    %b     %b    %b    %b", $time, rst, enable, lfsr, and_out);
	
	// Initialize signals
	rst = 1;
	enable = 0;
	
	#10; 
	rst = 0;
	enable = 1;
	
	// Run system for 15 clock cycles
	#150;
	
	// Finish Simulation
	$stop;
end
endmodule 