module fsm_with_scan(
	input wire clk,
	input wire rst,
	input wire scan_en,
	input wire scan_in,
	output wire scan_out,
	output reg [1:0] state
);

	// State encoding
	localparam IDLE = 2'b00;
	localparam LOAD = 2'b01;
	localparam PROCESS = 2'b10;
	
	reg [1:0] next_state;
	
	// State transition logic (combinational)
always @(*) begin 
	if(!scan_en) begin
		case (state)
			IDLE: next_state = LOAD; // Example transition from IDLE to LOAD 
			LOAD: next_state = PROCESS; // Example transition from LOAD to PROCESS 
			PROCESS: next_state = IDLE; // Example transition from PROCESS to IDLE 
			default: next_state = IDLE; // Default state 
		endcase
	end else begin 
		next_state = state; // Maintain current state in scan mode 
	end
end 
	
	// State update logic (sequential) 
always @(posedge clk or posedge rst) begin 
	if(rst) begin 
		state <= IDLE; // Reset to IDLE state 
	end else if (!scan_en) begin 
		state <= next_state; // Update state in normal mode 
	end else begin 
		// shift state bits in scan mode 
		state <= {state[0], scan_in};
	end
end 

	// Assign scan output (MSB of scan_register) 
	assign scan_out = state[1];
endmodule 