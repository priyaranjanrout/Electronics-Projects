# 2-Stage CMOS Operational Amplifier

**December 2025**
**Cadence Virtuoso | CMOS Analog Design**

A two-stage CMOS operational amplifier designed and simulated in **Cadence Virtuoso**, focusing on high DC gain, gain-bandwidth, phase margin, slew rate, and frequency stability. Miller compensation with a nulling resistor was incorporated to improve closed-loop stability and frequency response.

---

## 📌 Project Overview

The objective of this project was to design a **two-stage CMOS operational amplifier** capable of providing high voltage gain while maintaining adequate bandwidth and phase margin.

The op-amp consists of:

* **Differential input stage** for input signal amplification and common-mode rejection
* **Active current-mirror load** for differential-to-single-ended conversion and increased gain
* **Second gain stage** for additional voltage amplification
* **Miller compensation network** for frequency compensation and stability
* **Nulling resistor** to improve the location of the compensation zero and phase response
* **Biasing circuitry** to establish appropriate operating currents

---

## 🛠️ Design & Simulation Environment

| Parameter        | Details                                |
| ---------------- | -------------------------------------- |
| **Design Tool**  | Cadence Virtuoso                       |
| **Design Type**  | Analog CMOS                            |
| **Architecture** | Two-Stage Operational Amplifier        |
| **Simulation**   | AC / Transient Analysis                |
| **Technology**   | CMOS                                   |
| **Compensation** | Miller Compensation + Nulling Resistor |

---

## 📐 Circuit Schematic

The complete two-stage CMOS operational amplifier schematic was designed and simulated in Cadence Virtuoso.

![Two Stage Op-Amp Schematic](./images/schematic.png)

> **Schematic:** Two-stage CMOS op-amp with differential input stage, current-mirror load, second gain stage, biasing network, and Miller compensation.

---

## 📊 Key Performance Specifications

| Specification                    |                Achieved Value |
| -------------------------------- | ----------------------------: |
| **DC Gain**                      |                     **71 dB** |
| **Gain-Bandwidth Product (GBW)** |                    **11 MHz** |
| **Phase Margin**                 |                       **45°** |
| **Slew Rate**                    |                   **20 V/µs** |
| **Compensation**                 | **Miller + Nulling Resistor** |

---

## 📈 AC Analysis

AC analysis was performed to evaluate the **open-loop gain and frequency response** of the operational amplifier.

The simulation was used to extract:

* DC open-loop gain
* Gain-bandwidth product
* Unity-gain frequency
* Phase margin
* Frequency response and stability

![AC Response](./images/ac_response.png)

### Observed Response

The simulated amplifier achieved approximately:

* **71 dB** DC voltage gain
* **11 MHz** gain-bandwidth product
* **45°** phase margin

The frequency response demonstrates the effect of Miller compensation in controlling the dominant pole and improving the stability of the amplifier.

---

## ⚡ Transient / Slew Rate Analysis

Transient analysis was performed by applying a large-signal input to evaluate the amplifier's large-signal settling behavior and slew-rate limitation.

![Transient Response](./images/transient_response.png)

The measured slew rate was approximately:

**Slew Rate ≈ 20 V/µs**

The transient response was used to evaluate the amplifier's ability to respond rapidly to large input-signal transitions.

---

## 🔧 Miller Compensation

A **Miller compensation capacitor** was introduced between the first and second gain stages to improve frequency stability.

A **nulling resistor** was incorporated with the compensation capacitor to control the compensation zero and improve the phase response.

The compensation network helps:

* Establish a dominant pole
* Improve phase margin
* Control the unity-gain frequency
* Reduce the possibility of instability
* Improve frequency response

---

## 🔍 Parameter Sensitivity Analysis

The design was further analyzed by varying important circuit parameters and observing their impact on amplifier performance.

Parameters investigated included:

* Compensation components
* Bias currents
* Transistor sizing
* Load conditions
* Gain-stage parameters

This analysis helped evaluate the **robustness of the op-amp design** and understand the trade-offs between gain, bandwidth, stability, and slew rate.

---

## 🎯 Key Takeaways

* Designed a **two-stage CMOS operational amplifier** from transistor-level circuitry.
* Achieved **71 dB open-loop gain** and **11 MHz GBW**.
* Obtained **45° phase margin** through frequency compensation.
* Achieved approximately **20 V/µs slew rate** in transient simulation.
* Implemented **Miller compensation with a nulling resistor**.
* Studied the effect of circuit parameters on **gain, bandwidth, and stability**.
* Gained practical experience with **analog CMOS design and Cadence Virtuoso simulation**.

---

## 📁 Repository Structure

```text
Two Stage OpAmp/
│
├── README.md
├── Schematic/
│   └── opamp_schematic.png
│
├── Simulation/
│   ├── ac_response.png
│   └── transient_response.png
│
└── Cadence/
    └── design_files/
```

> **Note:** Update the image paths above to match the actual filenames and folders in your repository.

---

## 🔗 Project Repository

**GitHub:**
https://github.com/priyaranjanrout/Electronics-Projects/tree/main/Two%20Stage%20OpAmp

---

## 👨‍💻 Project Summary

**2-Stage CMOS Operational Amplifier | Cadence Virtuoso | December 2025**

Designed and simulated a two-stage CMOS op-amp achieving **71 dB gain, 11 MHz GBW, 45° phase margin, and 20 V/µs slew rate**. Improved stability and frequency response using **Miller compensation with a nulling resistor**, while analyzing gain sensitivity across key circuit parameters.
