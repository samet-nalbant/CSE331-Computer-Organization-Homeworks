module _32bit_adder (S,C,A,B,C0);
input [31:0] A,B;
input C0;
output C;
output [31:0] S;
wire C1,C2,C3;

_8bit_adder F0(S[7:0],C1,A[7:0],B[7:0],C0),
				F1(S[15:8],C2,A[15:8],B[15:8],C1),
				F2(S[23:16],C3,A[23:16],B[23:16],C2),
				F3(S[31:24],C,A[31:24],B[31:24],C3);
endmodule