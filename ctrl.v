`include "ctrl_encode_def.v"
`include "instruction_def.v"

module ctrl(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg MemRead,
    output reg RegWrite,
    output reg MemWrite,
    output reg [1:0] DatatoReg,
    output reg [1:0] PC_sel,
    output reg ExtOp,
    output reg [4:0] ALUCtrl
    );
	
	always @(opcode or func ) begin
		case(opcode)
			//addu,subu
		`INSTR_RTYPE_OP:   // R type  
				case(func)
					//addu
				`INSTR_ADDU_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_ADDU;	
						
					end
			
					//subu
				`INSTR_SUBU_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SUBU;		
						
					end
				`INSTR_ADD_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_ADD;		
						
					end	
				`INSTR_SUB_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SUB;		
						
					end
				`INSTR_AND_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_AND;		
						
					end
				`INSTR_OR_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_OR;		
						
					end
				`INSTR_SLL_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SLL;		
						
					end
				`INSTR_SRL_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SRL;		
						
					end
				`INSTR_SRA_FUNCT:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SRA;		
						
					end
				`INSTR_SLT_FUNCT:  
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SLT;			
					end
				`INSTR_JR_FUNCT:
					begin
						RegDst = 2'b00;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 0;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b10;
						ExtOp = 0;
						ALUCtrl = 3'b000;		
						
					end
						
				
				endcase//the end of the func
			
			//ori
			`INSTR_ADDI_OP:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = `ALUOp_ADD;				
			end
			
			`INSTR_ORI_OP:  //6'b001101:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = `ALUOp_OR;				
			end
			`INSTR_SLTI_OP:  
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = `ALUOp_SLT;			
			end
			
			//beq 
			`INSTR_BEQ_OP:  
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b01;
				ExtOp = 0;
				ALUCtrl = `ALUOp_EQL;			
			end
			`INSTR_BNE_OP:  
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b01;
				ExtOp = 0;
				ALUCtrl = `ALUOp_BNE;			
			end

			`INSTR_LW_OP:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 1;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b01;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = `ALUOp_DM;			
			end

			`INSTR_SW_OP:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 1;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = `ALUOp_DM;			
			end

			`INSTR_LUI_OP:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = `ALUOp_LUI;			
			end
			
			`INSTR_J_OP:
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b11;
				ExtOp = 0;
				ALUCtrl = 3'b000;			
			end
			`INSTR_JAL_OP:
			begin
				RegDst = 2'b10;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b10;
				PC_sel = 2'b11;
				ExtOp = 0;
				ALUCtrl = 3'b000;			
			end

			
			default:
					begin
						RegDst = 2'b00;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 0;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b000;
					
					end
			
		endcase
	 end
	 

endmodule
