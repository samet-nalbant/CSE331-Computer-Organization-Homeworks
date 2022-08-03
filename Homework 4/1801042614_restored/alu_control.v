module alu_control(func, alu_OP, S);

input [2:0] func; // function code
input [2:0] alu_OP; // alu op
output [2:0] S;

	wire rtype, andd, xorr, sub;
	wire add,orr;// karnough map
	wire [2:0] temp;
	wire not1,not2,not3,not4;
	wire temp2;
	not n1 (not3, func[2]);
	not n2 (not2, func[1]);
	not n3 (not1, func[0]);
	
	not n4 (not4, alu_OP[2]);
	and o1 (rtype, not4, alu_OP[1], alu_OP[0]); // rtypse 0
	
	not n5 (temp2, rtype);
	and a1 (andd, not1, not2, not3); // 000 function code "and" sonuncusu 0 olsa da önemli değil
	
	and a2 (sub, not3, func[1], not1);
	and a3 (xorr, not3, func[1], func[0]);
	and a4 (add, not3, not2, func[0]);
	and a5 (orr, func[2], not2, func[0]);
	
	 // rtype conntrol 0 rtypesa direk alu op değilse temp
	
	or o2 (temp[2], func[2], andd); // s2 control
	or o3 (temp[1], orr, sub, andd); // s1 control
	or o4 (temp[0], xorr, orr); // s0 control
	
	_mux2x1 m1 (temp[2], alu_OP[2], temp2, S[2]);
	_mux2x1 m2 (temp[1], alu_OP[1], temp2, S[1]);
	_mux2x1 m3 (temp[0], alu_OP[0], temp2, S[0]);	
	
endmodule 