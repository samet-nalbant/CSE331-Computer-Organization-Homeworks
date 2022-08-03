module _8bit_adder (S,C,A,B,C0);
input [7:0] A,B;
input C0;
output C;
output [7:0] S;
wire C1;
 
_4bit_adder A0(S[3:0],C1,A[3:0],B[3:0],C0),
				A1(S[7:4],C,A[7:4],B[7:4],C1);
				
endmodule 