`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:39 04/04/2016 
// Design Name: 
// Module Name:    Instr_reg 
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
module Instr_reg( IRWrite, Instr, opcode, read_sel_1, read_sel_2, write_address,
						Immediate, clk, reset, Jump_Imm
    );
	 
	 input [31:0] Instr;
	 input clk, reset, IRWrite;
	 output reg [4:0] read_sel_1, read_sel_2, write_address;
	 output reg [5:0] opcode;
	 output reg [15:0] Immediate;
	 output reg [25:0] Jump_Imm;
	 
	 always@(posedge clk)
		begin
			if(reset)
			begin
			opcode <= 6'd0;
			read_sel_1 <= 5'd0;
			read_sel_2 <= 5'd0;
			write_address <= 5'd0;
			Immediate <= 16'd0;
			Jump_Imm <= 26'd0;
			end
			
			else if (IRWrite == 1'b1)
			begin
				if( Instr[31:26] == 6'b100001)
				begin
				opcode <= Instr[31:26];
				read_sel_1 <= Instr[25:21];
				read_sel_2 <= Instr[20:16];
				write_address <= Instr[25:21];
				Immediate <= Instr[15:0];
				Jump_Imm <= Instr[25:0];
				end
				else if (Instr[31:26] == 6'b111100)
				begin
				opcode <= Instr[31:26];
				read_sel_1 <= Instr[20:16];
				read_sel_2 <= Instr[25:21];
				write_address <= Instr[25:21];
				Immediate <= Instr[15:0];
				Jump_Imm <= Instr[25:0];
				end
				else
				begin
				opcode <= Instr[31:26];
				read_sel_1 <= Instr[20:16];
				read_sel_2 <= Instr[15:11];
				write_address <= Instr[25:21];
				Immediate <= Instr[15:0];
				Jump_Imm <= Instr[25:0];
				end
			end
		end
	
endmodule
