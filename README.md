# 1011 Sequence Detector (Moore FSM)

A Verilog design that detects the bit pattern 1011 in a
serial stream, including overlapping matches (e.g. 1011011).

## Files
- design.sv: Moore FSM with 5 states (S0, S1, S10, S101, S1011)
- testbench.sv: self-checking testbench using a shift-register
  reference model
- waveform.png: simulation result (3 detections)

## Simulation
Run on EDA Playground with Icarus Verilog. The log prints PASS
and the waveform shows detected going high 3 times.

## Notes
Small practice design to build SystemVerilog and digital design
fundamentals.
