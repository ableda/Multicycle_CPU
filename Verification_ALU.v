`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:39 10/09/2015 
// Design Name: 
// Module Name:    Verification_ALU 
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
module Verification_ALU(a,b,result,ALUop);

	parameter DATA_WIDTH = 32;
	
	input [DATA_WIDTH-1:0] a, b;
	input [2:0] ALUop;

	output reg [DATA_WIDTH-1:0] result;
	
	always@(a,b,ALUop)
	begin
	case(ALUop)
		3'b000: assign result = a;
		3'b001: assign result = ~a;
		3'b010: assign result = a+b;
		3'b011: assign result = a-b;
		3'b100: assign result = a|b;
		3'b101: assign result = a&b;
		3'b110: assign result = a^b;
		3'b111: assign result = (($signed(a) < $signed(b)) ? 1:0);
	endcase
	end

endmodule
