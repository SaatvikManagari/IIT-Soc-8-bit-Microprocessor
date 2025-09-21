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

## ISA
| UNIT | Operation to be performed          | Function Bits | Operation Bits | Address Bits                                            |
| ---- | ---------------------------------- | ------------- | -------------- | ------------------------------------------------------- |
| ALU  | Neutral/Reference code             | 0 0 0 0       | 0 0            | 0 0 0 0 0 0 0 0                                         |
| ALU  | Add                                | 0 0 0 0       | 0 1            | Working Register 1 / Working Register 2 / Drop register |
| ALU  | Sub                                | 0 0 0 1       | 0 0            | Working Register 1 / Working Register 2 / Drop register |
| ALU  | Mul                                | 0 0 0 1       | 0 1            | Working Register 1 / Working Register 2 / Drop register |
| ALU  | Div                                | 0 0 1 0       | 0 0            | Working Register 1 / Working Register 2 / Drop register |
| ALU  | Compare (<,>)                      | 0 0 1 0       | 0 1            | Working Register 1 / Working Register 2 / Drop register |
| ALU  | Compare(==)                        | 0 0 1 1       | 0 0            | Working Register 1 / Working Register 2 / Drop register |
| ALU  | Bitwise Right                      | 0 0 1 1       | 0 1            | Working Register 1 / X / X / Drop register              |
| ALU  | Bitwise Left                       | 0 1 0 0       | 0 0            | Working Register 1 / X / X / Drop register              |
| ALU  | Bitwise Or                         | 0 1 0 0       | 0 1            | Working Register 1 / X / X / Drop register              |
| ALU  | Bitwise And                        | 0 1 0 1       | 0 1            | Working Register 1 / X / X / Drop register              |
| ALU  | Bitwise Not                        | 0 1 1 0       | 0 0            | Working Register 1 / X / X / Drop register              |
| ALU  | Adding a constant                  | 0 1 1 0       | 1 0            | Working Register Address / 8-Bit Number                 |
| ALU  | Subtracting a constant             | 0 1 1 1       | 1 0            | Working Register Address / 8-Bit Number                 |
| ALU  | Multiplying a constant             | 0 1 1 1       | 1 1            | Working Register Address / 8-Bit Number                 |
| ALU  | Dividing a constant                | 1 0 0 0       | 1 0            | Working Register Address / 8-Bit Number                 |
| ALU  | Comparing with a constant (<,>)    | 1 0 0 0       | 1 1            | Working Register Address / 8-Bit Number                 |
| ALU  | Comparing with a constant(==)      | 1 0 0 1       | 1 0            | Working Register Address / 8-Bit Number                 |
| LSU  | Memory to Working Register         | 1 0 0 1       | 0 1            | Register Address / Memory Address                       |
| LSU  | Drop Register to Memory            | 1 0 1 0       | 0 0            | Register Address / Memory Address                       |
| LSU  | Drop Register to Working Registers | 1 0 1 0       | 0 1            | Working Register / X / X / Drop register                |
| LSU  | Initiate value in a register       | 1 0 1 1       | 0 0            | 8-Bit Number                                            |
| LSU  | Conditional Jump                   | 1 0 1 1       | 1 1            | Instruction Address                                     |
| LSU  | Unconditional Jump                 | 1 1 0 0       | 1 1            | Instruction Address                                     |
| LSU  | Input                              | 1 1 0 0       | 0 0            | Register Address                                        |
| LSU  | Output                             | 1 1 0 1       | 0 0            | Register Address                                        |
| LSU  | Halt                               | 1 1 1 1       | 1 1            | 1 1 1 1 1 1 1 1                                         |


Comprehensive testbench coverage.

Explore FPGA synthesis and deployment.
