`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:31 04/05/2016 
// Design Name: 
// Module Name:    MUX_Write_data 
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
module MUX_Write_data( Mem_D_out, ALUOut_reg, MemToReg, write_data
    );
	 
	 input [31:0] Mem_D_out, ALUOut_reg;
	 input MemToReg;
	 output [31:0] write_data;
	 
	 assign write_data = (MemToReg == 1'b0) ? ALUOut_reg : Mem_D_out;


endmodule
