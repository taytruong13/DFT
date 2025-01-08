module DFF_ScanChain(
	input wire clk,
	input wire D,
	input wire rst,			// Active low reset
	input wire scan_en,		// Enable scan mode
	input wire scan_in, 	// scan input 
	output reg Q,			// normal output
	output wire scan_out	// Scan output
);

	// Scan output is simply the Q value 
	assign scan_out = Q;
	
	always @(posedge clk or negedge rst) begin
		if(!rst) begin	
			Q <= 1'b0;	// Reset the output to 0
		end else if(scan_en) begin
			Q <= scan_in; // Scan mode: capture scan_in 
		end else begin 
			Q <= D; 	// normal mode: capture D 
		end 
	end 
endmodule
