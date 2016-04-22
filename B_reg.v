`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:05 04/04/2016 
// Design Name: 
// Module Name:    B_reg 
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
module B_reg( B_in, B_out, reset, clk
    );
	 input [31:0] B_in;
	 input reset, clk;
	 output reg [31:0] B_out;

	always@(posedge clk)
		begin
			if(reset)
			begin
			B_out <= 32'd0;
			end
			
			else
			begin
			B_out <= B_in;
			end
		end
endmodule