module to32bit(A,B);
input A;
output [31:0] B;

	or g31(B[31],A,0);
	or g30(B[30],A,0);
	or g29(B[29],A,0);	
	or g28(B[28],A,0);
	
	or g27(B[27],A,0);
	or g26(B[26],A,0);
	or g25(B[25],A,0);	
	or g24(B[24],A,0);
	
	or g23(B[23],A,0);
	or g22(B[22],A,0);
	or g21(B[21],A,0);	
	or g20(B[20],A,0);
	
	or g19(B[19],A,0);
	or g18(B[18],A,0);
	or g17(B[17],A,0);	
	or g16(B[16],A,0);
	
	or g15(B[15],A,0);
	or g14(B[14],A,0);
	or g13(B[13],A,0);	
	or g12(B[12],A,0);
	
	or g11(B[11],A,0);
	or g10(B[10],A,0);
	or g9(B[9],A,0);	
	or g8(B[8],A,0);

	or g7(B[7],A,0);
	or g6(B[6],A,0);
	or g5(B[5],A,0);	
	or g4(B[4],A,0);
	
	or g3(B[3],A,0);
	or g2(B[2],A,0);
	or g1(B[1],A,0);	
	or g0(B[0],A,0);

 




endmodule 