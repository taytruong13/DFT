`timescale 1ns/1ps
module tb_alu_scan();
	reg [1:0] op_code;
	reg [3:0] A;
	reg [3:0] B;
	reg clk;
	reg rst;
	reg scan_en;
	reg scan_in;
	wire [3:0] result;
	wire scan_out;
	
	// Instantiate the DUT 
	alu_scan dut(.op_code(op_code),.A(A),.B(B),.clk(clk),.rst(rst),
				.scan_en(scan_en),.scan_in(scan_in),.result(result),.scan_out(scan_out));
	// Clock generation
initial clk = 0;
always #5 clk = ~clk;

	// Task to check result and display pass/fail
	task check_result;
		input [3:0] expected_result;
		input [3:0] actual_result;
		input [7:0] operation; 
		begin 
			if(expected_result == actual_result) begin 
				$display("%s: PASS (Expected=%b, Actual=%b)", operation, expected_result, actual_result);
			end else begin
				$display("%s: FAIL (Expected=%b, Actual=%b)", operation, expected_result, actual_result);
			end
		end 
	endtask 
	
	// Test Procedure
initial begin 
	clk = 0;
	// Initialize signals 
	rst = 0;
	scan_en = 0;
	scan_in = 0;
	A = 4'b0000;
	B = 4'b0000;
	op_code = 2'b00;
	
	// Apply reset 
	#10 rst = 1; // Release Reset after 10ns 
	#10;
	
	// Test Normal operations 
	$display("Testing Normal Operations");
	
	// Test addition
	op_code = 2'b00; // Addition
	A = 4'b0011; // 3
	B = 4'b0101; // 5
	#10 check_result(4'b1000, result, "ADD"); // Sum = 8
		
	// Test Subtraction 
	op_code = 2'b01; // Subtraction 
	A = 4'b1000; // 8
	B = 4'b0011; // 3
	#10 check_result(4'b0101, result, "SUB"); // sub = 5
	
	// Test AND 
	op_code = 2'b10; // AND 
	A = 4'b1100;
	B = 4'b1010;
	#10 check_result(4'b1000, result, "AND");
	
	// Test OR 
	op_code = 2'b11; // OR 
	A = 4'b0101; 
	B = 4'b0011;
	#10 check_result(4'b0111, result, "OR");
	
	
	// Test sacn chain functionality 
	$display("Testing Scan Chain");
	#10 rst = 0;
	#10 rst = 1;
	scan_en = 1;
	
	// Shift in a pattern through scan chain 
	scan_in = 1; #10; 
	scan_in = 0; #10;
    scan_in = 1; #10;
    scan_in = 1; #10;
	
	// Observe scan_out 
	check_result(4'b1011, result, "SC");
	
	// Finish simulation 
	$stop;
 endmodule