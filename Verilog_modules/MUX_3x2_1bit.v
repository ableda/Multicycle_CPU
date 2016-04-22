`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:50 10/08/2015 
// Design Name: 
// Module Name:    MUX_3x2_1bit 
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
module MUX_3x2_1bit(c_in_add,c_in_sub,c_out,ALUop);
	
	input c_in_add, c_in_sub;
	input [2:0] ALUop;
	output reg c_out;
	
	always@(*)
	begin
	case(ALUop)
		3'b010:  c_out = c_in_add;
		3'b011:  c_out = c_in_sub;
	endcase
	end
	
endmodule
