# 8×8 FIFO Design Using Verilog HDL



## Project Overview



This project implements an \*\*8×8 synchronous First-In First-Out (FIFO)\*\* memory using Verilog HDL. The FIFO temporarily stores incoming data and performs sequential read/write operations while maintaining insertion order.



The design consists of separate modules for write control, FIFO memory implementation, and read control along with a testbench for functional verification.



---



## Features



* 8-bit data width



* FIFO depth of 8 locations



* Synchronous read and write operations



* Full flag generation



* Empty flag generation



* Separate control modules for read and write operations



* Behavioral simulation verification



---



## Design Architecture



The overall architecture is:





Data Input → Module A → FIFO → Module B → Output



### Block Diagram



!\[FIFO Block Diagram](block\_diagram.png)



---



## Tools Used



* Xilinx Vivado

