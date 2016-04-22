`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:20 04/16/2016 
// Design Name: 
// Module Name:    CPU 
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
module CPU( clk, reset
    );
	 
	 //TOP MODULE
	 // Brings together the controller and the datapath

	 input reset, clk;
	 wire [5:0] Opcode;
	 wire [2:0] ALUOp;
	 wire [1:0] ALUSrcB, PCSource;
	 wire IRWrite, RegWrite;
	 wire MemToReg, ALUSrcA, PCWrite, PCWriteCond, MemWrite;
	 
	 Controller_SM CSM( 
	 .Opcode(Opcode), 
	 .clk(clk), 
	 .reset(reset), 
	 .ALUOp(ALUOp),
	 .ALUSrcA(ALUSrcA), 
	 .ALUSrcB(ALUSrcB), 
	 .PCWrite(PCWrite), 
	 .PCSource(PCSource), 
	 .PCWriteCond(PCWriteCond), 
	 .MemWrite(MemWrite), 
	 .MemToReg(MemToReg), 
	 .RegWrite(RegWrite), 
	 .IRWrite(IRWrite)
    );
	 
	 Datapath DP( 
		.clk(clk), 
		.reset(reset), 
		.ALUOp(ALUOp), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.MemToReg(MemToReg), 
		.PCSource(PCSource), 
		.IRWrite(IRWrite),
		.MemWrite(MemWrite), 
		.PCWrite(PCWrite), 
		.PCWriteCond(PCWriteCond), 
		.Opcode(Opcode), 
		.RegWrite(RegWrite)  
    );

endmodule
