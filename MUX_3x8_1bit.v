`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:17 10/08/2015 
// Design Name: 
// Module Name:    MUX_3x8_1bit 
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
module MUX_3x8_1bit(mov_in,not_in,add_in,sub_in,or_in,and_in,xor_in,out,ALUop);

	input mov_in, not_in, add_in, sub_in, or_in, and_in, xor_in;
	input [2:0] ALUop;
	output reg out;
	
	always@(*)
	begin
	case(ALUop)
		3'b000:  out = mov_in;
		3'b001:  out = not_in;
		3'b010:  out = add_in;
		3'b011:  out = sub_in;
		3'b100:  out = or_in;
		3'b101:  out = and_in;
		3'b110: 	out = xor_in;
	endcase
	end
endmodule
