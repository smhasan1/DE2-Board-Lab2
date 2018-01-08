module part1(SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6);

	input [17:0] SW;
	input [2:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;
	output [6:0] HEX5;
	output [6:0] HEX6;
	wire [2:0] out0, out1, out2, out3, out4, out5, out6;
	
	mux_3bit_7to1 U0(SW[5:3], SW[17:15], SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], KEY[2:0], out0);
	mux_3bit_7to1 U1(SW[8:6], SW[5:3], SW[17:15], SW[17:15], SW[2:0], SW[14:12], SW[11:9], KEY[2:0], out1);
	mux_3bit_7to1 U2(SW[11:9], SW[8:6], SW[5:3], SW[17:15], SW[17:15], SW[2:0], SW[14:12], KEY[2:0], out2);
	mux_3bit_7to1 U3(SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[17:15], SW[17:15], SW[2:0], KEY[2:0], out3);
	mux_3bit_7to1 U4(SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[17:15], SW[17:15], KEY[2:0], out4);
	mux_3bit_7to1 U5(SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[17:15], KEY[2:0], out5);
	mux_3bit_7to1 U6(SW[17:15], SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], KEY[2:0], out6);
	
	char_7seg V0(out0, HEX0);
	char_7seg V1(out1, HEX1);
	char_7seg V2(out2, HEX2);
	char_7seg V3(out3, HEX3);
	char_7seg V4(out4, HEX4);
	char_7seg V5(out5, HEX5);
	char_7seg V6(out6, HEX6);
	


endmodule


module char_7seg(C, Display);

	input [2:0] C;
	output [6:0] Display;
	
	assign Display[0] = C[2]&~C[1]&C[0]|C[2]&C[1]&~C[0]|C[2]&C[1]&C[0];
	assign Display[1] = ~C[2]&~C[1]&~C[0]|~C[2]&~C[1]&C[0]|C[2]&C[1]&~C[0]|C[2]&C[1]&C[0];
	assign Display[2] = (C[2]|~C[1]|C[0])&(~C[2]|C[1]|C[2])&(~C[2]|C[1]|~C[2]);
	assign Display[3] = C[2]&~C[1]&C[0]|C[2]&C[1]&~C[0]|C[2]&C[1]&C[0];
	assign Display[4] = ~C[2]&C[1]&~C[0]|C[2]&~C[1]&C[0]|C[2]&C[1]&~C[0]|C[2]&C[1]&C[0];
	assign Display[5] = ~C[2]&C[1]&~C[0]|~C[2]&C[1]&C[0]|C[2]&~C[1]&C[0]|C[2]&C[1]&~C[0]|C[2]&C[1]&C[0];
	assign Display[6] = C[2]&~C[1]&~C[0]|C[2]&~C[1]&C[0]|C[2]&C[1]&~C[0]|C[2]&C[1]&C[0];


endmodule

// a 3-bit wide 7-to-1 MUX
module mux_3bit_7to1(T,U,V,W,X,Y,Z,S,M);
   input [2:0] T,U,V,W,X,Y,Z,S;
   output [2:0]     M;

   wire [2:0] 	    N1,N2,N3,N4,N5;
      
   mux_3bit_2to1 m0(T,U,S[0],N1);
   mux_3bit_2to1 m1(V,W,S[0],N2);
   mux_3bit_2to1 m2(X,Y,S[0],N3);
   mux_3bit_2to1 m3(N1,N2,S[1],N4);
   mux_3bit_2to1 m4(N3,Z,S[1],N5);
   mux_3bit_2to1 m5(N4,N5,S[2],M);

endmodule // mux_3bit_7to1


// a 3-bit wide 2-to-1 MUX
module mux_3bit_2to1(X,Y,s,M);
   input [2:0] X,Y;
   input       s;
   
   output [2:0] M;

   assign M = ({3{~s}} & X) | ({3{s}} & Y);

endmodule // mux_3bit_2to1
