`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:33 04/04/2016 
// Design Name: 
// Module Name:    xor_ALU 
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
module xor_ALU( a, b, out
    );
	 
	 input a, b;
	 output out;
	 assign out = ( a ^ b); 
	
endmodule
