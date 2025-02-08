`timescale 1ns/1ps
module tb_fsm_with_scan ();
	reg clk;
	reg rst;
	reg scan_en;
	reg scan_in;
	wire scan_out;
	wire [1:0] state;
	
	// Instantiate the DUT
	fsm_with_scan dut(.clk(clk),.rst(rst),.scan_en(scan_en),.scan_in(scan_in),.scan_out(scan_out),.state(state));
	
	// clock generator 
initial clk = 0;
always #5 clk = ~clk;

	// Test procedure 
initial begin 
	rst = 1; 
	scan_en = 0;
	scan_in = 0;
	
	#10 rst = 0; // Release reset after 10 ns
	
	// Test normal mode transitions
	$display("Testing Normal Mode Transitions");
	// IDLE to LOAD 
	$display("State: %b (Expected: 00 - IDLE", state);
	#10; // LOAD to PROCESS
	$display("State: %b (Expected: 01 - LOAD", state);
	#10; // PROCESS to IDLE 
	$display("State: %b (Expected: 11 - PROCESS", state);
	
	// Test scan chian functionality 
	$display("Testing Scan Chain");
	rst = 1;
	#10 rst = 0; 
	scan_en = 1; 
	
	// Shift in a pattern through the scan chain
	scan_in = 1; #10;
	scan_in = 0; #10;
	scan_in = 1; #10;
	scan_in = 1; #10;
	
	$display("Final Scan Chain State: %b", state);

	$stop;
end 

endmodule 