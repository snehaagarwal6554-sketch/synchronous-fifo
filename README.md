# Synchronous FIFO in Verilog

## Overview
This project implements a Synchronous FIFO (First-In, First-Out) using Verilog HDL. The design supports synchronous read and write operations with status flags indicating when the FIFO is full or empty.

## Features
- Synchronous read and write operations
- Active-high reset
- Full and Empty status flags
- FIFO depth of 8 entries
- Verilog testbench for functional verification

## Files
- `syn_fifo.v` – Verilog implementation of the synchronous FIFO
- `syn_fifo_tb.v` – Testbench for simulation and verification
- `Screenshot (110).png` – Simulation output

## Tools Used
- Verilog HDL
- EDA Playground
- Icarus Verilog
- GitHub

## Simulation
The testbench verifies:
- FIFO write operation
- FIFO read operation
- Reset functionality
- Full and Empty flag behavior

## Author
Sneha Agarwal
