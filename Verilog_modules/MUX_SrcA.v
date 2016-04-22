`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:07 04/04/2016 
// Design Name: 
// Module Name:    MUX_SrcA 
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
module MUX_SrcA( A_out, PC_out, ALUSrcA, MUX_SrcA_out 
    );
	 
	 input [31:0] A_out, PC_out;
	 input ALUSrcA;
	 output reg [31:0] MUX_SrcA_out;
	 
	 always@(*)
	 begin
	 case(ALUSrcA)
	 1'b1: MUX_SrcA_out = A_out;
	 1'b0: MUX_SrcA_out = PC_out; 
	 endcase
	 end

endmodule
