`define DELAY 20

module testbench();
	reg [31:0] registers [7:0];

	initial begin
		$readmemb("C:\altera\13.1\homework4\registers.mem", registers);
		$monitor("time = %2d,sum=%32b", $time, registers[0]);
		

	end
 
endmodule