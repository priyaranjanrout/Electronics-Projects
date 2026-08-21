# 5-Stage Pipelined RISC-V Processor

A **32-bit, 5-stage pipelined RISC-V processor** designed and implemented using **Verilog HDL**. The processor follows the classic **IF → ID → EX → MEM → WB** pipeline architecture, enabling multiple instructions to be processed simultaneously and improving instruction throughput.

## 🚀 Project Overview

This project focuses on designing a modular RISC-V processor with a pipelined datapath and hardware mechanisms for handling data dependencies between instructions.

### Key Features

* **32-bit RISC-V processor**
* **5-stage pipeline architecture**

  * Instruction Fetch (IF)
  * Instruction Decode (ID)
  * Execute (EX)
  * Memory Access (MEM)
  * Write Back (WB)
* Modular RTL datapath design
* ALU for arithmetic and logical operations
* 32 × 32-bit register file
* Instruction and data memory
* Dedicated control unit
* Pipeline registers between each stage
* Data hazard detection
* Forwarding / bypassing logic for resolving data dependencies

## 🏗️ Pipeline Architecture

```text
        ┌──────┐     ┌──────┐     ┌──────┐     ┌──────┐     ┌──────┐
        │  IF  │────▶│  ID  │────▶│  EX  │────▶│ MEM  │────▶│  WB  │
        └──────┘     └──────┘     └──────┘     └──────┘     └──────┘
           │            │            │            │            │
          PC        Register      ALU /        Data         Register
        + 4        File / CU     Execute      Memory         Write
```

### 1. Instruction Fetch (IF)

* Program Counter (PC) generates the instruction address.
* Instruction memory provides the 32-bit instruction.
* The fetched instruction and relevant information are stored in the **IF/ID pipeline register**.

### 2. Instruction Decode (ID)

* The instruction is decoded according to the RISC-V instruction format.
* Source registers are read from the register file.
* The control unit generates the required control signals.
* Immediate values are generated where required.
* Results are passed to the **ID/EX pipeline register**.

### 3. Execute (EX)

* The ALU performs arithmetic and logical operations.
* Branch/address calculations are performed where applicable.
* Forwarding logic selects the most recent operand values when a data dependency exists.
* Results are stored in the **EX/MEM pipeline register**.

### 4. Memory Access (MEM)

* Load and store instructions access data memory.
* The ALU-generated address is used for memory operations.
* Memory results and control signals are transferred to the **MEM/WB pipeline register**.

### 5. Write Back (WB)

* The final result is selected from the ALU or data memory.
* The result is written back into the destination register.
* This completes the instruction execution cycle.

## ⚙️ Main RTL Components

The processor is implemented using a modular RTL architecture consisting of:

* **Program Counter**
* **Instruction Memory**
* **Register File**
* **Control Unit**
* **ALU**
* **Immediate Generation Logic**
* **Data Memory**
* **Pipeline Registers**

  * IF/ID
  * ID/EX
  * EX/MEM
  * MEM/WB
* **Hazard Detection Logic**
* **Forwarding / Bypassing Logic**

This modular structure makes individual processor components easier to design, debug, simulate, and integrate.

## 🔄 Hazard Handling

Pipeline execution introduces **data hazards** when an instruction depends on the result of an earlier instruction that has not yet completed.

For example:

```assembly
ADD x3, x1, x2
SUB x4, x3, x5
```

Here, `SUB` requires the value of `x3` produced by the preceding `ADD`.

### Forwarding / Bypassing

To reduce unnecessary pipeline stalls, forwarding logic bypasses the required result directly from later pipeline stages to the Execute stage instead of waiting for the value to be written back to the register file.

```text
        EX/MEM ──────────────┐
                             ▼
                         ┌────────┐
Register File ──────────▶│  MUX   │──▶ ALU
                         └────────┘
                             ▲
        MEM/WB ──────────────┘
```

The hazard detection and forwarding logic ensure that dependent instructions receive the correct data while maintaining pipeline operation.

## 📁 Repository Structure

```text
5-Stage Pipelined RISC-V Processor/
│
├── src/
│   └── Verilog RTL source files
│
├── README.md
│
├── Schematic.png
├── Response1.png
├── Response2.png
└── Response3.png
```

## 🧪 Verification

The processor was tested through simulation by executing RISC-V instruction sequences and observing the behavior of the datapath, pipeline stages, register file, and hazard-handling logic.

Simulation waveforms were used to verify:

* Correct instruction flow through all five stages
* ALU operations
* Register read/write operations
* Memory operations
* Pipeline register behavior
* Data dependency handling
* Forwarding/bypassing operation

## 🛠️ Technologies Used

* **Verilog HDL**
* **RISC-V ISA**
* **RTL Design**
* **Digital Logic Design**
* **Computer Architecture**
* **Pipeline & Hazard Handling**
* **Simulation and Waveform Analysis**

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Designing a pipelined processor datapath
* Understanding RISC-V instruction execution
* RTL-based digital system design
* Pipeline timing and stage synchronization
* Data hazard detection
* Forwarding and bypassing techniques
* Modular Verilog design
* Processor simulation and debugging

## 🔮 Future Improvements

Potential extensions to the processor include:

* Improved control-hazard handling
* Branch prediction
* Pipeline flushing and stall optimization
* Support for a larger subset of the RV32I instruction set
* Cache implementation
* FPGA implementation
* Performance comparison with a single-cycle processor

## 👤 Author

**Priyaranjan Rout**
B.Tech Electrical Engineering
National Institute of Technology, Rourkela

---

⭐ If you find this project useful, feel free to explore the source code and experiment with the processor architecture.

