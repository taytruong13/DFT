`timescale 1ns/1ps
module tb_counter_scan();
	reg clk;
	reg rst;
	reg enable;
	reg scan_en;
	reg scan_in;
	wire [7:0] count_out;
	wire scan_out; 
	
	// Instantiate the DUT 
	counter_scan dut(.clk(clk),.rst(rst),.enable(enable),.scan_en(scan_en),
					.scan_in(scan_in),.count_out(count_out),.scan_out(scan_out));
	
	// Clock generate
always #5 clk = ~clk;

	// Test procedure 
initial begin 
	clk = 0;
	// Initialize signals
	rst = 0;
	enable = 0;
	scan_en = 0;
	scan_in = 0;
	
	// Apply rst 
	#10 rst = 1; // Release reset after 10 ns 
	
	// Normal counter mode 
	enable = 1;
	#200;
	
	// Scan mode: Load a pattern
	enable = 0;
	scan_en = 1;
	scan_in = 1; #10;
	scan_in = 0; #10;
	scan_in = 1; #10;
	scan_in = 1; #10;
	scan_in = 0; #10;
	scan_in = 0; #10;
	scan_in = 1; #10;
	scan_in = 1; #10;
	scan_en = 0;
	
	// Finish simulation
	#10 $stop;
end 

	// Monitor outputs
initial begin 
	$monitor("T=%3d clk=%b rst=%b enable=%b scan_en=%b scan_in=%b count_out=%b scan_out=%b",
						$time, clk, rst, enable, scan_en, scan_in, count_out, scan_out);
end
	
endmodule