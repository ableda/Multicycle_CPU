`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:53 04/04/2016 
// Design Name: 
// Module Name:    MEM_D_reg 
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
module MEM_D_reg( mem_input, Mem_D_out, reset, clk
    );
	 
	 input [31:0] mem_input;
	 input reset, clk;
	 output reg [31:0] Mem_D_out;

	always@(posedge clk)
		begin
			if(reset)
			begin
			Mem_D_out <= 32'd0;
			end
			
			else
			begin
			Mem_D_out <= mem_input;
			end
		end
endmodule
