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

![image](https://user-images.githubusercontent.com/19510655/34677048-e86f1300-f45c-11e7-96f6-c61162290860.png)  
Figure 1. Verilog code skeleton  

Perform the following steps:
  1. Create a new Quartus II project for your circuit.  
  2. Include your Verilog module in the Quartus II project. Connect the keys KEY2−0 to the select inputs of each of the instances of the three-bit wide 7-to-1 multiplexers. Also connect SW17−0 to each instance of the multiplexers as required to produce a word such as EE 3201. Connect the outputs of the seven multiplexers to the 7-segment displays HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, and HEX0.  
  3. Include the required pin assignments for the DE2 board for all switches, LEDs, and 7- segment displays.  
  4. Compile the project.  
  5. Download the compiled circuit into the FPGA chip. Test the functionality of the circuit by setting the proper character codes on the switches SW17−0 and then toggling KEY2−0 to observe the rotation of the characters.  
