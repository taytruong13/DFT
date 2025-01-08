module counter_scan(
	input wire clk, 		// Clock signal
	input wire rst,			// Active-low reset
	input wire enable,		// Enable signal for normal counter 
	input wire scan_en, 	// Scan mode enable
	input wire scan_in,		// Scan input 
	output reg [7:0] count_out, // 8-bit counter output 
	output wire scan_out	// Scan output
);

	// Internal 8-bit register
	reg [7:0] counter; 

always @(posedge clk or negedge rst) begin 
	if(!rst) begin 
		counter <= 8'b0; 	// Reset counter to 0
	end else if(scan_en) begin
		// Scan mode: Shift left and input scan_in
		counter <= {counter[6:0], scan_in};
	end else if (enable) begin 
		// Normal mode: Increment counter 
		counter <= counter + 1;
	end
end 

	// Output assignments
	assign count_out = counter;
	assign scan_out = counter[7]; // MSB as scan output 

endmodule
		
	