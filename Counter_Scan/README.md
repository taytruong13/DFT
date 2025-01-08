# 8-bit Synchronous Counter with Scan Chain Specification

This document specifies the design of an 8-bit synchronous counter with scan chain functionality. The counter supports normal counting operation and allows scan chain testing for reading or loading the counter state.

---

## Functional Description
The counter operates in two modes:

1. **Normal Mode**: The counter increments its value by 1 on every rising edge of the clock (`clk`) when `enable` is asserted.
2. **Scan Mode**: When `scan_enable` is active, the counter operates as a shift register for testing purposes, allowing the state to be read or written through the scan chain using `scan_in` and `scan_out`.

An asynchronous active-low reset (`reset`) is provided to reset the counter value to `0`.

---

## I/O Signals

| Signal        | Direction | Width | Description     |
|:-------------:|:---------:|:-----:|-----------------|
| `clk`         | Input     | 1     | Clock signal. The counter updates on the rising edge.   |
| `reset`       | Input     | 1     | Asynchronous active-low reset. Resets the counter to `0`.   |
| `enable`      | Input     | 1     | Enables counting when set to `1`.   |
| `count_out`   | Output    | 8     | Current value of the counter in normal operation.   |
| `scan_enable` | Input     | 1     | Enables scan mode when set to `1`. |
| `scan_in`     | Input     | 1     | Scan input for scan mode operation. |
| `scan_out`    | Output    | 1     | Scan output. Passes the most significant bit of the counter in scan mode.|

---

## Functional Behavior

### Reset Behavior
- When `reset` is asserted (`reset = 0`):
  - The counter value is reset to `0`, regardless of other signals.
- When `reset` is deasserted (`reset = 1`):
  - The counter operates normally, either incrementing or shifting data based on the mode.

### Normal Mode
- Condition: `scan_enable = 0`
- Behavior:
  - If `enable = 1`, the counter increments by 1 on every rising edge of `clk`.
  - If `enable = 0`, the counter holds its current value.

### Scan Mode
- Condition: `scan_enable = 1`
- Behavior:
  - On every rising edge of `clk`, the counter shifts its state left by one bit.
  - The new data is loaded into the least significant bit (LSB) from `scan_in`.
  - The most significant bit (MSB) is passed to `scan_out`.

---
## RTL Design code (in Verilog)
```
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
```
## Testbench
```
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
```
## Simulation on ModelSim
<img src="media/counter.pgn"/>
