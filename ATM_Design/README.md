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
- Four-second timer for controlled state transitions
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
<img src="Images/State Machine Diagram for proposed system.png" width="850">
</p>

<p align="center">
<b>Fig 2.0:</b> State Machine Diagram for proposed system
</p>

The FSM controls the complete ATM operation by handling user authentication, account display, balance display, deposit transactions, balance updates, and logout functionality.

---

# FSM State Description

| State | Description |
|--------|-------------|
| **IDLE** | Displays the default value **0272** (generated from the internal value `16'h0110`) and waits for the timer to expire before entering the PIN state. |
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

---


```

The controller continuously cycles through these states, providing secure user authentication and deposit functionality.

---

# Hardware Implementation Results

The proposed ATM controller was successfully synthesized and implemented on the **Altera DE2-115 FPGA Development Board**. The following figures demonstrate the complete operation of the ATM controller.

---

## Fig 6.0: Displays Value set in IDLE condition

<p align="center">
<img src="Images/Displays Value set in IDLE condition.png" width="550">
</p>

The controller enters the **IDLE** state after reset and displays the default value **0272**, indicating that the system is ready for user authentication.

---

## Fig 6.1: Account number of User 0 (as PIN 010 is entered)

<p align="center">
<img src="Images/Account number of User 0 (as PIN 010 is entered).png" width="550">
</p>

After entering the valid PIN **010**, the ATM authenticates **User 0** and displays the corresponding account number **1414**.

---

## Fig 6.2: Initial Balance of User 0

<p align="center">
<img src="Images/Initial Balance of User 0.png" width="550">
</p>

The current account balance (**₹150**) of User 0 is displayed before performing any transaction.

---

## Fig 6.3: Deposition of 200 rupees to User 0 account

<p align="center">
<img src="Images/Deposition of 200 rupees to User 0 account.png" width="550">
</p>

The user selects a deposit amount of **₹200** using the toggle switches and confirms the transaction using the push button.

---

## Fig 6.4: Updated Balance

<p align="center">
<img src="Images/Updated Balance.png" width="550">
</p>

The ATM updates the user's account balance and displays the new balance (**₹350**) after the deposit operation.

---

## Fig 6.5: Logout (Display refreshed)

<p align="center">
<img src="Images/Logout (Display refreshed).png" width="550">
</p>

After completing the transaction, the controller logs out the current user and returns to the **IDLE** state, making the ATM ready for the next user.

---
# Why Altera DE2-115?

The **Altera DE2-115 FPGA Development Board** provides an ideal platform for implementing digital systems using Verilog HDL. Its Cyclone IV E FPGA offers sufficient logic resources, embedded memory blocks, and a rich set of on-board peripherals including toggle switches, push buttons, LCD display, and multiple seven-segment displays.

The integrated **50 MHz** system clock simplifies the implementation of timing circuits such as the four-second timer used in this project. The board also provides ample resources for extending the design with additional ATM functionalities.

---

# Applications

The proposed ATM controller can be used for:

- Digital System Design laboratories
- FPGA-based embedded system projects
- Finite State Machine (FSM) demonstrations
- Verilog HDL learning and academic projects
- ATM controller prototyping
- VLSI and FPGA coursework

---


---

# Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | Hardware Description Language |
| Intel Quartus Prime | Design Entry, Synthesis and FPGA Programming |
| ModelSim | Functional Simulation |
| Altera DE2-115 FPGA | Hardware Implementation |



# Getting Started

1. Clone the repository.

```bash
git clone https://github.com/<your-username>/<repository-name>.git
```

2. Open the project using **Intel Quartus Prime**.

3. Compile the design.

4. Program the generated `.sof` file onto the **Altera DE2-115 FPGA Development Board**.

5. Use the toggle switches and push buttons to interact with the ATM controller.

---

# Author

**Shweta Sankri**

M.Tech – VLSI Design



# Acknowledgement

This project was developed as part of the **Digital System Design using FPGA** coursework to demonstrate the implementation of a **Finite State Machine (FSM)-based ATM Controller** using **Verilog HDL** on the **Altera DE2-115 FPGA Development Board**.

