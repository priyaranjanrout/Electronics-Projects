# Two-Stage CMOS Operational Amplifier

**Designed and Simulated using Cadence Virtuoso**

A two-stage CMOS operational amplifier designed at transistor level and simulated in **Cadence Virtuoso**. The project focuses on achieving high DC gain, adequate bandwidth, stable frequency response, and improved transient performance through compensation techniques.

## 📌 Project Overview

The op-amp uses a **two-stage CMOS architecture** consisting of a differential input stage followed by a common-source gain stage. **Miller compensation with a nulling resistor** is incorporated to improve stability and control the frequency response.

The design was analyzed through AC, DC, and transient simulations to evaluate key analog performance parameters.

## 🎯 Key Specifications

| Parameter              |                             Achieved Value |
| ---------------------- | -----------------------------------------: |
| DC Gain                |                                  **71 dB** |
| Gain-Bandwidth Product |                                 **11 MHz** |
| Phase Margin           |                                    **45°** |
| Slew Rate              |                                **20 V/µs** |
| Architecture           |                  **Two-Stage CMOS Op-Amp** |
| Compensation           | **Miller Compensation + Nulling Resistor** |
| Design Tool            |                       **Cadence Virtuoso** |

## 🔧 Design Highlights

* Designed a **two-stage CMOS operational amplifier** at transistor level.
* Achieved approximately **71 dB open-loop DC gain**.
* Obtained **11 MHz gain-bandwidth product** with a **45° phase margin**.
* Achieved a **20 V/µs slew rate** through transient analysis.
* Implemented **Miller compensation with a nulling resistor** to improve stability and frequency response.
* Analyzed the effect of circuit parameters on **gain and frequency response**.
* Evaluated the design using **DC, AC, and transient simulations** in Cadence Virtuoso.

## 📊 Simulation Analysis

### DC Analysis

Used to evaluate the operating points and verify proper biasing of the MOSFETs in the two-stage amplifier.

### AC Analysis

Used to extract:

* DC gain
* Gain-bandwidth product
* Phase margin
* Frequency response

### Transient Analysis

Used to evaluate the large-signal response and determine the **slew rate** of the amplifier.

## 🧩 Compensation Technique

A **Miller compensation capacitor** is used between the first and second gain stages to introduce pole separation and improve stability.

A **nulling resistor** is incorporated with the compensation network to control the unwanted zero introduced by Miller compensation, improving the overall frequency response.

## 🛠️ Tools & Technologies

* **Cadence Virtuoso**
* CMOS Analog Circuit Design
* Transistor-Level Simulation
* AC / DC / Transient Analysis
* Miller Compensation
* Frequency Response Analysis

## 📁 Project Contents

```text
Two Stage OpAmp/
├── Schematic/
├── Simulation/
├── Results/
└── README.md
```

*Folder structure may vary depending on the Cadence project files uploaded to the repository.*

## 🔗 GitHub Repository

[Two-Stage Op-Amp — GitHub Repository](https://github.com/priyaranjanrout/Electronics-Projects/tree/main/Two%20Stage%20OpAmp?utm_source=chatgpt.com)

## 👨‍💻 Author

**Priyaranjan Rout**

B.Tech Electrical Engineering
NIT Rourkela
