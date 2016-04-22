`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:38:08 03/17/2016
// Design Name:   ALU
// Module Name:   /ad/eng/users/a/b/ableda/EC_413/Lab_6/ALU_TEST/ALU_tb.v
// Project Name:  ALU_TEST
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

parameter DATA_WIDTH = 32;

	// Inputs
	reg [DATA_WIDTH-1:0] a;
	reg [DATA_WIDTH-1:0] b;
	reg [2:0] ALUop;

	// Outputs
	wire [DATA_WIDTH-1:0] result;
	wire [DATA_WIDTH-1:0] result_verify;

	// Instantiate the Unit Under Test (UUT)
	ALU
	#(DATA_WIDTH)
	uut (
		.a(a), 
		.b(b), 
		.result(result), 
		.ALUop(ALUop)
	);
	
	Verification_ALU
	#(DATA_WIDTH)
	VerALU ( 
		.a(a),
		.b(b),
		.result(result_verify),
		.ALUop(ALUop)
	);
	
	assign error_flag = (result != result_verify);
	
	// Verification logic
	always@(a,b,ALUop)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d", a, b);
		end

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ALUop = 0;

		// Wait 100 ns for global reset to finish
		#100
		a = 32'h00ffff00;
		b = 32'hffffffae;
		ALUop = 3'b000;
		#100
		a = 32'haebc233;
		b = 32'haebc234;
		ALUop = 3'b000;
		#100
		a = 32'hffffffff;
		b = 32'b00000000;
		ALUop = 3'b000;
		
		
		#100
		a = 32'hffffffff;
		b = 32'hff00ff00;
		ALUop = 3'b001;
		#100
		a = 32'h00000000;
		b = 32'h00ff00ff;
		ALUop = 3'b001;
		#100
		a = 32'hf0f0f0f0;
		b = 32'h0f0f0f0f;
		ALUop = 3'b001;
		
		
		#100
		a = 32'hfffffffe;
		b = 32'h00000001;
		ALUop = 3'b010;
		#100
		a = 32'hffffffff;
		b = 32'h00000001;
		ALUop = 3'b010;
		#100
		a = 32'h00000000;
		b = 32'hffffffff;
		ALUop = 3'b010;
		
		
		#100
		a = 32'hffffffff;
		b = 32'h00000001;
		ALUop = 3'b011;
		#100
		a = 32'h00000001;
		b = 32'h00000002;
		ALUop = 3'b011;
		#100
		a = 32'h12345678;
		b = 32'h12345670;
		ALUop = 3'b011;
		
		
		#100
		a = 32'h12345678;
		b = 32'h00000000;
		ALUop = 3'b100;
		#100
		a = 32'h00001234;
		b = 32'h1234ffff;
		ALUop = 3'b100;
		#100
		a = 32'hffffffff;
		b = 32'hf0123455;
		ALUop = 3'b100;
		
		
		#100
		a = 32'hf0f0f0f0;
		b = 32'h0f0f0f0f;
		ALUop = 3'b101;
		#100
		a = 32'h12345678;
		b = 32'h12345679;
		ALUop = 3'b101;
		#100
		a = 32'h00000000;
		b = 32'h00000f12;
		ALUop = 3'b110;
		
		#100
		a = 32'h000000F1;
		b = 32'h00000000;
		ALUop = 3'b110;
		
		#100
		a = 32'h00000001;
		b = 32'h000000FF;
		ALUop = 3'b111;
        
        
		// Add stimulus here

	end
      
endmodule

