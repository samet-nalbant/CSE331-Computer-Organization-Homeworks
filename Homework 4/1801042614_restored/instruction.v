module instruction(adress, instruction);

input [31:0] adress;
output reg[15:0] instruction;
reg [15:0] instructions [29:0];


initial begin
	$readmemb("instructions.mem", instructions);
end

always @(*) begin
	instruction = instructions[adress];
end


endmodule