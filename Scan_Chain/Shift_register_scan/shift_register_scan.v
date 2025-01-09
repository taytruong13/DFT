module shift_register_scan(
	input wire clk, 		// Clock signal
	input wire data_in,		// Data input for normal operation
	input wire rst, 		// Asynchronous active-low reset
	input wire scan_en,		// Enables scan mode
	input wire scan_in, 	// Scan input 
	output reg data_out, 	// Data ouput for normal operation
	output reg scan_out		// Scan output 
);
	// Internal 4-bit register
	reg [3:0] shift_reg;

	// Scan output is simply the data_out value
	assign scan_out = data_out;
	// Assign the MSB to data_out
	assign data_out = shift_reg[3];

	
always @(posedge clk or negedge rst) begin
	if(!rst) begin 
		// Reset all bits to 0
		shift_reg <= 4'b0;
	end else if(scan_en) begin 
		// Scan mode: shift in scan_in 
		shift_reg <= {shift_reg[2:0], scan_in};
	end else begin 
		// Normal mode: shift in data_in 
		shift_reg <= {shift_reg[2:0], data_in};
	end
end 

endmodule 
