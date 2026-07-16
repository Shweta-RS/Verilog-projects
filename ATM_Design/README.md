# FPGA-Based ATM Controller using Verilog HDL on Altera DE2-115

<p align="center">
  <img src="images/Updated Balance(1).png" width="700">
</p>

<p align="center">
<b>FPGA-Based ATM Controller Implemented on the Altera DE2-115 FPGA Development Board</b>
</p>

---

## Overview

This project presents an FPGA-based **Automated Teller Machine (ATM) Controller** designed using **Verilog HDL** and implemented on the **Altera DE2-115 FPGA Development Board**. The controller is based on a **Finite State Machine (FSM)** that performs user authentication, account selection, balance display, deposit operations, and logout functionality.

User interactions are performed through the on-board toggle switches and push buttons, while transaction details are displayed on the seven-segment displays. The design has been functionally verified through simulation and successfully implemented on FPGA hardware.

---

# Features

- Finite State Machine (FSM)-based ATM controller
- Supports two independent users
- PIN authentication using toggle switches
- Displays account number and account balance
- Deposit operation (₹100 / ₹200 / ₹500)
- Real-time balance update
- Seven-segment display interface
- 4-second timer for controlled state transitions
- Modular Verilog HDL implementation
- Successfully implemented on Altera DE2-115 FPGA

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
<img src="images/State Machine Diagram for proposed system.png" width="850">
</p>

<p align="center">
<b>Fig 2.0:</b> State Machine Diagram for proposed system
</p>

The FSM controls the complete ATM operation by handling user authentication, account display, balance display, deposit transactions, balance updates, and logout functionality.

---

# FSM State Description

| State | Description |
|--------|-------------|
| **IDLE** | Displays the default value **0272** (generated from internal value `16'h0110`) and waits for the timer to expire before entering the PIN state. |
| **PIN** | Reads the PIN entered through the toggle switches and waits for user verification. |
| **VERIFY** | Verifies the entered PIN and selects the active user (User 0 or User 1). |
| **SHOW_ACC** | Displays the authenticated user's account number (`1414` for User 0 and `1231` for User 1). |
| **SHOW_BAL** | Displays the current account balance and waits for deposit or logout selection. |
| **DEPOSIT** | Accepts deposit amounts of ₹100, ₹200, or ₹500 and updates the account balance. |
| **LOGOUT** | Displays `0FF0` indicating successful logout before returning to the IDLE state. |

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
| Switch 1 | Enter Deposit Mode |
| KEY1 | Confirm Deposit |
| KEY2 | Logout |


# Project Workflow

The complete operation of the ATM controller is illustrated below.

```text
IDLE
   ↓
Enter PIN
   ↓
Verify PIN
   ↓
Display Account Number
   ↓
Display Current Balance
   ↓
Deposit Amount
   ↓
Update Balance
   ↓
Logout
   ↓
Return to IDLE
```

The controller continuously cycles through these states, providing secure user authentication and deposit functionality using the finite state machine.

---

# Hardware Implementation Results

The proposed ATM controller was synthesized and successfully implemented on the **Altera DE2-115 FPGA Development Board**. The following figures demonstrate the operation of the controller for a complete user transaction.

---

## Fig 6.0: Displays Value set in IDLE condition

<p align="center">
<img src="images/Displays Value set in IDLE condition.png" width="550">
</p>

After power-up or reset, the ATM enters the **IDLE** state and displays the default value **0272**, indicating that the system is ready for user authentication.

---

## Fig 6.1: Account number of User 0 (as PIN 010 is entered)

<p align="center">
<img src="images/Account number of User 0 (as PIN 010 is entered).png" width="550">
</p>

When the user enters the valid PIN **010**, the ATM authenticates **User 0** and displays the corresponding account number **1414**.

---

## Fig 6.2: Initial Balance of User 0

<p align="center">
<img src="images/Initial Balance of User 0.png" width="550">
</p>

After successful authentication, the ATM displays the initial account balance of **₹150** for User 0.

---

## Fig 6.3: Deposition of 200 rupees to User 0 account

<p align="center">
<img src="images/Deposition of 200 rupees to User 0 account.png" width="550">
</p>

The user selects **₹200** using the deposit switches and confirms the transaction using the push button.

---

## Fig 6.4: Updated Balance

<p align="center">
<img src="images/Updated Balance(1).png" width="550">
</p>

Following the successful deposit operation, the ATM updates the account balance and displays the new balance of **₹350**.

---

## Fig 6.5: Logout (Display refreshed)

<p align="center">
<img src="images/Logout (Display refreshed).png" width="550">
</p>

Finally, the logout operation is completed successfully, and the ATM returns to the **IDLE** state, ready for the next transaction.

---

# Why Altera DE2-115?

The **Altera DE2-115 FPGA Development Board** provides an ideal platform for implementing digital systems using Verilog HDL. The Cyclone IV E FPGA offers sufficient logic resources, embedded memory blocks, and a rich set of on-board peripherals including toggle switches, push buttons, and multiple seven-segment displays.

The integrated **50 MHz** system clock simplifies the implementation of accurate timing circuits such as the four-second timer used for state transitions. The board also provides flexibility for future enhancements, making it suitable for educational and prototyping applications.

---

# Future Enhancements

The current design demonstrates the basic functionality of an ATM controller. Several enhancements can be incorporated to extend its capabilities:

- Withdrawal functionality
- Balance enquiry operation
- Multi-user support with optimized memory usage
- PIN retry counter for improved security
- EEPROM/BRAM-based account storage
- LCD or OLED display interface
- Secure PIN encryption
- Transaction history logging

---

# Tools Used

- Verilog HDL
- Intel Quartus Prime
- ModelSim
- Altera DE2-115 FPGA Development Board

---

# Repository Contents

- Verilog RTL source files
- Testbench
- FSM design
- Hardware implementation results
- Project documentation
- GitHub README

---

# Author

**Shweta Sankri**

M.Tech – VLSI Design

---

# License

This project is intended for **educational and academic purposes**.

---

## Acknowledgement

This project was developed as part of the **Digital System Design using FPGA** coursework to demonstrate the implementation of a finite state machine-based ATM controller using Verilog HDL on the Altera DE2-115 FPGA development board.