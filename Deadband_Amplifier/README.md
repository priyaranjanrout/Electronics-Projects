# Dead-Band Amplifier Using Verilog-A

## Project Overview

This project implements a **Dead-Band Amplifier (DBA)** using Verilog-A in Cadence Virtuoso. The amplifier is modeled using analog behavioral modeling to define a piecewise-linear input-output transfer characteristic with a configurable dead-band region.

The output remains at zero when the input voltage lies within a specified threshold range. When the input exceeds the upper threshold or falls below the lower threshold, the amplifier produces a linearly amplified output.

This project demonstrates the application of Verilog-A for behavioral modeling of analog circuits and the simulation of nonlinear transfer characteristics.

## Design Specifications

| Parameter | Value |
|---|---|
| Design | Dead-Band Amplifier |
| Modeling Language | Verilog-A |
| EDA Tool | Cadence Virtuoso |
| Lower Threshold Voltage | -0.5 V |
| Upper Threshold Voltage | +0.5 V |
| Voltage Gain | 1 (Unity Gain) |
| Modeling Approach | Analog Behavioral Modeling |

## Operating Principle

The amplifier operates in three regions:

### 1. Positive Amplification Region

When the input voltage is greater than or equal to the upper threshold voltage:

\[
V_{in} \geq V_{high}
\]

The output is calculated as:

\[
V_{out}=A_v(V_{in}-V_{high})
\]

### 2. Dead-Band Region

When the input voltage lies between the lower and upper threshold voltages:

\[
V_{low}<V_{in}<V_{high}
\]

The output voltage remains zero:

\[
V_{out}=0
\]

### 3. Negative Amplification Region

When the input voltage is less than or equal to the lower threshold voltage:

\[
V_{in}\leq V_{low}
\]

The output is calculated as:

\[
V_{out}=A_v(V_{in}-V_{low})
\]

### Transfer Function

The complete piecewise-linear transfer function is:

\[
V_{out}=
\begin{cases}
A_v(V_{in}-V_{high}), & V_{in}\geq V_{high}\\
0, & V_{low}<V_{in}<V_{high}\\
A_v(V_{in}-V_{low}), & V_{in}\leq V_{low}
\end{cases}
\]

Where:
- \(V_{in}\) = Input voltage
- \(V_{out}\) = Output voltage
- \(V_{low}\) = Lower dead-band threshold
- \(V_{high}\) = Upper dead-band threshold
- \(A_v\) = Voltage gain

## Verilog-A Implementation

```verilog
`include "constants.vams"
`include "disciplines.vams"

module koush_vdba(in, out);

    input in;
    output out;

    electrical in, out;

    parameter real vin_low  = -0.5;
    parameter real vin_high =  0.5;
    parameter real gain = 1 from (0:inf);

    analog begin

        if (V(in) >= vin_high) begin
            V(out) <+ gain * (V(in) - vin_high);
        end
        else if (V(in) <= vin_low) begin
            V(out) <+ gain * (V(in) - vin_low);
        end
        else begin
            V(out) <+ 0;
        end

    end

endmodule
```

## Simulation

The Verilog-A model is intended to be simulated in Cadence Virtuoso using a schematic testbench and ADE.

### Simulation Procedure

1. Create a Verilog-A cell in Cadence Virtuoso.
2. Implement the dead-band amplifier model.
3. Generate the symbol view.
4. Instantiate the amplifier in a testbench schematic.
5. Apply a DC input voltage sweep from -2 V to +2 V.
6. Perform DC analysis using ADE.
7. Plot the output voltage against the input voltage to observe the transfer characteristic.

## Expected Output

For the default gain of 1 and threshold voltages of -0.5 V and +0.5 V:

| Input Voltage (V) | Output Voltage (V) |
|---:|---:|
| -2.0 | -1.5 |
| -1.0 | -0.5 |
| -0.5 | 0 |
| -0.2 | 0 |
| 0 | 0 |
| +0.2 | 0 |
| +0.5 | 0 |
| +1.0 | +0.5 |
| +2.0 | +1.5 |

The expected transfer characteristic consists of a zero-output dead-band region between -0.5 V and +0.5 V, with linear amplification outside the thresholds.

*Note: The values above are analytically calculated from the behavioral model. They are not presented as measured simulation results.*

## Key Features

- Behavioral modeling of a nonlinear analog circuit using Verilog-A.
- Configurable upper and lower dead-band thresholds.
- Adjustable voltage gain through a parameter.
- Piecewise-linear input-output transfer characteristic.
- Continuous output transition at the dead-band boundaries.
- Suitable for DC transfer characteristic analysis in Cadence Virtuoso.

## Learning Outcomes

- Understanding analog behavioral modeling using Verilog-A.
- Implementing conditional analog behavior.
- Defining electrical ports and voltage contributions.
- Modeling nonlinear transfer functions.
- Understanding dead-band behavior and threshold-based amplification.
- Performing DC analysis of analog behavioral models in Cadence Virtuoso.

## Applications

Dead-band characteristics are commonly used in:

- Noise suppression in control systems.
- Error detection and signal conditioning.
- Dead-zone compensation in feedback control systems.
- Threshold-based analog processing.
- Behavioral modeling of nonlinear circuit blocks.

## Future Improvements

Potential extensions to the project include:

- Incorporating finite output saturation limits.
- Modeling finite bandwidth and slew-rate limitations.
- Introducing input and output impedance effects.
- Implementing hysteresis with separate switching thresholds.
- Developing a transistor-level implementation of the dead-band behavior.

## Conclusion

The project demonstrates the implementation of a configurable dead-band amplifier using Verilog-A and Cadence Virtuoso. The behavioral model provides a simple and flexible way to represent nonlinear analog characteristics through parameterized thresholds and gain, making it useful for analog circuit modeling and simulation.
