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
	localparam PROCESS = 2'b11;
	
	// State transition 
	always @(posedge clk or posedge rst) begin 
		if(rst) begin 
			state <= IDLE;
		end else if(scan_en) begin 
			state <= {state[0], scan_in};
		end else begin 
			case (state)
				IDLE: state <= LOAD;
				LOAD: state <= PROCESS;
				PROCESS: state <= IDLE;
				default: state <= IDLE;
			endcase 
		end
	end 

	assign scan_out = state[1];
endmodule 