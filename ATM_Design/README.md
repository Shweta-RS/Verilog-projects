# FPGA-Based ATM Controller using Verilog HDL on Altera DE2-115

<p align="center">
  <img src="Images/Updated Balance.png" width="700">
</p>

<p align="center">
<b>FPGA-Based ATM Controller Implemented on the Altera DE2-115 FPGA Development Board</b>
</p>

---

## Overview

This project presents an FPGA-based **Automated Teller Machine (ATM) Controller** designed using **Verilog HDL** and implemented on the **Altera DE2-115 FPGA Development Board**. The controller is based on a **Finite State Machine (FSM)** that performs user authentication, account selection, balance display, deposit operations, and logout functionality.

The design supports two users with independent account information and demonstrates a complete ATM transaction using on-board switches, push buttons, and seven-segment displays. The project has been functionally verified through simulation and successfully implemented on FPGA hardware.

---

# Features

- Finite State Machine (FSM)-based ATM controller
- Supports two independent users
- PIN authentication using toggle switches
- Displays account number and account balance
- Deposit operation (₹100 / ₹200 / ₹500)
- Real-time balance update
- Seven-segment display interface
- Four-second timer for state transitions
- Modular Verilog HDL implementation
- Successfully implemented on the Altera DE2-115 FPGA

---

# Hardware Specifications

| Parameter | Specification |
|-----------|---------------|
| FPGA Board | Altera DE2-115 |
| FPGA Device | Cyclone IV E |
| Clock Frequency | 50 MHz |
| Inputs | Toggle Switches, Push Buttons |
| Outputs | Seven Segment Displays |

---

# Finite State Machine

The ATM controller is implemented using a **seven-state Finite State Machine (FSM)** consisting of the following states:

- IDLE
- PIN
- VERIFY
- SHOW_ACC
- SHOW_BAL
- DEPOSIT
- LOGOUT

<p align="center">
<img src="Images/State Machine Diagram for proposed system.png" width="850">
</p>

<p align="center">
<b>Fig 2.0:</b> State Machine Diagram for the proposed ATM Controller
</p>

The FSM controls the complete ATM operation by managing PIN verification, user authentication, account display, balance display, deposit transactions, balance updates, and logout functionality.

---

# FSM State Description

| State | Description |
|--------|-------------|
| **IDLE** | Displays the default value **0272** and waits for user interaction. |
| **PIN** | Reads the PIN entered through the toggle switches. |
| **VERIFY** | Verifies the entered PIN and identifies the active user. |
| **SHOW_ACC** | Displays the authenticated user's account number. |
| **SHOW_BAL** | Displays the current account balance. |
| **DEPOSIT** | Accepts deposit amounts of ₹100, ₹200, or ₹500 and updates the account balance. |
| **LOGOUT** | Displays a logout indication before returning to the IDLE state. |

---

# User Information

| User | Account Number | PIN | Initial Balance |
|------|----------------|-----|-----------------|
| User 0 | 1414 | 010 | ₹150 |
| User 1 | 1231 | 101 | ₹250 |

---

# I/O Mapping

| FPGA Input | Function |
|------------|----------|
| Switch 2–4 | PIN Entry |
| Switch 5 | Deposit ₹100 |
| Switch 6 | Deposit ₹200 |
| Switch 7 | Deposit ₹500 |
| Switch 8 | Reset |
| Switch 0 | PIN Verification |
| Switch 1 | Deposit Mode |
| KEY1 | Confirm Deposit |
| KEY2 | Logout |

---
# Hardware Implementation Results

The proposed ATM controller was successfully synthesized and implemented on the **Altera DE2-115 FPGA Development Board**. The following figures demonstrate the complete operation of the ATM controller from user authentication to logout.

---

## Fig 6.0: Displays Value set in IDLE condition

<p align="center">
<img src="Images/Displays Value set in IDLE condition.png" width="550">
</p>

After power-up or reset, the ATM enters the **IDLE** state and displays the default value **0272**, indicating that the system is ready to accept user input.

---

## Fig 6.1: Account Number of User 0 (PIN = 010)

<p align="center">
<img src="Images/Account number of User 0 (as PIN 010 is entered).png" width="550">
</p>

When the correct PIN (**010**) is entered, the controller successfully authenticates **User 0** and displays the corresponding account number.

---

## Fig 6.2: Initial Balance of User 0

<p align="center">
<img src="Images/Initial Balance of User 0.png" width="550">
</p>

After successful authentication, the ATM displays the current account balance of **User 0** before any transaction is performed.

---

## Fig 6.3: Deposit ₹200 into User 0 Account

<p align="center">
<img src="Images/Deposition of 200 rupees to User 0 account.png" width="550">
</p>

The user selects a deposit amount of **₹200** using the toggle switches and confirms the transaction through the push button.

---

## Fig 6.4: Updated Balance

<p align="center">
<img src="Images/Updated Balance.png" width="550">
</p>

After the deposit operation is completed, the ATM updates the account balance and displays the new balance of **₹350**.

---

## Fig 6.5: Logout (Display Refreshed)

<p align="center">
<img src="Images/Logout (Display refreshed).png" width="550">
</p>

The logout operation is completed successfully, and the ATM returns to the **IDLE** state, making the system ready for the next user.

---

# Why Altera DE2-115?

The **Altera DE2-115 FPGA Development Board** provides an excellent platform for implementing digital systems using Verilog HDL. The Cyclone IV E FPGA offers sufficient logic resources, embedded memory, and a variety of on-board peripherals such as toggle switches, push buttons, and seven-segment displays, making it well suited for implementing an interactive ATM controller.

The integrated **50 MHz** clock simplifies the implementation of precise timing circuits, such as the four-second timer used for state transitions in this project.

---

# Applications

This project can be used for:

- FPGA-based Digital System Design
- Verilog HDL learning
- Finite State Machine (FSM) implementation
- VLSI laboratory experiments
- Academic mini-projects
- ATM controller prototyping

---

# Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | Hardware Description Language |
| Intel Quartus Prime | Design Entry, Synthesis, and FPGA Programming |
| ModelSim | Functional Simulation |
| Altera DE2-115 FPGA Board | Hardware Implementation |

---

# Getting Started

1. Clone this repository.

```bash
git clone https://github.com/<your-username>/<repository-name>.git
```

2. Open the project in **Intel Quartus Prime**.

3. Compile the design.

4. Program the generated **.sof** file to the **Altera DE2-115 FPGA Development Board**.

5. Verify the ATM controller operation using the on-board switches, push buttons, and seven-segment displays.

---

# Author

**Shweta Sankri**

M.Tech – VLSI Design

---

# Acknowledgement

This project was developed as part of the **Digital System Design using FPGA** coursework to demonstrate the implementation of a **Finite State Machine (FSM)-based ATM Controller** using **Verilog HDL** on the **Altera DE2-115 FPGA Development Board**.