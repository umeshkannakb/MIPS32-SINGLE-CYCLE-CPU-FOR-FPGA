# MIPS32 Single-Cycle CPU for FPGA

A fully synthesizable 32-bit single-cycle MIPS processor implemented in Verilog HDL and targeted for Xilinx FPGA using Vivado.

---

## Overview

This project implements a single-cycle MIPS32 CPU from scratch in Verilog. The processor fetches, decodes, and executes one instruction per clock cycle, covering the core MIPS instruction set including arithmetic, logical, memory, and branch instructions. The design is structured as individual functional units connected through a unified datapath, with a central control unit generating all necessary control signals.

---

## Supported Instructions

| Type | Instructions |
|------|-------------|
| R-Type | `ADD`, `SUB`, `AND`, `OR`, `SLT`, `SLL`, `SRL` |
| I-Type | `ADDI`, `ANDI`, `ORI`, `LW`, `SW`, `BEQ`, `BNE` |
| J-Type | `J`, `JAL` |

---

## Datapath Architecture

```
        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
PC â”€â”€â”€â”€â–¶â”‚  IMEM  â”‚â”€â”€â”€â–¶â”‚  Decode  â”‚â”€â”€â”€â–¶â”‚  ALU + Regs  â”‚â”€â”€â”€â–¶â”‚ MEM â”‚â”€â”€â”€â–¶â”‚ Write-   â”‚
        â””â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”˜    â”‚  back    â”‚
             â–²               â”‚                â”‚                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
             â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                         (PC + 4 / Branch / Jump)
```

Key datapath components:
- **Program Counter (PC)** â€” holds current instruction address
- **Instruction Memory (IMEM)** â€” single-port ROM holding the program
- **Register File** â€” 32 Ã— 32-bit general-purpose registers
- **ALU** â€” performs arithmetic and logic operations
- **Data Memory (DMEM)** â€” for load/store instructions
- **Sign Extender** â€” extends 16-bit immediates to 32 bits
- **Control Unit** â€” generates `RegDst`, `ALUSrc`, `MemToReg`, `RegWrite`, `MemRead`, `MemWrite`, `Branch`, `ALUOp`

---

## File Structure

```
MIPS32-SINGLE-CYCLE-CPU-FOR-FPGA/
â”œâ”€â”€ README.md
â”œâ”€â”€ .gitignore
â”œâ”€â”€ Source_codes.v/
â”‚   â”œâ”€â”€ mips_top.v          â† Top-level module
â”‚   â”œâ”€â”€ pc.v                â† Program Counter
â”‚   â”œâ”€â”€ imem.v              â† Instruction Memory
â”‚   â”œâ”€â”€ regfile.v           â† 32x32 Register File
â”‚   â”œâ”€â”€ alu.v               â† ALU (ADD/SUB/AND/OR/SLT/SLL/SRL)
â”‚   â”œâ”€â”€ alu_control.v       â† ALU Control Unit
â”‚   â”œâ”€â”€ dmem.v              â† Data Memory
â”‚   â”œâ”€â”€ control.v           â† Main Control Unit
â”‚   â”œâ”€â”€ sign_extend.v       â† Sign Extension Unit
â”‚   â””â”€â”€ mips_tb.v           â† Testbench
â””â”€â”€ docs/
    â””â”€â”€ mips_datapath.png   â† Datapath block diagram
```

> **Note:** Add your Verilog source files inside the `Source_codes.v/` directory. Testbench goes in the same folder or a separate `tb/` directory.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Xilinx Vivado | Synthesis, Simulation, Bitstream |
| FPGA Target | Xilinx Artix-7 / Basys 3 (or equivalent) |

---

## How to Simulate

1. Clone the repository
2. Open Vivado â†’ Create Project â†’ Add all `.v` source files
3. Set `mips_tb.v` as the simulation source
4. Run Behavioral Simulation
5. View waveforms for `clk`, `pc_out`, `alu_result`, `reg_write_data`

---

## How to Synthesize & Program FPGA

1. Add `.xdc` constraints file with pin assignments for your board
2. Run Synthesis â†’ Implementation â†’ Generate Bitstream
3. Program the FPGA via JTAG using Vivado Hardware Manager

---

## What to Add Next

- [ ] Add Verilog source files for all modules listed above
- [ ] Add `.xdc` constraint file for your target FPGA board
- [ ] Add simulation waveform screenshot to `docs/`
- [ ] Add `docs/mips_datapath.png` block diagram
- [ ] Set GitHub repo topics: `verilog` `mips32` `fpga` `cpu-design` `computer-architecture` `vivado`

---

## License

MIT License
