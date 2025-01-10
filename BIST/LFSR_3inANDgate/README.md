# **Specification: 4-bit LFSR-based Test System**

## **Overview**
This test system uses an 4-bit Linear Feedback Shift Register (LFSR) to generate pseudo-random test vectors. These vectors are used as inputs for a simple **3-input AND gate** to verify its logic functionality. The system combines random vector generation with logical verification in a compact and efficient design.

---

## **Features**
- **Modules**:
  - **4-bit LFSR**:
     - Generates pseudo-random 4-bit sequences based on feedback logic.
     - Tap positions are at [4, 1].
  - **3-input AND Gate System**:
     - Uses the 3 least significant bits (LSBs) of the LFSR as inputs.
     - Computes the logical AND of these inputs.
- **Input Signals**:
  - `clk`: Clock signal to synchronize LFSR.
  - `rst`: Asynchronous reset to initialize the LFSR.
  - `enable`: Enables or disables the LFSR operation.

- **Output Signals**:
  - `lfsr [7:0]`: Current 4-bit state of the LFSR.
  - `and_out`: Output of the 3-input AND gate.

---

## **Functional Description**
1. **LFSR Operation**:
   - On reset, the LFSR initializes to `4'b0001`.
   - On each clock cycle (if enabled), the LFSR shifts all bits to the right.
   - The new least significant bit (LSB) is computed as `lfsr[3] XOR lfsr[0]`.

2. **AND Gate Functionality**:
   - The inputs to the AND gate are `lfsr[2]`, `lfsr[1]`, and `lfsr[0]` (3 LSBs of the LFSR output).
   - The output is high (`1`) only when all three inputs are high.

---
## RTL Design Code (in Verilog)
```Verilog
// Module: 4-bit LFSR
// Feedback using XOR with taps at [4, 1]
module lfsr_4bit(
	input wire clk,
	input wire rst,
	input wire enable,
	output reg [3:0] lfsr
);
	always @(posedge clk or posedge enable) begin
		if(rst) begin
			lfsr <= 4'b0001; // Initial non-zere state
		end else begin 
			lfsr <= {lfsr[2:0], lfsr[3]^lfsr[0]};
		end 
	end
endmodule

// Module 3-input AND gate system
module AND_gate_system(
	input [3:0] lfsr,
	output and_out
);
	assign and_out = lfsr[2] & lfsr[1] & lfsr [0]; // use LSBs of LFSR as inputs to AND gate. 
endmodule 
```
## **Testbench**
A testbench is provided to validate the functionality of the LFSR-based test system.
```Verilog
`timescale 1ns/1ps
// Testbench for LFSR-based test system 
module tb_lfsr_4bit_AND();
	reg clk;
	reg rst;
	reg enable;
	wire [3:0] lfsr;
	wire and_out;
	
	// Instantiate the LFSR module 
	lfsr_4bit lfsr_inst(.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr));
	
	// Instantiate the AND gate system 
	AND_gate_system AND_inst(.lfsr(lfsr),.and_out(and_out));
	
	// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 10ns clock period

	// Test sequence
initial begin 
	$display("Time Reset Enable LFSR AND_output");
	$monitor("%3d    %b     %b    %b    %b", $time, rst, enable, lfsr, and_out);
	
	// Initialize signals
	rst = 1;
	enable = 0;
	
	#10; 
	rst = 0;
	enable = 1;
	
	// Run system for 15 clock cycles
	#150;
	
	// Finish Simulation
	$stop;
end
endmodule 
```
### Testbench Features
1. **Reset Initialization**:
   - Asserts `rst` to initialize the LFSR.

2. **Sequence Generation**:
   - Runs the LFSR for 20 clock cycles with `enable` asserted.

3. **State Monitoring**:
   - Displays the LFSR state and AND gate output at each clock cycle.
   - Captures pseudo-random test vectors and their corresponding outputs.
   - 
## **Usage**
**Instantiation**: Include both the LFSR module and the AND gate system in your design.

```verilog
    lfsr_4bit lfsr_inst(.clk(clk),.rst(rst),.enable(enable),.lfsr(lfsr));
    AND_gate_system AND_inst(.lfsr(lfsr),.and_out(and_out));
```

**Signal Control**:
   - Drive `clk` with a clock signal.
   - Assert `rst` at the beginning to initialize the LFSR.
   - Toggle `enable` to control the operation of the system.

---
## Simulation on ModelSim
<img src="media/lfsr_4bit"/>

## **Applications**
- Automated test vector generation for logic gates.
- Pseudo-random pattern generation for testing larger digital circuits.
- Educational use for demonstrating the interaction between LFSR and logic systems.

---

## **Limitations**
- The LFSR must not be initialized to `8'b0000` as it will lock in an invalid state.
- The AND gate functionality is limited to the 3 LSBs of the LFSR output.

---

## **Conclusion**
This 4-bit LFSR-based test system is a simple yet effective way to demonstrate pseudo-random vector generation and logic verification. It can serve as a foundation for more complex testing systems in digital design.

