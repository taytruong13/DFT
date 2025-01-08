`timescale 1ns/1ps
module tb_shift_register_scan();
	reg clk;
	reg data_in;
	reg rst;
	reg scan_en; 
	reg scan_in;
	wire data_out;
	wire scan_out;
	
	// Instantiate the DUT 
	shift_register_scan dut(.clk(clk),.data_in(data_in),.rst(rst),.scan_en(scan_en),
							.scan_in(scan_in),.data_out(data_out),.scan_out(scan_out));
	
	// Clock generation
always #5 clk = ~clk;
	
	// Test 
initial begin
	// Initialize signals
	clk = 0;
	rst = 0;
	scan_en = 0;
	data_in = 0;
	scan_in = 0;
	
	// Apply reset
	#10 rst = 1; // Release reset after 10 ns
	
	// Normal mode operation
	scan_en = 0; 
	#10 data_in = 1; 
	#10 data_in = 0; 
	#10 data_in = 1;
	#10 data_in = 1;
	
	// Scan mode operation 
	#10 scan_en = 1;
	#10 scan_in = 1;
	#10 scan_in = 0;
	#10 scan_in = 1;
	#10 scan_in = 0;
	
	// Finish simulation 
	#50 $stop;
end 

	// Monitor outputs 
initial begin
	$monitor("T=%3d | clk=%b | rst=%b | scan_en=%b | data_in=%b | scan_in=%b | shift_reg[3:0]=%b | scan_out=%b", $time, 
                 clk, rst, scan_en, data_in, scan_in, dut.shift_reg, scan_out);
end 

endmodule 