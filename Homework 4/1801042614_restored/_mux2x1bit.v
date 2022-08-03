module _mux2x1(D0,D1,S,F);
input D0, D1;
input S;
output F;

	wire wAnd1;
	wire wAnd2;
	wire sNot;
	not a0(sNot, S);
	
	and g0(wAnd1, sNot, D0);
	and g1(wAnd2, S, D1);
	or g2(F, wAnd2, wAnd1);
	
endmodule