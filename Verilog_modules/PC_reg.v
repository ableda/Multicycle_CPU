`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:24:22 04/04/2016 
// Design Name: 
// Module Name:    PC_reg 
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
module PC_reg( PC_in, PC_out, PC_enable, reset, clk
    );

	 input [31:0] PC_in;
	 input reset, clk, PC_enable;
	 output reg [31:0] PC_out;

	always@(posedge clk)
		begin
			if(reset)
			begin
			PC_out <= 32'd0;
			end
			
			else
			if(PC_enable)
			begin
			PC_out <= PC_in;
			end
		end

endmodule
