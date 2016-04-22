`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:58 04/04/2016 
// Design Name: 
// Module Name:    ALUOut_reg 
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
module ALUOut_reg( ALUOut_in, ALUOut_reg, reset, clk
    );
	 input [31:0] ALUOut_in;
	 input reset, clk;
	 output reg [31:0] ALUOut_reg;

	always@(posedge clk)
		begin
			if(reset)
			begin
			ALUOut_reg <= 32'd0;
			end
			
			else
			begin
			ALUOut_reg <= ALUOut_in;
			end
		end
endmodule
