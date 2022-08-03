module register(read_reg1, read_reg2, write_reg, write_data, reg_write,read_data1, read_data2, clock);

input [2:0] read_reg1, read_reg2, write_reg;
input reg_write;
input clock;
input [31:0] write_data;
output reg[31:0] read_data1, read_data2;

reg [31:0] registers [7:0];

initial begin
	$readmemb("registers.mem", registers);
end

always @(*)begin
	read_data1 = registers[read_reg1];
	read_data2 = registers[read_reg2];
	if(reg_write && write_reg !=3'b0) begin
		registers[write_reg] <= write_data[31:0];
		$writememb("registers.mem", registers);
	end
end


endmodule 