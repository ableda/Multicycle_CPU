`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:09 04/08/2016 
// Design Name: 
// Module Name:    Branch 
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
module Branch( ALUOut_in, branch
    );
	 
	 input [31:0] ALUOut_in;
	 output reg branch;
	 
	 always@(ALUOut_in)
		begin
		if( ALUOut_in == 32'h0000)
			 branch <= 1'b0;
		else 
			 branch <= 1'b1;
		end


endmodule
