`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:52 04/04/2016 
// Design Name: 
// Module Name:    MUX_SrcB 
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
module MUX_SrcB( B_out, Sign_Ext_Imm, MUX_SrcB_out, ALUSrcB
    );
	 
	 input [31:0] B_out, Sign_Ext_Imm;
	 input [1:0] ALUSrcB;
	 output reg [31:0] MUX_SrcB_out;
	 
	 always@(*)
	 begin
	 case(ALUSrcB) 
		2'b00: MUX_SrcB_out = B_out;
		2'b01: MUX_SrcB_out = 32'd1;
		2'b10: MUX_SrcB_out = Sign_Ext_Imm;
	endcase
	end

endmodule
