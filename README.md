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

## 📁 Project List

## ⚙️ 01. 4-bit ALU  
A 4-bit Arithmetic Logic Unit (ALU) designed in Verilog to perform multiple arithmetic and logical operations such as addition, subtraction, AND, OR, and shift operations. It also produces essential flags like zero, carry, and overflow. This project demonstrates how digital arithmetic circuits are modeled, tested, and verified using Verilog HDL.

## 🚦 02. Traffic Signal Controller  
A finite state machine (FSM)-based Verilog design that controls a two-way traffic junction. The controller assigns green signals to the main road by default and switches to the side road when the vehicle sensor detects traffic. Once the side road is clear, the system returns to the main road. This project models real-world traffic logic through sequential state transitions.

## 🥤 03. Vending Machine Controller  
A coin-operated vending machine controller implemented using a state machine in Verilog. It accepts ₹5 and ₹10 coins, and when the total reaches ₹15, it dispenses a product (like a can of Coke). The design does not return change, showcasing how transaction logic and sequence control can be realized in digital circuits.

## 🔐 04. Digital Lock System  
An electronic combination lock built using Verilog HDL. The lock opens only when the correct sequence **01011** is entered through two input buttons (0 and 1). Any wrong input resets the sequence, and a reset button brings the system back to its initial locked state. This circuit models digital authentication and sequential verification logic.

## 🚉 05. Automated Railway Signalling System  
A railway signal control system designed using a finite state machine. It manages four sequential signals (A, B, C, D) for trains passing along a single track. The module transitions through red, yellow, double-yellow, and green based on the presence of a train, ensuring safe railway operation. Inputs include a train detection sensor and reset/clock signals.

## 👶 06. Baby Monitoring System  
A baby monitoring circuit built in Verilog that simulates basic monitoring features like movement, sound, or temperature detection. When unusual activity is sensed, it triggers an alarm signal. This project demonstrates how sensor-driven safety systems can be modeled digitally using behavioral and structural Verilog.

## ➕ 07. Ripple Carry Adder (2-Stage)  
A 2-stage ripple-carry adder implemented in Verilog. It performs binary addition by cascading full adders where each stage’s carry ripples to the next. The project helps understand delay propagation, hierarchical design, and modular arithmetic circuit construction using Verilog.

## 🔄 08. I2C Master & Slave  
Complete I2C communication system with both master and slave modules written in Verilog. It handles start/stop conditions, ACK/NACK generation, and bidirectional data transfer. This project simulates serial communication between two devices using I2C protocol logic implemented at the register-transfer level.

## 🔁 09. SPI Master-Slave  
Verilog implementation of the Serial Peripheral Interface (SPI) protocol supporting full-duplex communication between master and slave devices. The design includes chip-select control, clock polarity/phase (CPOL/CPHA) handling, and multi-byte data exchange. It models realistic embedded SPI bus timing and signal interactions.

## 📦 10. Synchronous FIFO Buffer  
A Synchronous FIFO (First-In-First-Out) buffer designed using Verilog HDL. It manages data storage and retrieval using read/write pointers, along with full and empty flag generation. The design synchronizes all operations to a single clock domain, ensuring reliable and ordered data transfer between two digital systems.


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
