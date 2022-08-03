module MiniMIPS(clock,program_counter);
	input clock;
	input [31:0] program_counter;
	wire [2:0] alu_OP, alu_control_OP;
	wire temp2;
	wire reg_dest, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
	wire [2:0] write_register;
	wire [31:0] write_data_reg, write_data_mem;
	wire [31:0] extended;
	wire [31:0] read_data1, read_data2, read_data_memory;
	wire [15:0] instruction;
	wire [31:0] adress;
	wire [31:0] alu_result;
	wire [31:0] alu_input2;
	wire [5:0] immediate_value;
	wire [3:0] op_code;
	wire [2:0] rs, rt, rd, func;
	wire [31:0] mux_result;
	wire [31:0] adress_temp;
	instruction read_instr(program_counter,instruction);
	or o1(op_code[3], instruction[15] ,0);  // op_code
	or o2(op_code[2], instruction[14] ,0);	
	or o3(op_code[1], instruction[13] ,0);	
	or o4(op_code[0], instruction[12] ,0);	
	
	or o5(rs[2], instruction[11], 0); // rs
	or o6(rs[1], instruction[10], 0);	
	or o7(rs[0], instruction[9], 0);	
	
	or o8(rt[2], instruction[8], 0); //rt
	or o9(rt[1], instruction[7], 0);	
	or o10(rt[0], instruction[6], 0);	
	
	or o11(rd[2], instruction[5], 0); //rd
	or o12(rd[1], instruction[4], 0);	
	or o13(rd[0], instruction[3], 0);	
	
	or o14(func[2], instruction[2], 0); //func
	or o15(func[1], instruction[1], 0);	
	or o16(func[0], instruction[0], 0);	
	
	or o17(immediate_value[5], instruction[5]); // immediate value
	or o18(immediate_value[4], instruction[4]);	
	or o19(immediate_value[3], instruction[3]);	
	or o20(immediate_value[2], instruction[2]);
	or o21(immediate_value[1], instruction[1]);	
	or o22(immediate_value[0], instruction[0]);
	
	control_unit control(op_code, reg_dest, mem_read, mem_to_reg, mem_write, reg_write, alu_src, branch, alu_OP);
	
	or o23(temp2, reg_dest, 0);
	
	_mux2x1 m1 (rt[2], rd[2], reg_dest, write_register[2]);  // mux for write register
	_mux2x1 m2 (rt[1], rd[1], reg_dest, write_register[1]);
	_mux2x1 m3 (rt[0], rd[0], reg_dest, write_register[0]);	
	
	register read_register (rs, rt, 000 ,read_data_memory , 0 , read_data1, read_data2, clock); // register modülü
	
	sign_extender extend(immediate_value,extended); // extender
	
	mux2x1 mux1(read_data2, extended, alu_src, alu_input2); // mux before alu
	
	alu_control alu_control (func, alu_OP, alu_control_OP); // alu control 
	
	alu32 alu(read_data1,alu_input2,alu_control_OP,alu_result); // alu
	
	data_memory memory(alu_result, read_data2, mem_write, mem_read, read_data_memory, clock); // data memory
	
	mux2x1 mux2(alu_result, read_data_memory, mem_to_reg, mux_result);
	
	register writereg(rs, rt, write_register ,mux_result , reg_write , adress_temp , adress, clock); // register modülü
	
	
initial begin
	$monitor("instruction=%16b, op_code= %4b, rs=%3b, rt=%3b, rd=%3b, func=%3b, immediate =%6b, reg_dest=%1b, branch=%1b, mem_read=%1b, mem_to_reg=%1b, mem_write=%1b, alu_src=%1b, reg_write=%1b,alu_OP=%3b, alu_control_OP=%3b, write_register=%3b, alu_input1:%32b, alu_input2:%32b, alu_result=%32b,  mux_result=%32b, clock :%d, pc=%d" ,
	instruction, op_code, rs, rt, rd, func, immediate_value, reg_dest, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write,alu_OP, alu_control_OP, write_register, read_data1, alu_input2, alu_result, mux_result, clock, program_counter);
end
	
	
endmodule 