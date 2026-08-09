# 2-Stage CMOS Operational Amplifier

**December 2025 | Cadence Virtuoso | Analog CMOS Design**

A transistor-level **two-stage CMOS operational amplifier** designed and simulated in **Cadence Virtuoso**, targeting high DC gain, gain-bandwidth, phase margin, and slew rate. The design uses **Miller compensation with a nulling resistor** to improve frequency stability and phase response.

---

## 📌 Project Overview

The objective of this project was to design and analyze a two-stage CMOS op-amp with high voltage gain while maintaining adequate bandwidth and stability.

### Key Design Features

* Differential input stage for voltage amplification and common-mode rejection
* Active current-mirror load for differential-to-single-ended conversion
* Second gain stage for additional voltage amplification
* Miller compensation for frequency stability
* Nulling resistor for compensation-zero control
* Biasing circuitry for proper transistor operating points
* AC and transient simulations for performance evaluation

---

## 🛠️ Design & Simulation

| Parameter        | Details                                |
| ---------------- | -------------------------------------- |
| **Design Tool**  | Cadence Virtuoso                       |
| **Design Type**  | Analog CMOS                            |
| **Architecture** | Two-Stage Operational Amplifier        |
| **Technology**   | CMOS                                   |
| **Analysis**     | AC & Transient                         |
| **Compensation** | Miller Compensation + Nulling Resistor |

---

## 📐 Circuit Schematic

The complete transistor-level two-stage CMOS operational amplifier was designed in Cadence Virtuoso.

![2-Stage CMOS Op-Amp Schematic](2_stage_opamp_ckt.png)

**Circuit includes:** differential input stage, current-mirror load, second gain stage, bias circuitry, and Miller compensation network.

---

## 📊 Key Performance Results

| Specification                    |                Achieved Value |
| -------------------------------- | ----------------------------: |
| **DC Gain**                      |                     **71 dB** |
| **Gain-Bandwidth Product (GBW)** |                    **11 MHz** |
| **Phase Margin**                 |                       **45°** |
| **Slew Rate**                    |                   **20 V/µs** |
| **Compensation**                 | **Miller + Nulling Resistor** |

---

## 📈 AC Analysis

AC analysis was performed to evaluate the open-loop frequency response, DC gain, gain-bandwidth product, unity-gain frequency, and phase margin.

### Simulated Response

![Op-Amp Simulation Response](response.png)

The simulation achieved approximately:

* **71 dB DC voltage gain**
* **11 MHz GBW**
* **45° phase margin**

The frequency response demonstrates the effect of Miller compensation in establishing a dominant pole and improving amplifier stability.

---

## ⚡ Transient & Slew Rate Analysis

Transient analysis was used to evaluate the large-signal response and slew-rate limitation of the amplifier.

The measured slew rate was approximately:

**20 V/µs**

This analysis verifies the amplifier's ability to respond to large input-signal transitions while maintaining the desired output response.

---

## 🔧 Miller Compensation

A Miller compensation capacitor was introduced between the first and second gain stages to improve frequency stability.

A **nulling resistor** was incorporated with the compensation capacitor to control the compensation zero and improve the phase response.

### Compensation Objectives

* Establish a dominant pole
* Improve phase margin
* Control unity-gain frequency
* Reduce instability
* Improve overall frequency response

---

## 🔍 Parameter Sensitivity Analysis

The design was further analyzed by varying key circuit parameters and observing their effect on amplifier performance.

Parameters investigated included:

* Compensation components
* Bias currents
* Transistor sizing
* Load conditions
* Gain-stage parameters

This analysis helped evaluate design robustness and understand the trade-offs between:

**Gain ↔ Bandwidth ↔ Stability ↔ Slew Rate**

---

## 🎯 Key Takeaways

* Designed a **two-stage CMOS operational amplifier** at transistor level.
* Achieved **71 dB open-loop gain** and **11 MHz GBW**.
* Obtained **45° phase margin** through frequency compensation.
* Achieved approximately **20 V/µs slew rate**.
* Implemented **Miller compensation with a nulling resistor**.
* Studied parameter sensitivity and its impact on gain, bandwidth, and stability.
* Gained practical experience in **analog CMOS circuit design and Cadence Virtuoso simulation**.

---

## 📁 Repository Contents

```text
Two Stage OpAmp/
│
├── README.md
├── 2_stage_opamp_ckt.png
└── response.png
```

---

## 🔗 Project Repository

[View the complete project on GitHub](https://github.com/priyaranjanrout/Electronics-Projects/tree/main/Two%20Stage%20OpAmp)

---

## 📌 Project Summary

**2-Stage CMOS Operational Amplifier | Cadence Virtuoso | December 2025**

Designed and simulated a two-stage CMOS op-amp achieving **71 dB gain, 11 MHz GBW, 45° phase margin, and 20 V/µs slew rate**. Improved stability and frequency response using **Miller compensation with a nulling resistor**, while analyzing gain sensitivity across key circuit parameters.
