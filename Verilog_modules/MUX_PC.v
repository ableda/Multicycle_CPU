`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:05 04/05/2016 
// Design Name: 
// Module Name:    MUX_PC 
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
module MUX_PC( ALUOut, ALUOut_reg, Extended_Jump, PCSource, PC_in
    ); 
	 input [31:0] ALUOut, ALUOut_reg, Extended_Jump;
	 input [1:0] PCSource;
	 output reg [31:0] PC_in;
	 
	 always@(*)
	 begin
		 case(PCSource)
		 2'b00: PC_in = ALUOut;
		 2'b01: PC_in = ALUOut_reg;
		 2'b10: PC_in = Extended_Jump;
		 endcase
	 end
endmodule
