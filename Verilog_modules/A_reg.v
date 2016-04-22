`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:39 04/04/2016 
// Design Name: 
// Module Name:    A_reg 
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
module A_reg( A_in, A_out, reset, clk
    );
	 input [31:0] A_in;
	 input reset, clk;
	 output reg [31:0] A_out;

	always@(posedge clk)
		begin
			if(reset)
			begin
			A_out <= 32'd0;
			end
			else
			begin
			A_out <= A_in;
			end
		end
endmodule

