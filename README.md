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
- [ISA](#ISA) 
- [Modules](#modules)  
- [The Working of the Processor](#The--Working--of--the--Processor)  
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

The aforementioned ISA structure is followed throughout the processor

| UNIT | Operation to be performed         | Function Bits | Operation Bits | Address Bits                                                |
|------|-----------------------------------|---------------|----------------|-------------------------------------------------------------|
| ALU  | Neutral Reference code            | 0 0           | 0 0 0 0 0      | 0 0 0 0 0 0 0 0                                             |
| ALU  | Add                               | 0 0           | 0 0 0 0 1      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Sub                               | 0 0           | 0 0 0 1 0      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Mul                               | 0 0           | 0 0 0 1 1      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Div                               | 0 0           | 0 0 1 0 0      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Compare (<=)                      | 0 0           | 0 0 1 0 1      | Working Register 1, Working Register 2, Drop register       |
| ALU  | compare(>=)                       | 0 0           | 0 0 1 1 0      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Bitwise Right                     | 0 0           | 0 0 1 1 1      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Bitwise Left                      | 0 0           | 0 1 0 0 0      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Bitwise Or                        | 0 0           | 0 1 0 0 1      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Bitwise And                       | 0 0           | 0 1 0 1 0      | Working Register 1, Working Register 2, Drop register       |
| ALU  | Bitwise Not                       | 0 0           | 0 1 0 1 1      | Working Register 1, 0 0 0 ,Drop register                    |
| ALU  | Adding of a constant              | 0 0           | 0 1 1 0 0      | Working Register Address, 8-Bit Number                      |
| ALU  | subtracting a constant            | 0 0           | 0 1 1 0 1      | Working Register Address, 8-Bit Number                      |
| ALU  | multiplying a constant            | 0 0           | 0 1 1 1 0      | Working Register Address, 8-Bit Number                      |
| ALU  | dividing a constant               | 0 0           | 0 1 1 1 1      | Working Register Address, 8-Bit Number                      |
| ALU  | comparing with a constant(==)     | 0 0           | 1 0 0 0 0      | Working Register Address, 8-Bit Number                      |
| ALU  | comparing with a constant(<=)     | 0 0           | 1 0 0 0 1      | Working Register Address, 8-Bit Number                      |
| LSU  | Memory to Working Register        | 1 0           | 0 0 0          | Register Address, Memory Address                            |
| LSU  | Drop Register to Memory           | 1 0           | 0 0 0          | Register Address, Memory Address                            |
| LSU  | Drop Register to Working Registers| 1 0           | 0 0 1          | Working Register 1, Working Register 2, Drop register       |
| LSU  | Initiate value in a register      | 1 1           | 0 0 0          | Working Register Address, 8-Bit Number                      |
| LSU  | Conditional Jump                  | 1 1           | 0 0 0          | Register Address, Instruction Address                       |
| LSU  | Unconditional Jump                | 1 1           | 0 0 1          | Register Address, Instruction Address                       |


## Modules

### Working Registers

A Register file involving 8 POS-CLK-EDGE D-Registers with a unique 3-bit address, with the register "000" grounded to have a reference at all states. This Register file can obtain data from memory, user (in the form of a command), and from the drop registers.

### Drop Registers

This register file is a 4 NEG-CLK-EDGE D-Registers with a 2-bit unique address. These registers act as a Multi-Accumulator system to avoid data handling hazards. This can receive data only from the ALU.

### ALU

A custom-built Arithmetic and Logic Unit capable of performing 17 Individual operations in a single clock cycle. These Include ADD, SUB, MUL, DIV, etc.

### LSU

This module was designed to handle data transfer and movement between various places in the processor. It enables connections between Memory, Working Registers, and Drop Registers.

### Program Counter

An 8-bit Shift Counter that requests the instruction from the Instruction Memory. The counter is altered using the JUMP instruction and is handled in the JUMP module. This counter counts for both the positive edge and the negative edge of the clk. This helps call the instruction in 2 parts using an 8-bit data channel from the memory in a single clock cycle. This way, we call the function and operation bits together and address bits in the latter half of the clock.

### Instruction Memory

This stores the instruction in 2 different registers working on alternate clk signals. This allows us to store the function and operation bits first and classify the data in the decode module and then send it to its respective module along with the address bits.

### Decode Module

This module takes the first bit of the ISA to classify the type of instruction and delivers it to its respective location.


### Pipeline Module

This module is placed in front of the ALU and LSU and houses a master slave register system in order to hold the information for one clock cycle. This helps avoid any sort of collision of data in the respective module =, also helps prevent loss of instruction as well.

### Jump Module

This module helps manage all the jump instructions. The conditional jump is processed in the LSU, and the output is sent to the JUMP module, which then decides the state of jump. In an Unconditional jump, the jump module receives the data immediately from the decode module, and the counter is changed immediately.

## The Working of the Processor



