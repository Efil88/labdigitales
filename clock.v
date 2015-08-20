`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:46 08/05/2015 
// Design Name: 
// Module Name:    clock 
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
module CLK_clk_o100(
    input cristal_i,
    input RST_rst_i,
    output reg CLK_clk_o
    );
	 
	 //cliclos
	 localparam constantNumber = 500000;
	 
	 reg [18:0] count;
	 
		//Contador
		always @ (posedge(cristal_i), posedge(RST_rst_i))
		begin
			if (RST_rst_i)
				begin
					count <= 0;
					CLK_clk_o <= 0;
				end
				
			else if (count == constantNumber - 1)
				begin
					count <= 0;
					CLK_clk_o<= !CLK_clk_o;
				end
				
			else
				begin 
					count <= count + 1'b1;
					CLK_clk_o <= CLK_clk_o;
				end
		end
			
			 
endmodule


