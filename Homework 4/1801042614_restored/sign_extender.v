module sign_extender(imm,extended);

input [5:0] imm;

output [32:0] extended;
	
	wire temp;

	_mux2x1 m1(0,1,imm[5],temp);

	
	or o1(extended[31],temp);
	or o2(extended[30],temp);
	or o3(extended[29],temp);
	or o4(extended[28],temp);
	or o5(extended[27],temp);
	or o6(extended[26],temp);
	or o7(extended[25],temp);
	or o8(extended[24],temp);
	or o9(extended[23],temp);
	or o10(extended[22],temp);
	or o11(extended[21],temp);
	or o12(extended[20],temp);
	or o13(extended[19],temp);
	or o14(extended[18],temp);
	or o15(extended[17],temp);
	or o16(extended[16],temp);

	or o17(extended[15],temp);
	or o18(extended[14],temp);
	or o19(extended[13],temp);
	or o20(extended[12],temp);
	or o21(extended[11],temp);
	or o22(extended[10],temp);
	or o23(extended[9],temp);
	or o24(extended[8],temp);
	or o25(extended[7],temp);
	or o26(extended[6],temp);
	or o27(extended[5],imm[5]);
	or o28(extended[4],imm[4]);
	or o29(extended[3],imm[3]);
	or o30(extended[2],imm[2]);
	or o31(extended[1],imm[1]);
	or o32(extended[0],imm[0]);






endmodule 