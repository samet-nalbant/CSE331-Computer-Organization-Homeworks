module elveda(A,B,S,F);

input [31:0] A,B;
input [2:0] S;
output [31:0] F;

	alu32 g0(A,B,S,F);
	
endmodule 