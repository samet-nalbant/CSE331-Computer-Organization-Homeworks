module mux2x1(D0,D1,S,F);
input [31:0] D0, D1;
input S;
output [31:0]F;

	wire [31:0]wAnd1;
	wire [31:0]wAnd2;
	wire [31:0]wS32;
	wire [31:0]wsNot32;
	wire sNot;
	not a0(sNot, S);
	to32bit a1(sNot,wsNot32);
	to32bit a2(S,wS32);
	
	_32bit_and g0(D0, wsNot32, wAnd1);
	_32bit_and g1(D1, wS32, wAnd2);
	_32bit_or g2(wAnd1, wAnd2, F);
	
endmodule