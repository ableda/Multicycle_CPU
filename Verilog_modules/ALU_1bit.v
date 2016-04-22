`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:57 10/08/2015 
// Design Name: 
// Module Name:    ALU_1bit 
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
module ALU_1bit(a,b,c_in,result,c_out,ALUop);

	input a, b;
	input c_in;
	input [2:0] ALUop;
	output c_out;
	output result;
	
	wire mov_out;
	wire not_out;
	wire add_out;
	wire sub_out;
	wire or_out;
	wire and_out;
	wire xor_out;
	
	wire c_out_add, c_out_sub;

	mov_ALU mov1(a,mov_out);
	not_ALU not1(a,not_out);
	add_ALU add1(a,b,c_in,add_out,c_out_add);
	sub_ALU sub1(a,b,c_in,sub_out,c_out_sub);
	or_ALU or1(a,b,or_out);
	and_ALU and1(a,b,and_out);
	xor_ALU xor1(a,b,xor_out);
	
	MUX_3x8_1bit mux1(mov_out,not_out,add_out,sub_out,or_out,and_out,xor_out,result,ALUop);
	MUX_3x2_1bit mux2(c_out_add,c_out_sub,c_out,ALUop);
	
endmodule
