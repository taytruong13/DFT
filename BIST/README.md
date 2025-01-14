# Built-In Self-Test (BIST) Projects for DFT Practice

This repository contains 5 practical exercises aimed at demonstrating the principles of **Design-for-Testability (DFT)** at the RTL (Register Transfer Level) and showcasing the use of **Linear Feedback Shift Register (LFSR)** and **Multiple Input Signature Register (MISR)** in BIST applications.

Through these projects, I aim to showcase my skills in RTL design, Verilog coding, and testbench development, as well as my understanding of critical concepts in DFT.

---

## Table of Contents

1. [Overview](#overview)
2. [List of Projects](#list_projects)
3. [Features](#features)
4. [Future Work](#future_work)
5. [Contact](#contact)

---
<a name="overview"></a>
## Overview

Built-In Self-Test (BIST) is a key technique in **Design-for-Testability (DFT)** that allows integrated circuits to test themselves without the need for external testing equipment. This repository explores fundamental concepts of BIST, such as:

- Linear Feedback Shift Register (LFSR)
- Random pattern generation
- Signature compression using Multiple Input Signature Register (MISR)
- Fault detection through signature comparison

Each project in this repository is self-contained and designed to be practical, allowing hands-on experience with both Verilog coding and testbench development.

---
<a name="list_projects"></a>
## List of Projects

### 1. LFSR Basics
- **Objective**: Design a 4-bit LFSR with tap positions [4, 1].
- **Key Features**: 
  - Generates a pseudo-random sequence with a full cycle.
  - Includes `clk`, `rst`, and `enable` signals.
- **Learning Outcome**: Understand LFSR mechanics and feedback logic.

### 2. Test Pattern Generation with LFSR
- **Objective**: Use an 8-bit LFSR to generate test patterns for a 3-input AND gate.
- **Key Features**: 
  - Random pattern generation.
  - Automatic input stimulation for logic testing.
- **Learning Outcome**: Demonstrate LFSR integration for random test vector generation.

### 3. Integrating LFSR with MISR
- **Objective**: Combine LFSR (test pattern generator) and MISR (signature compression) for testing a 4-bit Adder.
- **Key Features**: 
  - Random vector generation by LFSR.
  - Signature compression by MISR.
- **Learning Outcome**: Learn how LFSR and MISR collaborate in a BIST flow.

### 4. Fault Detection Using LFSR
- **Objective**: Detect stuck-at faults in a 4-bit XOR gate using LFSR and MISR.
- **Key Features**: 
  - Fault injection for testing.
  - Signature comparison to detect faults.
- **Learning Outcome**: Understand fault detection methodology in BIST.

### 5. Complete BIST System
- **Objective**: Build a complete BIST system for a 4-bit Multiplier.
- **Key Features**: 
  - Integrated LFSR, MISR, and Comparator.
  - Full fault detection flow.
- **Learning Outcome**: Implement a fully functional BIST system.

---

<a name="features"></a>
## Features
- RTL Verilog implementations for each design.
- Testbenches for functional verification in test mode.
- Clear specifications and signal descriptions for each project.
- Step-by-step practice from beginner to advanced DFT concepts.
---

<a name="future_work"></a>
## Future Work
- Extend BIST projects with advanced features like Scan Chains or Boundary Scan.
- Implement fault grading to quantify test coverage.
- Explore multi-tap LFSRs for more complex test pattern generation.

---
<a name="contact"></a>
## Contact
If you have any questions, suggestions, or collaboration ideas, feel free to reach out:

- Email: taytruong13@gmail.com
- GitHub: [taytruong13](github.com/taytruong13)
- LinkedIn: [taytruong13](linkedin.com/taytruong13)

---
Thank you for visiting this repository! I hope this demonstrates my skills and enthusiasm for RTL design and DFT. 🚀
