# DFT Scan Chain Practice

This repository contains a series of RTL Verilog designs and testbenches for practicing **Design-for-Testability (DFT)** with a focus on implementing **scan chains**. The projects progress from simple designs like D flip-flops to more complex systems like FSMs. Each module is accompanied by detailed specifications and testbenches to verify functionality.

---
## Table of Contents
1. [Overview](#overview)
2. [List of Projects](#list_projects)
3. [Features](#features)
4. [Contact](#contact)
---
<a name="overview"></a>
## Overview
Scan Chain is a crucial technique in Design for Testability (DFT) that enhances the testability of digital circuits. It involves modifying the design of sequential circuits to include additional testability features, allowing for easier detection and diagnosis of faults. The primary goal of scan chain is to improve the observability and controllability of internal states within a circuit. 
**Key Concepts** 
- Scan Flip-Flops: Standard flip-flops are replaced with scan flip-flops, which have an additional input for test data (scan input) and an output for test data (scan output)
- Scan Path: The scan flip-flops are connected in a serial chain, forming a scan path that allows test data to be shifted in and out of the circuit.
- Test Mode: The circuit operates in two modes: normal mode and test mode. In test mode, the scan chain is activated, enabling the shifting of test data through the scan path.
- Test Patterns: Test patterns are applied to the scan chain to detect and diagnose faults. These patterns are shifted into the scan chain, and the resulting output is analyzed to identify any discrepancies.

**Benefits**
- Improved Fault Detection: Scan chain allows for thorough testing of internal states, leading to better fault detection and diagnosis.
- Simplified Testing: The serial nature of the scan chain simplifies the testing process, making it easier to apply and analyze test patterns.
- Enhanced Debugging: Scan chain provides greater visibility into the internal states of the circuit, aiding in debugging and verification.

<a name="list_projects"></a>
## List of Projects
1. [D Flip-Flop with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/DFF_Scan_Chain)
   - A basic D flip-flop enhanced with scan chain functionality.
2. [4-bit Shift Register with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/Shift_register_scan)
   - A shift register supporting scan input and scan output.
3. [8-bit Counter with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/Counter_Scan)
   - A synchronous counter with state monitoring via scan chain.
4. [4-bit ALU with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/ALU_Scan)
   - An arithmetic logic unit with scan chain for functional testing.
5. Finite State Machine (FSM) with Scan Chain *(Will be updated once completed)*
   - A 3-state FSM capable of state verification through scan chain.

---

<a name="features"></a>
## Features
- RTL Verilog implementations for each design.
- Testbenches for functional verification in both normal and scan modes.
- Clear specifications and signal descriptions for each project.
- Step-by-step practice from beginner to advanced DFT concepts.

---
<a name="contact"></a>
## Contact
If you have any questions or suggestions, feel free to reach out:

- Email: taytruong13@gmail.com
- GitHub: [taytruong13](github.com/taytruong13)
- LinkedIn: [taytruong13](linkedin.com/taytruong13)

---
Thank you for visiting this repository! I hope this demonstrates my skills and enthusiasm for RTL design and DFT. 🚀
