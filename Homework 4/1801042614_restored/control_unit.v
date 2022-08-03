module control_unit(op_code, reg_dest, mem_read, mem_to_reg, mem_write, reg_write, alu_src, branch, alu_op);

input [3:0] op_code;
output [2:0] alu_op;
output reg_dest, mem_read, mem_to_reg, mem_write, reg_write, alu_src, branch;


	wire temp1,temp2,temp3,temp4,temp;
	wire [2:0] alu_temp;
	wire not_sw;
	wire rtype,lw,sw,beq,bne,not_beq, not_bne, not_rtype;
	wire addi, andi, ori, nori, slti;
	not n1 (temp4, op_code[3]); // rtype control
	not n2 (temp3, op_code[2]);	
	not n3 (temp2, op_code[1]);
	not n4 (temp1, op_code[0]);	
	and a1 (rtype, temp1, temp2, temp3, temp4);
	
	and a2 (lw, op_code[3], temp3, temp2, temp1); // lw control	
	and a3 (sw, op_code[3], temp3, temp2, op_code[0]); // sw control
	and a4 (beq, temp4, op_code[2], temp2, op_code[0]); // beq control	
	and a5 (bne, temp4, op_code[2], op_code[1], temp1); // bne control
	and a6 (addi, temp4, temp3, temp2, op_code[0]); // addi
	and a7 (andi, temp4, temp3, op_code[1], temp1); // andi
	and a8 (ori, temp4, temp3, op_code[1], op_code[0]); // ori
	and a10 (nori, temp4, op_code[2], temp2, temp1); // nori
	and a11 (slti, temp4, op_code[2], op_code[1], op_code[0]); // slti
	
	not n5 (not_beq, beq);
	not n6 (not_bne, bne);	
	not n7 (not_rtype, rtype);
	not n8 (not_sw, sw);
	and a12 (temp, not_rtype, not_beq, not_bne); // rtype değil ve beq ve bne değilse

	
	
	or o1 (reg_write, lw, rtype, not_sw);
	or o2 (reg_dest, rtype, 0);
	or o3 (mem_to_reg, lw, 0);
	or o4 (mem_read, lw, 0);
	or o5 (mem_write, sw, 0);
	or o6 (alu_src, lw, sw, temp);
	// rtypsda 011
	
	
	
	

	
	or o7 (alu_temp[2], andi, ori, nori);
	or o8 (alu_temp[1], andi, ori, beq, bne, slti);
	or o9 (alu_temp[0], ori, slti, nori);
	
	
	_mux2x1 m1 (0, alu_temp[2], not_rtype, alu_op[2]);
	_mux2x1 m2 (1, alu_temp[1], not_rtype, alu_op[1]);
	_mux2x1 m3 (1, alu_temp[0], not_rtype, alu_op[0]);	
	
	or o10 (branch, beq, bne);

	
endmodule 