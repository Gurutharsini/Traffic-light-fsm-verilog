# 🚦 FSM-Based Traffic Light Controller using Verilog HDL

## 📌 Overview

This project implements a **two-road Traffic Light Controller using a Finite State Machine (FSM)** in Verilog HDL.

The controller operates automatically through four predefined states to control the traffic lights for two roads. The design was developed and verified using **Xilinx Vivado** through behavioral simulation and RTL synthesis.

> **No sensors or external controllers are used in this project.**

---

## 🎯 Objective

To design a simple and reliable traffic light controller using **FSM-based RTL design** and verify its functionality through simulation and synthesis.

---

## 🛠️ Tools & Technologies

* **Verilog HDL**
* **Xilinx Vivado**
* **Finite State Machine (FSM)**
* **RTL Design**
* **Behavioral Simulation**
* **Logic Synthesis**

---

## 🔄 FSM Operation

The controller consists of four states:

| State | Road A    | Road B    |
| ----- | --------- | --------- |
| S0    | 🟢 GREEN  | 🔴 RED    |
| S1    | 🟡 YELLOW | 🔴 RED    |
| S2    | 🔴 RED    | 🟢 GREEN  |
| S3    | 🔴 RED    | 🟡 YELLOW |

### State Transition

```text
S0 → S1 → S2 → S3 → S0
```

The traffic sequence is:

```text
Road A GREEN
      ↓
Road A YELLOW
      ↓
Road B GREEN
      ↓
Road B YELLOW
      ↓
Repeat
```

---

## 🧠 FSM Architecture

The design consists of three major blocks:

### 1. State Register

Stores the current state and changes state based on the clock.

### 2. Next-State Logic

Determines the next FSM state based on the current state.

### 3. Output Logic

Controls the red, yellow, and green signals according to the current state.

```text
                 ┌──────────────────┐
                 │  Next-State      │
                 │     Logic        │
                 └────────┬─────────┘
                          ↓
                    Next State
                          ↓
Clock ───────────► ┌──────────────┐
                   │ State        │
                   │ Register     │
                   └──────┬───────┘
                          ↓
                    Current State
                          ↓
                   ┌──────────────┐
                   │ Output Logic │
                   └──────┬───────┘
                          ↓
                 Traffic Light Outputs
```

---

## 🔌 Inputs

| Signal | Description        |
| ------ | ------------------ |
| `clk`  | Clock input        |
| `rst`  | Asynchronous reset |

## 💡 Outputs

| Signal     | Description         |
| ---------- | ------------------- |
| `A_red`    | Road A red light    |
| `A_yellow` | Road A yellow light |
| `A_green`  | Road A green light  |
| `B_red`    | Road B red light    |
| `B_yellow` | Road B yellow light |
| `B_green`  | Road B green light  |

---

## 📂 Project Structure

```text
traffic-light-fsm-verilog/
│
├── src/
│   └── traffic_light_fsm.v
│
├── tb/
│   └── traffic_light_fsmtb.v
│
├── screenshots/
│   ├── waveform.png
│   ├── rtl_schematic.png
│   └── utilization.png
│
└── README.md
```

---

## 🧪 Simulation

A Verilog testbench was created to generate the clock and reset signals and verify the FSM operation.

The expected sequence is:

```text
S0 → S1 → S2 → S3 → S0
```

Corresponding traffic signals:

```text
A GREEN  + B RED
      ↓
A YELLOW + B RED
      ↓
A RED    + B GREEN
      ↓
A RED    + B YELLOW
      ↓
Repeat
```

### Simulation Waveform

![Simulation Waveform](waveform.png)

---

## ⚙️ Synthesis

The RTL design was successfully synthesized using **Xilinx Vivado**.

The synthesized design contains logic elements such as:

* LUTs
* Flip-Flops
* Combinational logic
* I/O resources

### RTL Schematic

![RTL Schematic](synthesis.png)

---

## 📊 Resource Utilization

The synthesized design was analyzed using the Vivado Utilization Report.

| Resource  | Used | Available | Utilization |
| --------- | ---: | --------: | ----------: |
| LUT       |    2 |    63,400 |       0.00% |
| Flip-Flop |    4 |   126,800 |       0.00% |
| I/O       |    8 |       210 |       3.81% |

### Utilization Report

![Utilization Report](utilization.png)

The design requires very few FPGA resources because it is a small FSM-based digital controller.

---

## ✅ Results

* Successfully designed a traffic light controller using Verilog HDL.
* Implemented the controller using a finite state machine.
* Verified the state transitions through behavioral simulation.
* Obtained the expected traffic light sequence in the simulation waveform.
* Successfully synthesized the RTL design using Vivado.
* Verified the synthesized hardware using the RTL schematic.
* Analyzed FPGA resource utilization.

---

## 🚀 Future Enhancements

The basic controller can be extended with:

* ⏱️ Counter-based timing for each traffic state
* 🚶 Pedestrian crossing control
* 🚑 Emergency vehicle priority
* 🚦 Multiple traffic junctions
* 🔋 Low-power FSM optimization

---

## 👩‍💻 Author

**Gurutharsini N**

Electronics and Communication Engineering
Kongu Engineering College

---

## ⭐ Key Learning

This project helped demonstrate the complete RTL design flow:

```text
FSM Design
    ↓
Verilog HDL
    ↓
Testbench
    ↓
Behavioral Simulation
    ↓
Waveform Verification
    ↓
Synthesis
    ↓
RTL Schematic
    ↓
Resource Utilization
```
