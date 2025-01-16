`timescale 1ns/1ps
module tb_BIST_system();
	reg clk;
	reg rst;
	reg enable;
	wire pass;
	
	localparam NUM_CYCLES = 15; // Number of test cycles
	
	// Connect to the module BIST
	BIST_system dut (.clk(clk),.rst(rst),.enable(enable),.pass(pass));
	
	// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 10ns cycles 

	// Run the test 
initial begin 
	rst = 1;
	enable = 0;
	#10;
	rst = 0;
	
	// Check for no fault 
	$display("Test case 1: No faults");
	enable = 1;
	#(NUM_CYCLES * 10); // number of clock cycles 
	if(pass)	$display("Test case 1: PASS");
	else 		$display("Test case 1: FAIL");
	
	// Add stuck-at fault to Multiplier 
	inject_stuck_at_fault();
	
	// Reset BIST 
	rst = 1; 
	#10;
	rst = 0; 
	
	$display("Test case 2: Stuck-at fault");
	#(NUM_CYCLES*10); // number of clock cycles
	if(!pass) 	$display("Test case 2: PASS (Fault detected)");
	else 		$display("Test case 2: FAIL (Fault not detected)");
	
	enable = 0;
	#10; 
	$stop;
end 

	// Task: Inject Stuck-at fault 
	task inject_stuck_at_fault;
		begin 
			force dut.mul_inst.product[0] = 1'b1; // The first output bit of Multiplier be stuck-at-1;
		end
	endtask
	
endmodule 