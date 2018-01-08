module part3(SW, LEDR, KEY);

	input [15:0]SW;
	input [2:0]KEY;
	output [7:0]LEDR;
	
	wire [7:0]A;
	wire [7:0]B;
	reg [7:0]Z;
	wire [2:0]Q;
	
	assign B[7:0] = SW[7:0];
	assign A[7:0] = SW[15:8];
	assign Q = KEY;
	
	always @(*)
		begin 
			case(Q)
			3'b000: Z = ~A|B;
			3'b001: Z = ~A|~B;
			3'b010: Z = ~A;
			3'b011: Z = A&B;
			3'b100: Z = A+B;
			3'b101: Z = ~(A|B);
			3'b110: Z = A[0]+A[1]+A[2]+A[3]+A[4]+A[5]+A[6]+A[7];
			3'b111: Z = A[0]+A[1]+A[2]+A[3]+A[4]+A[5]+A[6]+A[7]+B[0]+B[1]+B[2]+B[3]+B[4]+B[5]+B[6]+B[7];
			endcase			
		end

		assign LEDR = Z;
		
endmodule

