// 40bit ALU withj Scan Chain (DFT)
module alu_scan(
	input wire [1:0] op_code, 	// Operation code
	input wire [3:0] A,			// First operand
	input wire [3:0] B, 		// Second operand
	input wire clk,				// Clock signal
	input wire rst,				// Active-low reset
	input wire scan_en,			// Scan mode enable 
	input wire scan_in, 		// Scan input 
	output reg [3:0] result, 	// ALU result output
	output wire scan_out		// Scan output 
);
	// wire for connecting
	wire [3:0] result_adder;
	wire [3:0] result_sub;
	wire [3:0] result_and;
	wire [3:0] result_or;
	wire adder_carry_out;
	
	// Operation 
	full_adder_4bit fa4bit(.A(A),.B(B),.c_in(1'b0),.c_out(adder_carry_out),.S(result_adder));
	sub_4bit sub4bit(.A(A),.B(B),.S(result_sub));
	and_4bit a4bit(.A(A),.B(B),.S(result_and));
	or_4bit o4bit(.A(A),.B(B),.S(result_or));	
	
	
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			state <= 4'b0; 	// Reset ALU result 
		end else if (scan_en) begin 
			// Scan mode: Shift left and input scan_in 
			result <= {result[2:0], scan_in};
		end else begin 
			// Normal mode: Perform ALU operations
			case (op_code) 
				2'b00: result <= result_adder;	// Addition
				2'b01: result <= result_sub;	// Subtraction
				2'b10: result <= result_and;	// AND
				2'b11: result <= result_or;		// OR
				default: result <= 4'b0; 		// Default case 
			endcase 
		end
	end 
	
	assign scan_out = result[3]; // MSB as scan output 
endmodule 


// 1-bit Full Adder 
module full_adder(
	input wire A,
	input wire B,
	input c_in,
	output wire c_out,
	output wire S
);
	assign S = A^B^c_in;
	assign c_out = (A&B)|(A&c_in)|(B&c_in);
 endmodule  
 
 // 4-bit Full Adder 
module full_adder_4bit(
	input wire [3:0] A,
	input wire [3:0] B,
	input wire c_in, 
	output wire c_out, 
	output wire [3:0] S
);
	wire [3:0] carry;
	full_adder fa0(.A(A[0]),.B(B[0]),.c_in(0),.c_out(carry[0]),.S(S[0]));
	full_adder fa1(.A(A[1]),.B(B[1]),.c_in(carry[0]),.c_out(carry[1]),.S(S[1]));
	full_adder fa2(.A(A[2]),.B(B[2]),.c_in(carry[1]),.c_out(carry[2]),.S(S[2]));
	full_adder fa3(.A(A[3]),.B(B[3]),.c_in(carry[2]),.c_out(carry[3]),.S(S[3]));
	
	assign c_out = carry[3];
endmodule 

// 4-bit Subtractor module 
module sub_4bit(
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [3:0] S
);
	wire [3:0] minusB;
	wire c_out;
	co2_4bit mB(.A(B),.S(minusB));
	full_adder_4bit fa4_sub(.A(A),.B(minusB),.c_in(1'b0),.c_out(c_cout),.S(S));
endmodule 

// Complementary of 2 for 4-bit
module co2_4bit(
	input wire [3:0] A,
	output wire [3:0] S
);
	wire [3:0] qA;
	wire c_out;
	not_4bit n4(.A(A),.qA(qA));
	full_adder_4bit fa4_co2(.A(qA),.B(4'b0001),.c_in(1'b0),.c_out(c_out),.S(S));
endmodule 

// Not 4 bit module 
module not_4bit(
	input wire [3:0] A,
	output wire [3:0] qA
);
	assign qA[0] = ~A[0];
	assign qA[1] = ~A[1];
	assign qA[2] = ~A[2];
	assign qA[3] = ~A[3];
endmodule

// 4-bit AND module 
module and_4bit(
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [3:0] S
);
	assign S[0] = A[0]&B[0];
	assign S[1] = A[1]&B[1];
	assign S[2] = A[2]&B[2];
	assign S[3] = A[3]&B[3];
endmodule 

// 4-bit OR module 
module or_4bit(
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [3:0] S
);
	assign S[0] = A[0]|B[0];
	assign S[1] = A[1]|B[1];
	assign S[2] = A[2]|B[2];
	assign S[3] = A[3]|B[3];
endmodule 	