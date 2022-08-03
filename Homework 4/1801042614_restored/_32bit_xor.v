module _32bit_xor(A,B,F);
input [31:0] A,B;
output [31:0] F;

	xor g31(F[31],A[31],B[31]);
	xor g30(F[30],A[30],B[30]);
	xor g29(F[29],A[29],B[29]);	
	xor g28(F[28],A[28],B[28]);
	
	xor g27(F[27],A[27],B[27]);
	xor g26(F[26],A[26],B[26]);
	xor g25(F[25],A[25],B[25]);	
	xor g24(F[24],A[24],B[24]);
	
	xor g23(F[23],A[23],B[23]);
	xor g22(F[22],A[22],B[22]);
	xor g21(F[21],A[21],B[21]);	
	xor g20(F[20],A[20],B[20]);
	
	xor g19(F[19],A[19],B[19]);
	xor g18(F[18],A[18],B[18]);
	xor g17(F[17],A[17],B[17]);	
	xor g16(F[16],A[16],B[16]);
	
	xor g15(F[15],A[15],B[15]);
	xor g14(F[14],A[14],B[14]);
	xor g13(F[13],A[13],B[13]);	
	xor g12(F[12],A[12],B[12]);
	
	xor g11(F[11],A[11],B[11]);
	xor g10(F[10],A[10],B[10]);
	xor g9(F[9],A[9],B[9]);	
	xor g8(F[8],A[8],B[8]);

	xor g7(F[7],A[7],B[7]);
	xor g6(F[6],A[6],B[6]);
	xor g5(F[5],A[5],B[5]);	
	xor g4(F[4],A[4],B[4]);
	
	xor g3(F[3],A[3],B[3]);
	xor g2(F[2],A[2],B[2]);
	xor g1(F[1],A[1],B[1]);	
	xor g0(F[0],A[0],B[0]);
	
endmodule 