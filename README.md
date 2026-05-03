# 🔊 7th-Order Butterworth Low-Pass Filter Design — Analog Circuits & Sensor Systems

Design and simulation of a 7th-order Butterworth low-pass filter using Sallen-Key topology, implemented in LTSpice with both ideal and realistic op-amp models. Developed as part of the Analog Circuits and Sensor Systems course at the University of Bologna.

---

## 📌 Project Overview

This project covers the complete design flow of an active low-pass filter — from mathematical derivation and pole calculation (using Python) to component sizing and LTSpice simulation. The design was verified under ideal conditions and then tested with a realistic single-pole op-amp model and component tolerance sensitivity analysis.

---

## 🎯 Filter Specifications

| Parameter | Value |
|---|---|
| Filter Type | Butterworth (Low-Pass) |
| Max Passband Ripple (Amax) | 2 dB |
| Min Stopband Attenuation (Amin) | 20 dB |
| Passband Frequency (fp) | 15 kHz |
| Stopband Frequency (fs) | 23 kHz |
| Gain | 10 (20 dB) |
| Capacitor Tolerance | 5% |
| Resistor Tolerance | 1% |

---

## ⚙️ Design Procedure

### Step 1 — Filter Order Calculation
Epsilon (ε) is calculated from the passband ripple:

**ε = 0.764**

Using the Butterworth attenuation formula A(ωs) ≥ Amin, the minimum filter order is determined to be:

**N = 7**

### Step 2 — Topology Selection
**Sallen-Key "Smart" topology** was chosen for the 2nd-order stages due to moderate Q values and to avoid the overshoot associated with the "lazy" design approach.

The 7th-order filter is decomposed into:
- **3 × 2nd-order Sallen-Key stages** (gain = 1 each)
- **1 × 1st-order gain stage** (20 dB gain)

### Step 3 — Pole Calculation (Python)
Poles for the 7th-order Butterworth filter (fc = 15.59 kHz):

| Pole | Real Part (σ) | Imag Part (jω) | ω0 (rad/s) | Q |
|---|---|---|---|---|
| P1 | -21791.11 | 95473.10 | 97928.37 | 2.25 |
| P2 | -61057.34 | 76563.48 | 97928.37 | 0.80 |
| P3 | -88230.41 | 42489.53 | 97928.37 | 0.55 |
| P4 | -97928.37 | 0.00 | 97928.37 | 0.50 |

Quality factors: **Q1 = 0.555 · Q2 = 0.801 · Q3 = 2.247**

### Step 4 — Component Sizing

Using the Sallen-Key Smart design equations and ω0 = 15.54 kHz:

| Stage | Q | C1 | C2 | R |
|---|---|---|---|---|
| Stage 1 | 0.555 | 1 nF | 0.81 nF | 11.368 kΩ |
| Stage 2 | 0.801 | 1 nF | 0.389 nF | 16.4 kΩ |
| Stage 3 | 2.247 | 1 nF | 46.5 pF | 46 kΩ |
| Gain Stage | — | 100 pF | — | R1 = 102.41 kΩ, R2 = 10.24 kΩ |

---

## 🔬 Simulations Performed

### 1. Ideal Op-Amp Filter
Filter implemented using an ideal op-amp subcircuit (infinite gain, infinite input impedance). Bode plot confirms correct passband gain, cutoff frequency, and roll-off rate.

### 2. Single-Pole Op-Amp Filter
Filter re-implemented using a realistic single-pole op-amp model (finite bandwidth, finite input/output impedance). A 3 dB ripple appears before roll-off, shifting the effective fp — demonstrating real-world op-amp limitations.

### 3. Sensitivity Analysis
Component values randomised with 5% capacitor tolerance and 1% resistor tolerance across 500 Monte Carlo runs. Results confirm the S&K Smart topology maintains stable frequency response with no overshoots under component variation.

---

## 📊 Key Results

- ✅ Correct cutoff at 15 kHz with steep roll-off into stopband at 23 kHz
- ✅ No overshoot — confirmed advantage of S&K Smart over lazy topology
- ✅ Ideal filter shows sharper passband-to-stopband transition
- ✅ Single-pole model introduces realistic bandwidth limitations
- ✅ Filter robust to component tolerances (Monte Carlo verified)

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Python** | Pole calculation, ω0 derivation, component sizing |
| **LTSpice** | Circuit schematic and simulation |
| **AC Analysis** | Bode plots for gain and phase |
| **Monte Carlo (.step param)** | Sensitivity to component tolerances |

---

## 📁 Repository Structure

```
├── schematic/          # LTSpice schematic files (.asc, .asy)
├── simulations/        # Simulation result files (.raw)
├── results/            # Bode plots — ideal, single-pole, sensitivity
├── python/             # Python scripts for pole and component calculation
├── report/             # Full design report (PDF)
└── README.md
```

---

## 👩‍💻 Author

**Wajeeha Kazmi**
MSc Electronics Engineering for Intelligent Systems, Big Data & IoT
University of Bologna, Italy
[LinkedIn](https://www.linkedin.com/in/wajeeha-kazmi)
