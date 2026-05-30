\# 8×8 FIFO Design Using Verilog HDL



\## Project Overview



This project implements an 8×8 synchronous First-In First-Out (FIFO) memory using Verilog HDL. The FIFO is designed to temporarily store data and provide sequential read/write operations while maintaining the order of data insertion.



The design includes separate modules for data generation, FIFO memory implementation, and read control logic along with a complete testbench for verification.



\---



\## Features



\* 8-bit data width

\* FIFO depth of 8 locations

\* Synchronous read and write operations

\* Full flag generation

\* Empty flag generation

\* Separate control modules for write and read operations

\* Behavioral simulation and verification



\---



\## Design Architecture



The overall architecture is:



Data Input → Write Control Module → FIFO Memory → Read Control Module → Output



\### Modules Used



\### 1. top\_fifo.v



Acts as the top-level integration module that connects all submodules together.



\### 2. mod\_a.v



Responsible for:



\* Receiving external input data

\* Generating write enable signal

\* Passing input data to FIFO



\### 3. FIFO\_8\_8.v



Implements the actual FIFO memory.



Functions:



\* Stores incoming data

\* Handles read/write operations

\* Generates Full flag

\* Generates Empty flag

\* Maintains read and write pointers



\### 4. mod\_b.v



Responsible for:



\* Generating read enable signal

\* Reading data from FIFO

\* Sending data to output



\### 5. FIFO\_8\_8\_tb.v



Used for functional verification through simulation.



\---



\## FIFO Operation



\### Write Operation



\* Data is written when Write Enable (wr\_en) becomes high.

\* Write pointer increments after successful write.

\* Writing stops when FIFO becomes full.



\### Read Operation



\* Data is read when Read Enable (rd\_en) becomes high.

\* Read pointer increments after successful read.

\* Reading stops when FIFO becomes empty.



\### Full Condition



FIFO becomes full when the next write position reaches the read pointer.



\### Empty Condition



FIFO becomes empty when read pointer equals write pointer.



\---



\## Folder Structure



src/



\* top\_fifo.v

\* FIFO\_8\_8.v

\* mod\_a.v

\* mod\_b.v



tb/



\* FIFO\_8\_8\_tb.v



simulation/



\* waveform screenshots



\---



\## Simulation Results



\### Top Level Testbench Waveform



(Add screenshot here)



\### FIFO Internal Signals



(Add screenshot here)



\---



\## Tools Used



\* Verilog HDL

\* Xilinx Vivado

\* Behavioral Simulation



\---



\## Future Improvements



\* Parameterized FIFO Design

\* Asynchronous FIFO Implementation

\* SystemVerilog Verification

\* Assertion Based Verification



\---



\## Author



Shweta



