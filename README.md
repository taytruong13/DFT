# DFT (Design-for-Testability) Portfolio

Welcome to my **DFT (Design-for-Testability or Design-for-Test)** portfolio repository! This repository showcases my practical projects and exercises in DFT, focusing on RTL (Register Transfer Level) implementations of essential techniques such as **Scan Chain** and **Built-In Self-Test (BIST)**.

The purpose of this repository is to demonstrate my technical skills, problem-solving capabilities, and passion for **RTL Design** and **DFT**. It also serves as a resource for learning and exploring key concepts in DFT.

---

## Repository Structure

This repository contains the following directories:

### 1. [Scan_Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain)
- **Overview**: 
  - This directory focuses on the implementation of **Scan Chain**, a fundamental DFT technique used for enhancing the testability of sequential circuits.
- **Highlights**:
  - Practical RTL examples of scan flip-flops and scan chain integration.
  - Testbenches to validate the functionality of the scan chain.
  - Comprehensive documentation in the [README.md](https://github.com/taytruong13/DFT/tree/main/Scan_Chain) of this directory.
- **Key Learning Areas**:
  - Understanding the concept and working of scan flip-flops.
  - Designing scan chains for fault detection and observability.
- **List of projects**:
  - [D Flip-Flop with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/DFF_Scan_Chain)
    - A Basic D Flip-Flop enhanced with scan chain functionality.
  - [4-bit Shift Register with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/Shift_register_scan)
    - A shift register supporting scan input and scan output.
  - [8-bit Counter with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/Counter_Scan)
    - A synchronous counter with state monitoring via scan chain.
  - [4-bit ALU with Scan Chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/ALU_Scan)
    - An arithmetic logic unit with scan chain for functional testing.
  - [Finite State Machine (FSM) with scan chain](https://github.com/taytruong13/DFT/tree/main/Scan_Chain/FSM_Scan_Chain)
    - A 3-state FSM capable of state verification through scan chain.

---

### 2. [BIST](https://github.com/taytruong13/DFT/tree/main/BIST)
- **Overview**:
  - This directory contains 5 exercises focusing on **Built-In Self-Test (BIST)**, a DFT technique for self-testing hardware modules.
- **Highlights**:
  - Projects demonstrating **Linear Feedback Shift Registers (LFSR)**, **Multiple Input Signature Register (MISR)**, and complete BIST systems.
  - Fault detection and signature analysis techniques.
  - Documentation in the [README.md](https://github.com/taytruong13/DFT/tree/main/BIST) of this directory.
- **Key Learning Areas**:
  - Random pattern generation using LFSR.
  - Signature compression and fault detection.
  - Building complete BIST systems for digital circuits.
- **List of projects**:
  - [LFSR (Linear Feedback Shift Register) Basics](https://github.com/taytruong13/DFT/tree/main/BIST/LFSR_4bit)
    - Design a 4-bit LFSR with tap positions `[4, 1]`
  - [Test Pattern Generation with LFSR](https://github.com/taytruong13/DFT/tree/main/BIST/LFSR_3inANDgate)
    - Use a 4-bit LFSR to generate test patterns for a 3-input AND gate.
  - [Integrating LFSR with MISR](https://github.com/taytruong13/DFT/tree/main/BIST/LFSR_MISR)
    - Combine LFSR (test pattern generator) and MISR (signature compression) for testing a 4-bit Adder.
  - [Fault Detection Using LFSR](https://github.com/taytruong13/DFT/tree/main/BIST/LFSR-based_Error_Detector)
    - Detect stuck-at faults in a 4-bit XOR gate using LFSR and MISR
  - [Complete BIST System](https://github.com/taytruong13/DFT/tree/main/BIST/BIST_system) 
    - Build a complete BIST system for a 4-bit Multiplier. 

---

## Key Features

- All designs and testbenches are implemented in **Verilog**.
- Testbenches are designed to verify the functionality of the implemented circuits with waveform outputs.
- Well-structured directories and detailed documentation for easy navigation and understanding.
- Focused on real-world DFT applications to highlight practical expertise.

---
## A Note to Recruiters
I believe my dedication and self-learning ability will serve as a solid foundation for my growth in the semiconductor field.
This repository is the clearest demonstration of my commitment, learning process, and determination to achieve my career goals.
I am eager to apply what I have learned and further develop my skills in a professional working environment.

If you are interested in learning more about me or discussing potential career opportunities, please don’t hesitate to reach out:

📧 Email: [taytruong13@gmail.com](taytruong13@gmail.com)

🌐 LinkedIn: [linkedin.com/in/taytruong13](linkedin.com/in/taytruong13)

---

## How to Use This Repository

### Clone the Repository
```bash
git clone https://github.com/taytruong13/DFT.git
cd DFT
```

### Explore the Directories
- Navigate to the specific directory (e.g., `Scan_Chain` or `BIST`) to review the projects and exercises.

### Run the Simulations
- Use any Verilog simulator (e.g., ModelSim, Xilinx Vivado, Icarus Verilog) to run the testbenches provided in each directory.
- Check individual README files for detailed instructions.

---

## Future Work

- Expand the repository with more advanced DFT topics such as **ATPG (Automatic Test Pattern Generation)**, **Boundary Scan**, and **Fault Grading**.
- Add fault coverage analysis and optimization techniques.
- Explore integration with industry-standard tools like Synopsys and Cadence.

---

## Contact

If you find this repository useful or have any questions, please feel free to reach out:

- Email: taytruong13@gmail.com
- GitHub: [taytruong13](github.com/taytruong13)
- LinkedIn: [taytruong13](linkedin.com/taytruong13)

---

Thank you for visiting my DFT portfolio repository! I hope this serves as a testament to my skills and dedication to the field of DFT and RTL design. 🚀
