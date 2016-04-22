`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:09:36 03/30/2016
// Design Name:   Controller_SM
// Module Name:   /ad/eng/users/a/b/ableda/EC_413/CPU_Project/Controller_1/Controller_SM_tb.v
// Project Name:  Controller_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller_SM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Controller_SM_tb;

	// Inputs
	reg [5:0] Opcode;
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] ALUOp;
	wire ALUSrcA;
	wire [1:0] ALUSrcB;
	wire PCWrite;
	wire [1:0] PCSource;
	wire PCWriteCond;
	wire MemRead;
	wire MemWrite;
	wire MemToReg;
	wire RegDst;
	wire RegWrite;
	wire IRWrite;
	wire [3:0] state, next_state;
	
	// Instantiate the Unit Under Test (UUT)
	Controller_SM uut (
		.Opcode(Opcode), 
		.clk(clk), 
		.reset(reset), 
		.ALUOp(ALUOp), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.PCWrite(PCWrite), 
		.PCSource(PCSource), 
		.PCWriteCond(PCWriteCond), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemToReg(MemToReg), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.IRWrite(IRWrite),
		.state(state),
		.next_state(next_state)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		Opcode = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100
		Opcode = 6'b000000;
		
		#100
		Opcode = 6'b110010;
		
		#100
		Opcode = 6'b111100;
		
		#100
		Opcode = 6'b000001;
		
		#100
		Opcode = 6'b100001;
		
		#100
		Opcode = 6'b110010;
		
		#100
		Opcode = 6'b010010;
		
		#100
		Opcode = 6'b111011;
		
		
        
		// Add stimulus here

	end
      
endmodule

