
`include "ctrl_encode_def.v"

module alu(
	input [4:0] sa,
    input [31:0] A,//rs
    input [31:0] B,//rt or ext_out
    input [4:0] ALUOp,
    output reg [31:0] C,
	 output reg zero
    );
	

	 always @(A or B or ALUOp or sa) begin
		case(ALUOp)
			`ALUOp_ADDU: C = $unsigned(A) + $unsigned(B);         //addu
			`ALUOp_SUBU: C = $unsigned(A) - $unsigned(B);         //subu
			`ALUOp_ADD: C = A + B;			
			`ALUOp_SUB: C = A - B;
			`ALUOp_AND: C = A & B;
			`ALUOp_OR: C = A | B; 
			`ALUOp_SLL: begin C = B << sa;$display("sa=%1X",sa);end
			`ALUOp_SRL: begin C = B >> sa;$display("sa=%1X",sa);end
			`ALUOp_SRA: begin C = $signed(B) >>> sa;$display("sa=%1X",sa);end
			`ALUOp_SLT: C=($signed(A) < $signed(B))?1'b1:1'b0;
			`ALUOp_EQL: zero=(A==B)?1'b1:1'b0;//beq
			`ALUOp_BNE: zero=(A==B)?1'b0:1'b1;//bne
			`ALUOp_LUI: C = B << 16;
			`ALUOp_DM: C=(A+B)>>2;
		endcase
	 end
	 


endmodule



