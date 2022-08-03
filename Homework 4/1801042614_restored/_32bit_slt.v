module _32bit_slt (S,A,B);
input [31:0] A,B;
output [31:0]S;
wire C;
wire C1;
wire [31:0] temp_result ;
	_32bit_sub g0(temp_result, C, A, B, 0);
	or g1(C1,temp_result[31],0);
	to32bit_zeros g3(C1,S);
	
endmodule