<h1 align="center"> Verilog-Projects---Bibhu-Asish-Panda </h1>

<p align="center">
  <b>Made by</b><br>
  <span style="font-size:80px"> <b>Bibhu Asish Panda</b> </span><br>
  🎓 Batch 2022–26, Silicon University, Bhubaneswar (BBSR)  
</p>

<p align="center">
  LinkedIn: www.linkedin.com/in/bibhu-asish-panda-05332b288
</p>

Welcome to my collection of Digital VLSI (DVLSI) design projects. This repository contains RTL-level designs, testbenches, and simulation setups for various digital systems implemented using Verilog HDL. Each project is organized in its own folder with well-structured source files.

---
---

## 💡 Project List

---

### ⚙️ 01. 4-bit ALU  
A 4-bit Arithmetic Logic Unit (ALU) designed in Verilog to perform basic arithmetic and logic operations. It showcases how combinational and sequential logic can be combined to implement a compact processing block.  
**🔹 Features:**  
- Performs addition, subtraction, AND, OR, XOR operations.  
- Generates status flags such as carry, zero, and overflow.  
- Modular design, reusable in larger processor architectures.  
- Demonstrates gate-level and behavioral modeling in Verilog.

---

### 🚦 02. Traffic Signal Controller  
A finite state machine (FSM)-based Verilog project that models a two-way traffic light control system with timing and sensor-based logic.  
**🔹 Features:**  
- Uses FSM for smooth light transition between main and side roads.  
- Includes sensor input for real-time vehicle detection.  
- Automatically prioritizes main road when side road is empty.  
- Provides safe and continuous traffic flow through controlled sequencing.

---

### 🥤 03. Vending Machine Controller  
A simple coin-operated vending machine implemented using Verilog FSM. It handles the acceptance of ₹5 and ₹10 coins and dispenses an item worth ₹15.  
**🔹 Features:**  
- Detects and accumulates coin input values.  
- Dispenses the product when total equals ₹15.  
- Ignores additional inputs once item is dispensed.  
- Models real-world transaction logic using state transitions.

---

### 🔐 04. Digital Lock System  
An electronic combination lock system designed in Verilog that unlocks only upon entering the correct binary sequence “01011”.  
**🔹 Features:**  
- Uses sequential logic to detect correct input sequence.  
- Reset functionality to return to initial locked state.  
- Rejects incorrect input and restarts automatically.  
- Demonstrates digital security logic through FSM design.

---

### 🚉 05. Automated Railway Signalling System  
A railway signal automation system implemented using a finite state machine (FSM) that ensures safe train movement along a single track.  
**🔹 Features:**  
- Controls four signal lights: Red, Yellow, Double Yellow, and Green.  
- Detects train presence using sensor input (`x`).  
- Incorporates timed state transitions for real-world accuracy.  
- Prevents signal conflicts to maintain train safety.

---

### 👶 06. Baby Monitoring System  
A Verilog-based baby monitoring system that triggers an alarm upon detecting irregular behavior such as movement or sound.  
**🔹 Features:**  
- Detects simulated sound/motion input signals.  
- Generates an alarm output for abnormal activity.  
- Includes reset and status indication logic.  
- Demonstrates event-driven monitoring logic in hardware form.

---

### ➕ 07. Ripple Carry Adder (2-Stage)  
A 2-stage ripple carry adder constructed using full adders connected in cascade to perform binary addition.  
**🔹 Features:**  
- Adds two 4-bit binary numbers sequentially.  
- Uses two-stage carry propagation for timing improvement.  
- Highlights carry ripple delay and propagation behavior.  
- Ideal example of hierarchical arithmetic circuit design.

---

### 🔄 08. I2C Master & Slave  
A complete I2C communication model in Verilog with both master and slave modules for bidirectional serial data exchange.  
**🔹 Features:**  
- Handles start, stop, and acknowledge conditions.  
- Supports byte-level read/write data transfer.  
- Implements clock stretching and synchronization.  
- Demonstrates serial communication between digital devices.

---

### 🔁 09. SPI Master-Slave  
Serial Peripheral Interface (SPI) protocol design featuring master and slave Verilog modules that exchange data over synchronous serial lines.  
**🔹 Features:**  
- Supports full-duplex data transmission.  
- Configurable CPOL and CPHA communication modes.  
- Includes chip select (SS) control and multiple-byte transfer.  
- Simulates realistic SPI timing and synchronization behavior.

---

### 📦 10. Synchronous FIFO Buffer  
A Verilog-based First-In-First-Out (FIFO) memory structure used to temporarily store data between producer and consumer systems operating under the same clock domain.  
**🔹 Features:**  
- Parameterized depth and width configuration.  
- Generates **Full** and **Empty** status flags.  
- Implements pointer-based read/write management.  
- Ensures ordered and synchronized data flow between modules.

---
---

## 📂 Folder Structure

Each project folder contains:
- `design.v` – The Verilog RTL code
- `tb.v` – The testbench to verify the design
- waveform outputs, schematic diagram

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
