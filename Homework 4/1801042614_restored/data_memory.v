module data_memory(adress, write_data, mem_write, mem_read, read_data, clock);

input [31:0] write_data;
input [31:0] adress;
input mem_write, mem_read, clock;

output reg [31:0] read_data;

reg [31:0] memory [256:0];

initial begin
	$readmemb("data.txt", memory);
end

always @(*) begin
	if (mem_read) begin
		read_data <= memory[adress[7:0]];
	end
	
	if (mem_write) begin
		memory[adress] <= write_data[31:0];
		$writememb("data.txt", memory);
	end
end

endmodule 