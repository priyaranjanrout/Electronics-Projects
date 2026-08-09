# RISC-V Single-Cycle Processor Core

A 32-bit RISC-V single-cycle processor designed and implemented in **Verilog HDL**.  
The project focuses on understanding the internal datapath, control path, ALU design, instruction decoding, register operations, and memory interface of a RISC-V processor.

## Overview

This project implements a **single-cycle RISC-V processor**, where each instruction is fetched, decoded, executed, and completed within a single clock cycle.

The processor consists of:

- Program Counter (PC)
- Instruction Memory
- Register File
- Immediate Generator / Sign Extension
- Main Control Unit
- ALU Control Unit
- 32-bit ALU
- Data Memory
- Multiplexers
- PC Adder
- Branch control logic

The design is modularized into individual Verilog RTL blocks and verified using a dedicated testbench and GTKWave simulation.

## Processor Architecture

![Complete Processor Datapath](./Complete%20Block%20Diagram.png)

The processor follows the standard instruction execution flow:

```text
PC
 │
 ▼
Instruction Memory
 │
 ▼
Instruction Decode
 │
 ├──────────────► Control Unit
 │
 ├──────────────► Register File
 │
 └──────────────► Immediate Generator
                         │
                         ▼
                  ALU Input Selection
                         │
                         ▼
                        ALU
                    ┌────┴────┐
                    ▼         ▼
              Data Memory   Result
                    │         │
                    └────┬────┘
                         ▼
                   Register File
                         │
                         ▼
                      Write Back
