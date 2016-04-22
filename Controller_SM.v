`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:48 03/29/2016 
// Design Name: 
// Module Name:    Controller_SM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Controller_SM( Opcode, clk, reset, ALUOp,
							 ALUSrcA, ALUSrcB, PCWrite, PCSource, 
							 PCWriteCond, MemWrite, MemToReg,
							 RegWrite, IRWrite
    );
	 
	 // Controller Module, controls the operations of the datapath, it is made by using
	 // a state machine.
	 
		input [5:0] Opcode;
		input clk, reset;
		
		output reg [2:0] ALUOp;
		output reg [1:0] PCSource, ALUSrcB;
		output reg ALUSrcA, IRWrite, RegWrite, MemToReg,  MemWrite;
		output reg PCWriteCond, PCWrite;
		
		reg [3:0] state, next_state;
		
		reg [5:0] Opcode_reg; 
		
		always@(*)	
			begin
			state = next_state;
			case(state)
				4'd0: begin  // Instruction Fetch state
				ALUOp = 3'b010; // Add function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b01;
				PCWrite = 1'b1;
				PCSource = 2'b00;
				IRWrite = 1'b1;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;
				end
				
				4'd1: begin  // Instruction Decode state
				ALUOp = 3'b010; // Add function
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b11;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;
				end
				
				4'd2: begin   // I-type Memory State
				// For Load and Store Instructions
				// ALUOp is always add
				ALUOp = 3'b010; // Add function
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b10;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;
				end
				
				4'd3: begin // I-type general state
				// The ALU operation will depend on the opcode since each general 
				//I-type instruction has a different operation (i.e addi, subi,ori)
				ALUOp = Opcode[2:0]; // Exact operation to be determined by last 3 bits of opcode
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b10;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;			
				end
				
				4'd4: begin  // R-Type General Instructions			
				// The ALU operation will depend on the function field since each general 
				//R-type instruction has a different operation (i.e add, and,sub)
				ALUOp = Opcode[2:0]; // Exact operation to be determined	by last 3 bits of opcode				
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;			
				end
				
				4'd5: begin //Branch instruction
				ALUOp = 3'b011; // Sub function, exact reference to be determined
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b01;
				IRWrite = 1'b1;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b1;			
				end
				
				4'd6: begin // Jump Instruction			
				ALUOp = 3'b000; // NOOP function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b1;
				PCSource = 2'b10;
				IRWrite = 1'b1;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;			
				end
				
				4'd7: begin // LW word memory read state (MR)				
				ALUOp = 3'b000; // NOOP function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b00;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;				
				end
				
				4'd8: begin // Write Back to register state (called CP in report)				
				ALUOp = 3'b010; // NOOP function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b1;
				PCWriteCond = 1'b0;				
				end
				
				4'd9: begin // LW memory write back to register (MC)				
				ALUOp = 3'b000; // NOOP function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b1;
				MemWrite = 1'b0; 
				RegWrite = 1'b1;
				PCWriteCond = 1'b0;				
				end
				
				4'd10: begin // Memory Write state for store word instruction (MW)				
				ALUOp = 3'b000; // NOOP function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b1; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;			
				end
				
				4'd11: begin // LI state needed because the ALUop is not the last 3 bits of opcode				
				ALUOp = 3'b010; // It always needs to be add
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b10;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;				
				end
				
				default: begin
				ALUOp = 3'b000; // NOOP function, exact reference to be determined
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;
				end
				endcase
		end

		always@(posedge clk)
			begin
			if(reset)
				next_state <= 0;
			else
				case(state)
				4'd0: next_state <= 1;
				
					4'd1:
					if( Opcode[5:4] == 2'b01)
						next_state <= 4;
					else if( Opcode[5:3] == 3'b110)
						next_state <= 3;
					else if( Opcode == 6'b000001)
						next_state <= 6;
					else if( Opcode == 6'b100001)
						next_state <= 5;
					else if( Opcode == 6'b111011 || Opcode == 6'b111100)
						next_state <= 2;
					else if ( Opcode == 6'b111001)
						next_state <= 11;
					else
						next_state <= 0;
						
					4'd2:
					if( Opcode == 6'b111011)
						next_state <= 7;
					else
						next_state <= 10;
				
				4'd3: next_state <= 8;
				4'd4: next_state <= 8;
				4'd5: next_state <= 0;
				4'd6: next_state <= 0;
				4'd7: next_state <= 9;
				4'd8: next_state <= 0;
				4'd9: next_state <= 0;
				4'd10: next_state <= 0;
				4'd11: next_state <= 8;
				
				default: next_state <= 0;
				endcase
				
			end
			
endmodule
