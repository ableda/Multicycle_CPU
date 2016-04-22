`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:16 10/06/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(a,b,result,ALUop);
	
	parameter DATA_WIDTH = 32;
	
	input [DATA_WIDTH-1:0] a, b;
	input [2:0] ALUop;
	output [DATA_WIDTH-1:0] result;
	
	wire [DATA_WIDTH:0] carry;
	wire bit_1, bit_0;
	
	//For negative inputs in b
	wire signed [DATA_WIDTH:0] bs; 
	assign bs = b;
	
	assign bit_1 = 1'b1;
	assign bit_0 = 1'b0;
	
	MUX_3x2_1bit mux3(bit_0,bit_1,carry[0],ALUop);
	
	wire [DATA_WIDTH-1:0] SLT_out, ALU_out;

	assign SLT_out = ( a < bs) ? 32'd1:32'd0;
	
	genvar i;
	generate
		for(i = 0; i < DATA_WIDTH; i = i+1)
			begin: alu
			ALU_1bit alui(a[i],b[i],carry[i],ALU_out[i],carry[i+1],ALUop);
			end
	endgenerate
	
	assign result = (ALUop == 3'b111) ? SLT_out:ALU_out;
	
	
endmodule
