`timescale 1ns/1ps

module tb_DFF_ScanChain;
	reg clk;
	reg D;
	reg rst;
	reg scan_en;
	reg scan_in;
	wire Q;
	wire scan_out;
	
	// Instantiate the DUT 
	DFF_ScanChain uut(.clk(clk),.D(D),.rst(rst),.scan_en(scan_en),.scan_in(scan_in),.Q(Q),.scan_out(scan_out));
	
	// Clock generation
always #5 clk = ~clk;

initial begin
	clk = 0;
	// initialize inputs
	D = 0;
	rst = 0;
	scan_en = 0;
	scan_in = 0;
	
	// Apply reset
	#10 rst = 1; // Release reset after 10 ns
	
	// Test normal operation
	#10 D = 1; // Apply data input
	#10 D = 0; // change data input 
	#10 D = 1;
	
	// Test scan mode
	#10 scan_en = 1; scan_in = 1; // Enable scan mode and input scan data
	#10 scan_in = 0;
	#10 scan_in = 1;
	
	// Test returning to normal mode
	#10 scan_en = 0; D = 0;
	#10 D = 1;
	
	// End simulation
	#50 $stop;
end

	// Monitor signals
initial begin
	$monitor("Time=%5d | D=%b | rst=%b | scan_en=%b | scan_in=%b | Q=%b | scan_out=%b",
			$time, D, clk, rst, scan_en, scan_in, Q, scan_out);
end

endmodule