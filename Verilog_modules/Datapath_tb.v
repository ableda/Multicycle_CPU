`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:20:42 04/07/2016
// Design Name:   Datapath
// Module Name:   /ad/eng/users/a/b/ableda/EC_413/CPU_Project/DATAPATH/Datapath_1/Datapath_tb.v
// Project Name:  Datapath_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Datapath_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [2:0] ALUOp;
	reg ALUSrcA;
	reg [1:0] ALUSrcB;
	reg MemToReg;
	reg [1:0] PCSource;
	reg IRWrite;
	reg MemWrite;
	reg PCWrite;
	reg PCWriteCond;
	reg RegWrite;

	// Outputs
	wire [5:0] Opcode;
	
	// Instantiate the Unit Under Test (UUT)
	Datapath uut (
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
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		ALUOp = 0;
		ALUSrcA = 0;
		ALUSrcB = 0;
		MemToReg = 0;
		PCSource = 0;
		IRWrite = 0;
		MemWrite = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		RegWrite = 0;
		
		#10;
		reset = 1;
		
	
		// Wait 100 ns for global reset to finish
		#10;
		#10;
				// 0
				reset = 0;
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
				
		#10;
				// 1
				ALUOp = 3'b010; // Add function
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b10;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;
//				
//		#10;
//				// 2
//				ALUOp = 3'b010; // Add function
//				ALUSrcA = 1'b1;
//				ALUSrcB = 2'b10;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
				
				
				// 3
				ALUOp = 3'b010; 					
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b10;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;			
//				
//				
//				// 4			
//				ALUOp = Opcode[2:0]; 				
//				ALUSrcA = 1'b1;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;			
//				
//				
//				// 5
//				ALUOp = 3'b011; 
//				ALUSrcA = 1'b1;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b0;
//				PCSource = 2'b01;
//				IRWrite = 1'b1;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b1;			
//				
//				
//				// 6			
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b1;
//				PCSource = 2'b10;
//				IRWrite = 1'b1;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;			
				
//		#100;	
//				// 7				
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;				
				
	#10;	
			// 8			
				ALUOp = 3'b000; 
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b00;
				PCWrite = 1'b00;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b1;
				PCWriteCond = 1'b0;				
				
//		#10;
//				// 9				
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b1;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b1;
//				PCWriteCond = 1'b0;				
				
//				
//				// 10				
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0; 
//				MemWrite = 1'b1; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;

		#10;
				// 0
				reset = 0;
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
				
		#10;
				// 1
				ALUOp = 3'b010; // Add function
				ALUSrcA = 1'b0;
				ALUSrcB = 2'b10;
				PCWrite = 1'b0;
				PCSource = 2'b00;
				IRWrite = 1'b0;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b0;
	
		#10;
				// 5
				ALUOp = 3'b011; 
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b00;
				PCWrite = 1'b0;
				PCSource = 2'b01;
				IRWrite = 1'b1;
				MemToReg = 1'b0;
				MemWrite = 1'b0; 
				RegWrite = 1'b0;
				PCWriteCond = 1'b1;	


//				
//		#10;	// 3
//				ALUOp = 3'b011; 					
//				ALUSrcA = 1'b1;
//				ALUSrcB = 2'b10;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;	
//								
//		#10;	//Default
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b1;
//				PCWriteCond = 1'b0;

	
//
//	#10;
//				// 0
//				ALUOp = 3'b010; // Add function, exact reference to be determined
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b01;
//				PCWrite = 1'b1;
//				PCSource = 2'b00;
//				IRWrite = 1'b1;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
//				
//	#10;
//				// 1
//				ALUOp = 3'b010; // Add function
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b10;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
//
//
//		#10;
//				// 2
//				ALUOp = 3'b010; // Add function
//				ALUSrcA = 1'b1;
//				ALUSrcB = 2'b10;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
//
//	#10;	
//			// 8			
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b1;
//				PCWriteCond = 1'b0;
//
//#10;
//				// 0
//				ALUOp = 3'b010; // Add function, exact reference to be determined
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b01;
//				PCWrite = 1'b1;
//				PCSource = 2'b00;
//				IRWrite = 1'b1;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
//				
//		#10;
//				// 1
//				ALUOp = 3'b010; // Add function
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b10;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
//
//		#10;
//						// 4			
//				ALUOp = 3'b011; 				
//				ALUSrcA = 1'b1;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b0;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;	
//
//	#10;	
//			// 8			
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b1;
//				PCWriteCond = 1'b0;								
			
				
//			#10;
//				// DEFAULT
//				ALUOp = 3'b000; 
//				ALUSrcA = 1'b0;
//				ALUSrcB = 2'b00;
//				PCWrite = 1'b00;
//				PCSource = 2'b00;
//				IRWrite = 1'b0;
//				MemToReg = 1'b0;
//				MemWrite = 1'b0; 
//				RegWrite = 1'b0;
//				PCWriteCond = 1'b0;
			end	
        
		// Add stimulus here
      
endmodule

