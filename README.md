# DE2-Board-Lab2
**Part 1:**  
In this part, you will extend the work you did in Lab 1. You will use seven 7-segment displays to show a word whose characters can be rotated. You will need to use seven instances of a 3-bit-wide 7-to-1 multiplexer (Verilog for this is available on the course webpage) and seven instances of the 7-segment decoder circuit shown in Figure 5 of Lab 1. You should have your word displayed on HEX 6, HEX 5, HEX 4, HEX 3, HEX 2, HEX 1, and HEX 0.  
You are to extend the skeleton code below so that it uses seven 7-segment displays. The purpose of your circuit is to display any word on the seven displays that is composed of the characters in Table 1 of Lab 1 and can rotate this word in a circular fashion across the displays when the keys KEY2−0 are toggled. That is, your circuit should produce the output patterns illustrated in Table 1 below.  

Table 1. Rotating the word EE 3201 on seven displays from HEX6 down to HEX0.  

| KEY2 KEY1 KEY0  | Character Pattern |
| ------------- | ------------- |
| 000  | EE 3201 |
| 001  | E 3201E |
| 010  | 3201EE |
| 011  | 3201EE |
| 100  | 201EE 3 |
| 101  | 01EE 32 |
| 110  | 1EE 320 |


Figure 1. Verilog code skeleton  

Perform the following steps:
  1. Create a new Quartus II project for your circuit.  
  2. Include your Verilog module in the Quartus II project. Connect the keys KEY2−0 to the select inputs of each of the instances of the three-bit wide 7-to-1 multiplexers. Also connect SW17−0 to each instance of the multiplexers as required to produce a word such as EE 3201. Connect the outputs of the seven multiplexers to the 7-segment displays HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, and HEX0.  
  3. Include the required pin assignments for the DE2 board for all switches, LEDs, and 7- segment displays.  
  4. Compile the project.  
  5. Download the compiled circuit into the FPGA chip. Test the functionality of the circuit by setting the proper character codes on the switches SW17−0 and then toggling KEY2−0 to observe the rotation of the characters.  

**Part 2:**
Figure 2(a) shows a circuit for a full adder, which has the inputs a, b, and ci, and produces the outputs s and co. Parts b and c of the figure show a circuit symbol and truth table for the full adder, which produces the two-bit binary sum cos = a + b + ci. Figure 2(d) shows how four instances of this full adder module can be used to design a circuit that adds two four-bit numbers. This type of circuit is usually called a ripple-carry adder, because of the way that the carry signals are passed from one full adder to the next. Write Verilog code that implements this circuit, as described below.  


Figure 2. A ripple-carry adder circuit.  

  1. Create a new Quartus II project for the adder circuit. Write a Verilog module for the full adder sub-circuit and write a top-level Verilog module that instantiates four instances of this full adder.  
  2. Use switches SW7−4 and SW3−0 to represent the inputs A and B, respectively. Use SW8 for the carry-in cin of the adder. Connect the SW switches to their corresponding red lights LEDR, and connect the outputs of the adder, cout and S, to the green lights LEDG.  
  3. Simulate your adder with QSim for intelligently chosen values of A and B and cin. Print the simulation waveforms and paste them into your lab book.  
  4. Include the necessary pin assignments for the DE2 board, compile the circuit, and download it into the FPGA chip.  
  5. Test your circuit by trying different values for numbers A, B, and cin.  


**Part 3:**

Design an arithmetic logic unit (ALU) circuit with two 8-bit wide inputs A and B, a 3-bit wide input Q, and an 8-bit wide output Z. Input Q controls the value that is computed by the circuit (based on A and B) and placed on output Z. See Table 2 below for the different computations that can be performed by the circuit. The logical operations (OR, AND, NOT) in the table are bitwise operations.  

Table 2. Functions that can be performed by the ALU.  

| Q2 Q1 Q0  | Output Z |
| ------------- | ------------- |
| 000  | 𝐴̅ 𝑜𝑟 𝐵 |
| 001  | 𝐴̅ 𝑜𝑟 ̅B |
| 010  | 𝐴̅ |
| 011  | 𝐴 𝐴𝑁𝐷 𝐵 |
| 100  | 𝐴 + 𝐵 (𝑎𝑑𝑑𝑖𝑡𝑖𝑜𝑛) |
| 101  | 𝐴 𝑁𝑂𝑅 𝐵 |
| 110  | Number of 1’s in A (in binary) |
| 111  | Number of 1’s in A plus number of 1’s in B (in binary) |

Use Verilog to implement your circuit. You do not need to worry about arithmetic overflow for the case when A and B are too large such that A + B (addition) does not fit within 8 bits. (Later on in this course, you will learn about how to detect that.) Note: you will re-use this ALU circuit in one of the future labs, so do not delete your Verilog implementation!  

  1. Create a new Quartus II project for the configurable logic unit circuit. Write a Verilog module for the ALU circuit. You are encouraged to use procedural Verilog for this part of the lab (see Appendix A.11 in Brown and Vranesic 3rd edition), though it is not mandatory.  
  2. Use switches SW15−8 and SW7−0 to represent the inputs A and B, respectively. Use the red lights, LEDR7−0, to represent the value of Z. Use KEY2−0 to represent the input Q.  
  3. Simulate your circuit with QSim for different A, B, and Q values. Ensure the output functionality matches that specified in Table 2.  
  4. Include the necessary pin assignments for the DE2 board, compile the circuit, and download it into the FPGA chip.  
  5. Test your circuit by trying different values for numbers A, B, and Q.  
