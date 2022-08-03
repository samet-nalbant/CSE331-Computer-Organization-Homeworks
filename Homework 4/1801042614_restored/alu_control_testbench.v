module alu_control_testbench();

	reg [2:0] func;
	reg [2:0] alu_OP;
	reg temp;
	wire [2:0] S;
	
	alu_control deneme(func, alu_OP, temp, S);
	
	initial begin
	func = 3'b001; //r-type
	alu_OP ='b000;
	temp = 'b1;
	#20;
	func = 3'b101; //r-type
	alu_OP ='b000;
	temp = 'b1;
	#20;
	func = 3'b000; //r-type
	alu_OP ='b110;
	temp = 'b0;
	#20;
	end
	
	initial begin
	$monitor("time=%2d,func=%3b,alu_OP=%3b, S=%3b"
	          ,$time,func,alu_OP,S);
	end
endmodule