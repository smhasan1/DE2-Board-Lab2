module part2(SW, LEDR, LEDG);

	input [8:0]SW;
	output [8:0]LEDR;
	output [4:0]LEDG;
	wire c1, c2, c3;
	
	assign LEDR = SW;
	
	FA first(SW[4], SW[0], SW[8], LEDG[0], c1);
	FA second(SW[5], SW[1], c1, LEDG[1], c2);
	FA third(SW[6], SW[2], c2, LEDG[2], c3);
	FA fourth(SW[7], SW[3], c3, LEDG[3], LEDG[4]);
	
endmodule

module FA(a, b, cin, s, cout);

	input a, b, cin;
	output s, cout;
	
	assign s = a^b^cin;
	assign cout = (a^b)&cin|a&b;

endmodule

