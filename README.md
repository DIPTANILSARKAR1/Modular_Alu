# Modular Arithmetic ALU in Verilog

## 🧠 Objective
The goal of this project is to design and implement a **Modular Arithmetic ALU (Arithmetic Logic Unit)** using Verilog HDL. The ALU performs arithmetic and logical operations with **modular constraints**, enabling applications in **cryptography**, **signal processing**, and **finite field systems**.

---

## ✨ Features

- **Modular Addition**: (A + B) mod M  
- **Modular Subtraction**: (A - B) mod M  
- **Modular Multiplication**: (A × B) mod M  
- **Modular Division**: (A × B⁻¹) mod M (if inverse exists)  
- **Modular Exponentiation**: A^B mod M  
- **Bitwise Operations**: AND, OR, XOR  
- **Shift Operations**: Left shift, Logical right shift, Arithmetic right shift  
- **Supports 32-bit inputs and modulus**  
- **Gate-level design for add, sub, mul, div using separate modules**

---

## 📚 Applications

1. 🔐 **Cryptography**
   - Used in RSA, ECC, Diffie-Hellman for secure encryption
   - Modular inverse and exponentiation are essential for public-key cryptosystems

2. 🔁 **Signal Processing**
   - Modular arithmetic is used in circular buffer operations, FFTs, and filters

3. 🧮 **Finite Field Computing**
   - Essential for Reed-Solomon and BCH error-correcting codes

---

## 🛠️ Project Structure


---

## ⚙️ Description

This project builds a **parametric ALU** where all arithmetic is performed **modulo M**. The ALU supports 12 operations selected by a 4-bit opcode:

- `0000`: Modular Addition  
- `0001`: Modular Subtraction  
- `0010`: Modular Multiplication  
- `0011`: A mod B  
- `0100`: Modular Division  
- `0101`: Modular Exponentiation  
- `0110`–`1011`: Bitwise and Shift operations

The **core arithmetic units (add, sub, mul, div)** are implemented at the **gate level** using separate Verilog modules. This improves understanding and gives flexibility for synthesis and educational use.

---

## 🔄 Working

- Inputs: `A`, `B`, and `M` (modulus), each 32 bits wide.
- Operation is selected using a 4-bit `op` code.
- Output `R` is the result of the selected operation.
- The `modular_alu_ext.v` module integrates all operations and chooses the result using a `case` block.
- Simulation and testing are done via `tb_modular_alu.v`, which logs results and generates a `VCD` waveform.
- GTKWave can be used to inspect signals in decimal, hex, or binary.

---

## ✅ Example

```verilog
A = 45, B = 77, M = 97

Operation: Modular Addition
Result = (45 + 77) % 97 = 122 % 97 = 25
