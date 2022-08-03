module _32bit_sub (S,C,A,B,C0);
input [31:0] A,B;
input C0;
output C;
output [31:0] S;
wire C1,C2,C3;
wire [31:0]temp;
wire [31:0]temp2;
wire [31:0]one;
wire [31:0]zero;
	to32bit f1(0,zero);
	to32bit f0(1,one);
	_32bit_xor g0(one,B,temp);
	_32bit_adder g1(temp2, C1, temp,zero,1);
	_32bit_adder g2(S,C,A,temp2,C0);

endmodule 