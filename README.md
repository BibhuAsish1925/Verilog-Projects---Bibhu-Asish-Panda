<h1 align="center"> Verilog-Projects---Bibhu-Asish-Panda </h1>

<p align="center">
  <b>Made by</b><br>
  <span style="font-size:80px"> <b>Bibhu Asish Panda</b> </span><br>
  🎓 Batch 2022–26, Silicon University, Bhubaneswar (BBSR)  
</p>

<p align="center">
  LinkedIn: www.linkedin.com/in/bibhu-asish-panda-05332b288
</p>

---

This repository contains Verilog codes for basic digital circuits, useful for both **academic learning** and **interview preparation**.

Welcome to my collection of Digital VLSI (DVLSI) design projects. This repository contains RTL-level designs, testbenches, and simulation setups for various digital systems implemented using Verilog HDL. Each project is organized in its own folder with well-structured source files.

---

## 📁 Project List

### 1. 🚦 Traffic Signal Controller
A finite state machine (FSM)-based design that simulates a traffic signal system with proper state transitions for red, yellow, and green lights based on a timing schedule or sensor inputs. A traffic light controller, will control the main road and the side road.
 • Atnormal condition the main road will get green signal.
 • Whenever there will be vehicles on the side road the sensor will detect and the
 side road will get green signal.
 • Once the side road will be empty, then again the main road will get a green
 signal

- **Files Included:** RTL design, testbench
- **Tools Used:** Xilinx/Vivado or EDA playground

---

### 2. 🔐 Digital Lock System
A secure digital lock mechanism designed using a combination of state machines and logic gates. Unlocks only when the correct sequence of inputs is given. To build an electronic combination lock with a reset button, two number 
buttons (0 and 1), and an unlock output. The combination should be 01011

- **Files Included:** RTL design, testbench
- **Features:** Supports reset, wrong attempts tracking
- **Tools Used:** Xilinx/Vivado or EDA playground

---

### 3. 🛒 Vending Machine Controller
A FSM-based vending machine system that accepts inputs (coins), checks for the amount, and dispenses the selected item if the balance is sufficient.  A vending machine, accepts only two coins, 5 rupee and 10 rupee. Whenever total of coins equal to 15 rupee, then a can of coke will be given. It will not return any residual coin, if total of rupees exceeds 15.

- **Files Included:** RTL design, testbench
- **Features:** Balance check, item dispense logic
- **Tools Used:** Xilinx/Vivado or EDA playground
  
---

### 4. 🛤️ Automated Railway Signaling System
This Verilog module simulates an automatic railway signaling system using a finite state machine (FSM). It controls four sequential signals (a, b, c, d) along a single track, transitioning through red, yellow, double yellow, and green states based on train detection (x). The FSM progresses through seven states (s0 to s6) with timed delays to mimic real-world signal behavior. Reset (clr) initializes the system, and clock (clk) drives the transitions.

- **Files Included:** RTL design, testbench
- **Features:** Sequencial signal change in 4 signals when a train passes
- **Tools Used:** Xilinx/Vivado or EDA playground

---

## 📂 Folder Structure

Each project folder contains:
- `design.v` – The Verilog RTL code
- `tb.v` – The testbench to verify the design
- Optionally: waveform outputs, simulation logs

---

## 🛠 Tools Used
- Verilog HDL
- EDA playground / Vivado
- Git & GitHub for version control

---

## 📌 Notes
These projects were created as part of the DVLSI coursework and personal practice to strengthen Verilog and digital design fundamentals.

---

## 🤝 Connect with Me
- 📧 Email: [bibhuap1925@gmail.com]
- 🔗 LinkedIn: [www.linkedin.com/in/bibhu-asish-panda-05332b288]
