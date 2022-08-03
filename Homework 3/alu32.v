module alu32(A,B,S,F);

input [31:0] A,B;
input [2:0] S;
output [31:0] F;
wire C0,C1;
wire [31:0] R0,R1,R2,R3,R4,R5,R6,R7;
	_32bit_adder g0(R0,C,A,B,0);
	_32bit_xor g1(A,B,R1);
	_32bit_sub g2(R2,C1,A,B,0);
	_32bit_slt g3(R4,A,B);
	_32bit_nor g4(A,B,R5);
	_32bit_and g5(A,B,R6);
	_32bit_or g6(A,B,R7);
	mux8x1 g7(R0,R1,R2,R3,R4,R5,R6,R7,S,F);
	
endmodule