`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:36 04/05/2016 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath( clk, reset, ALUOp, ALUSrcA, ALUSrcB, MemToReg, PCSource, IRWrite,
						MemWrite, PCWrite, PCWriteCond, Opcode, RegWrite,  
    );
	 
	 // Datapath Module, includes all hardware to be able to perform the desired instructions
	 // Puts together all the different seperate modules.
	 
		input clk, reset, MemToReg, ALUSrcA, PCWrite, PCWriteCond, MemWrite;
		input IRWrite, RegWrite;
		input [2:0] ALUOp;
		input [1:0] ALUSrcB, PCSource;
		output [5:0] Opcode;
		
		wire [31:0] PC_out, Instr;
		wire [4:0] read_sel_1, read_sel_2, write_address;
		wire [15:0] Immediate;
		wire [31:0] ALUOut_in;
		wire [25:0] Jump_Imm;
		wire [31:0] A_in, B_in, write_data, A_out, B_out;
		wire [31:0] Sign_Ext_Imm,  Shift_left_2;
		wire [31:0] ALU_in_b, ALU_in_a;
		wire [31:0] mem_input, ALUOut_reg, Mem_D_out;
		wire [31:0] Jump_Ext_Imm, PC_in, Branch_Target;
		wire conditional, PC_enable;
		wire branch;
		
		// PC Register stores program counter
		PC_reg PC (
		.PC_in(PC_in), 
		.PC_out(PC_out), 
		.PC_enable(PC_enable), 
		.reset(reset), 
		.clk(clk)
		);
		
		//Instruction Memory provides all the instructions
		IMem IM (
		.PC(PC_out[15:0]),          
      .Instruction(Instr)
		);
		
		//Instruction register stores instructions to be executed
		Instr_reg ID( 
		.IRWrite(IRWrite), 
		.Instr(Instr), 
		.opcode(Opcode), 
		.read_sel_1(read_sel_1), 
		.read_sel_2(read_sel_2), 
		.write_address(write_address),
		.Immediate(Immediate), 
		.clk(clk), 
		.reset(reset),
		.Jump_Imm(Jump_Imm)
		);
		
		//Register File, provides all the registers necessary to process data
		nbit_register_file RegFile( 
		.write_data(write_data), 
      .read_data_1(A_in), 
		.read_data_2(B_in), 
      .read_sel_1(read_sel_1), 
		.read_sel_2(read_sel_2), 
      .write_address(write_address), 
		.RegWrite(RegWrite), 
		.clk(clk)
		);
		
		//Register that stores one of the outputs of the register file
		A_reg AR(
		.A_in(A_in), 
		.A_out(A_out), 
		.reset(reset), 
		.clk(clk)
		);
		
		//Register that stores the second of the outputs of the register file
		B_reg BR (
		.B_in(B_in), 
		.B_out(B_out), 
		.reset(reset), 
		.clk(clk)
		);
		
		//Shign extends imediate to be used in ALU calculations
		assign Sign_Ext_Imm = (Immediate[14]) ? {16'hffff, Immediate} : {16'h0000, Immediate};
		
		//Mux that selects the second input to the ALU
		MUX_SrcB SB ( 
		.B_out(B_out), 
		.Sign_Ext_Imm(Sign_Ext_Imm), 
		.MUX_SrcB_out(ALU_in_b), 
		.ALUSrcB(ALUSrcB)
		);
		
		//Mux that selects first input to the ALU
		MUX_SrcA SA( 
		.A_out(A_out), 
		.PC_out(PC_out), 
		.ALUSrcA(ALUSrcA), 
		.MUX_SrcA_out(ALU_in_a) 
		);
		
		//The ALU module
		ALU alu(
		.a(ALU_in_a),
		.b(ALU_in_b),
		.result(ALUOut_in),
		.ALUop(ALUOp)
		);
		
		//Register that stores the output of the ALU
		ALUOut_reg AOR( 
		.ALUOut_in(ALUOut_in), 
		.ALUOut_reg(ALUOut_reg), 
		.reset(reset), 
		.clk(clk)
		);
		
		//Data memory, stores and reads data to and from the register file
		DMem memd(
		.WriteData(ALU_in_b),   
      .MemData(mem_input),     
      .Address(ALUOut_reg[15:0]),     
      .MemWrite(MemWrite),  
      .Clk(clk)
		);  
		
		//Module calculates if there is a branch in the BNE case
		Branch B(
		.ALUOut_in(ALUOut_in),
		.branch(branch)
		);
		
		// Two gates to provide logic on wether branches should be taken
		and a1(conditional, branch, PCWriteCond); 
		or o1(PC_enable, PCWrite, conditional);
		
		//Register that stores output of data memory
		MEM_D_reg MR2( 
		.mem_input(mem_input), 
		.Mem_D_out(Mem_D_out), 
		.reset(reset), 
		.clk(clk)
		);
		//Mux selects what is written to the register file
		MUX_Write_data MW( 
		.Mem_D_out(Mem_D_out), 
		.ALUOut_reg(ALUOut_reg), 
		.MemToReg(MemToReg), 
		.write_data(write_data)
		);
		
		// Calculation of jump and branch targets
		assign Jump_Ext_Imm = (Jump_Imm[25]) ? {6'b111111, Jump_Imm} : {6'b000000, Jump_Imm};
		assign Branch_Target = PC_out + Sign_Ext_Imm;
		
		//Assigns what will be forwarded to the program counter register
		MUX_PC MPC( 
		.ALUOut(ALUOut_in), 
		.ALUOut_reg(Branch_Target), 
		.Extended_Jump(Jump_Ext_Imm), 
		.PCSource(PCSource), 
		.PC_in(PC_in)
		); 

endmodule
