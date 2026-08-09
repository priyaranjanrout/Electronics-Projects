5-Stage Current-Starved Ring Oscillator

Project Date: January 2026Tool: Cadence Virtuoso

Overview

Designed and simulated a 5-stage current-starved ring oscillator using CMOS inverter stages with current-starving transistors and current-mirror-based biasing. The oscillator was designed to provide a tunable output frequency in the 30–70 MHz range by varying the control voltage.

The project focuses on understanding oscillator operation, current-starved delay control, frequency tuning, transient response, and AC response using Cadence Virtuoso.

Key Specifications

Parameter

Result

Architecture

5-Stage Current-Starved Ring Oscillator

Simulation Tool

Cadence Virtuoso

Target Frequency Range

30–70 MHz

Tuning Gain

60–90 MHz/V

Supply Voltage

1.8 V

Output Swing

Near rail-to-rail

Stage Output Capacitance

10 fF

Biasing

Current Mirrors

Transistor Technology

CMOS

Circuit Architecture

The oscillator consists of five cascaded current-starved inverter stages connected in a ring. Each stage uses current-starving devices to control the charging and discharging current of the load capacitance.

A control-voltage-dependent bias circuit and current mirrors are used to establish the current available to each stage. Changing the control voltage changes the stage delay and therefore tunes the oscillation frequency.

For an odd number of inverter stages, the total loop provides the phase inversion required for sustained oscillation.

Simplified Operating Principle

The five inverter stages form a closed feedback loop.

The odd number of inversions produces the required phase shift for oscillation.

Current-starving transistors limit the charging and discharging current.

The control voltage changes the available current.

Higher available current reduces propagation delay and increases oscillation frequency.

The resulting output frequency can therefore be tuned using the control voltage.

Design Highlights

Implemented a 5-stage CMOS current-starved ring oscillator.

Used current mirrors for controlled and consistent bias current.

Designed the oscillator for approximately 30–70 MHz operation.

Achieved a tuning gain of approximately 60–90 MHz/V.

Obtained a near rail-to-rail output voltage swing.

Included approximately 10 fF output parasitic capacitance per stage for simulation.

Verified oscillator behavior using transient analysis.

Evaluated frequency-dependent behavior using AC analysis.

Simulation Results

Transient Response

The transient simulation demonstrates stable periodic oscillation at the output node. The waveform swings approximately between 0.5 V and 1.8 V, showing a large output voltage swing.



AC Response

The AC response was used to evaluate the frequency-dependent behavior of the oscillator/bias network. The simulated response shows the expected variation in gain and phase over frequency.



Schematic

The complete Cadence Virtuoso schematic contains the five current-starved inverter stages, current-mirror bias network, control-voltage source, and capacitive loading.



Frequency Tuning

The oscillation frequency is controlled by the bias/control voltage. The current-starving devices regulate the current supplied to the inverter stages:

Control Voltage ↑ → Bias Current ↑ → Stage Delay ↓ → Oscillation Frequency ↑

The approximate tuning relationship obtained from simulation is:

Tuning Gain ≈ 60–90 MHz/V

with an operating frequency range of approximately:

30 MHz ≤ fOSC ≤ 70 MHz

Design Equation

For an N-stage ring oscillator, the oscillation frequency can be approximated by:

fOSC ≈ 1 / (2N × tpd)

where:

N = number of inverter stages

tpd = propagation delay of each stage

For this design:

N = 5

Therefore, controlling the propagation delay of each current-starved stage directly controls the oscillator frequency.

Tools Used

Cadence Virtuoso – schematic design and circuit simulation

Transient Analysis – oscillator startup and steady-state waveform verification

AC Analysis – frequency response and phase analysis

Skills Demonstrated

CMOS circuit design

Current-starved inverter design

Current mirror biasing

Ring oscillator architecture

Frequency tuning

Transient and AC simulation

Cadence Virtuoso schematic and simulation workflow

Analysis of delay, frequency, phase, and output swing

Project Outcome

Successfully designed and simulated a 5-stage current-starved ring oscillator with a tunable frequency range of approximately 30–70 MHz and a tuning gain of 60–90 MHz/V. The design achieved near rail-to-rail output swing and demonstrated controllable frequency tuning through current-starved biasing.

Repository Contents

Schematic.png – Complete oscillator schematic

Transient respone.png – Transient simulation result

Response.png – AC response result
