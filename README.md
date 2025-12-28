# Embedded PID Controller (Discrete-Time)

## 📌 Overview
This repository contains an **embedded-friendly PID controller**
implemented in **C**, suitable for real-time control applications
(motors, temperature, robotics).

The design focuses on **simplicity, determinism, and portability**.

## 🎯 Target
- Control Systems Internship
- Embedded / Robotics Roles

## ⚙️ PID Equation
u(k) = Kp·e(k) + Ki·∑e(k) + Kd·(e(k) − e(k−1))

## 🔧 Features
- Discrete-time PID
- Integral accumulation
- Lightweight implementation
- No hardware dependency

## 🛠 Technologies
- Language: C
- Control: Digital PID
- Simulation: MATLAB / Simulink (optional)

## 📂 Project Structure



## 🚀 How to Use
1. Initialize PID parameters
2. Call `PID_Compute()` at fixed sampling time
3. Apply output to actuator

## 📈 Possible Improvements
- Anti-windup mechanism
- Output saturation
- Fixed-point implementation

## 📜 License
MIT License
