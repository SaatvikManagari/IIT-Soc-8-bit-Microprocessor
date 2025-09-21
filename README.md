# 8-bit-Microprocessor

The Processor built is based on a custom architecure desgin with a specifically designed ISA of 16 bit.

<img width="1523" height="1398" alt="Processor architecutre" src="https://github.com/user-attachments/assets/e1084f2e-ffd7-448c-9167-054a96557b1b" />

## Overview 

This processor ia a part of the IIT Indore Techsoc. The processor built in this project is based on a customly built architecture and ISA to tackle various problems faced in the processor data handling. The main idea of the processor is to maintain a single flow data lines and a multi- accumulator system along a pipelined instruction structure inorder to minimize any pluasible instruction hazard. This Architecture also involves a clock altered circuit which helps use the negative half of the clock cycle to move data in various non-conflicting areas.

# IIT‑Soc 8‑bit Microprocessor

[![Language](https://img.shields.io/badge/Verilog-HDL-orange.svg)](https://www.verilog.com/)

**Authors:** Saatvik Managari & Team  
**Affiliation:** IIT Indore, TechSoc  

---

## Table of Contents

- [Overview](#overview)  
- [Architecture & ISA](#architecture--isa)  
- [Features](#features)  
- [Design & Implementation](#design--implementation)  
- [Getting Started](#getting-started)  
- [Tools & Technologies](#tools--technologies)  
- [Directory Structure](#directory-structure)  
- [Contribution](#contribution)  
- [Future Work](#future-work)  
- [License](#license)  

---

## Overview

This project presents a **custom 8‑bit microprocessor** designed and implemented as part of IIT Indore’s TechSoc. It features a **custom instruction set architecture (ISA)**, a **pipelined architecture**, and optimized data handling using **multi-accumulator registers**.  

Special emphasis was given to improving throughput by utilizing the **negative half of the clock cycle** for non-conflicting data transfers.

---

## Architecture & ISA

- **Custom ISA:** 16-bit instruction format. (Refer to `ISA (2).xlsx`)  
- **Multi-accumulator system:** Efficient handling of intermediate results without frequent memory access.  
- **Pipelined design:** Reduces instruction hazards and improves instruction throughput.  
- **Clock optimization:** Certain data movements occur on the negative half cycle to reduce idle cycles.

---

## Features

- Reduced instruction hazards via pipelined architecture.  
- Multi-accumulator design for optimized data handling.  
- Negative clock half-cycle utilization to enhance speed.  
- Fully modular design for easy understanding and extension.

---

## Design & Implementation

- **Language:** Verilog  
- **Modules:** ALU, control logic, register file, fetch/decode, pipeline stages  
- **Simulation:** Test benches included for verification  
- **Optimization:** Timing improvements through clock phase management

---

## Getting Started

Follow these steps to run or simulate the processor:

### 1. Clone the Repository

```bash
git clone https://github.com/SaatvikManagari/IIT-Soc-8-bit-Microprocessor.git
cd IIT-Soc-8-bit-Microprocessor

## Introduction
2. Review ISA

Open ISA (2).xlsx to understand the instruction set, opcodes, and formats.

3. Simulation / Build

Use any Verilog simulator (e.g., Icarus Verilog, ModelSim, Vivado)

Compile the Verilog modules:

iverilog -o processor_tb Final_processor/*.v
vvp processor_tb


Observe results from the testbench.

4. Programming the Processor

Write assembly programs according to the custom ISA.

Encode manually or via assembler (if available).

Load instructions into instruction memory for execution.

Tools & Technologies

Verilog HDL for hardware design

EDA / Simulation tools: Icarus Verilog, ModelSim, Vivado

Documentation: Excel (ISA (2).xlsx), PDF project report

Version Control: Git / GitHub

Directory Structure
IIT-Soc-8-bit-Microprocessor/
├── Final_processor/              ← Final Verilog files and top module
├── mid_evaluation/               ← Intermediate versions
├── ISA (2).xlsx                  ← Instruction set specification
├── README.md                     ← Project documentation
└── Saatvik Managari_Electronics_1.pdf ← Project report

Contribution

Contributions, bug reports, and suggestions are welcome.

Fork the repository → make changes → submit a pull request.

Maintain module structure, coding conventions, and comments.

Future Work

Develop an assembler / compiler for the ISA.

Enhance pipeline hazard detection and forwarding.

Implement branch prediction for control hazards.

Comprehensive testbench coverage.

Explore FPGA synthesis and deployment.
