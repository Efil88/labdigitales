`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: Alejandro Ugarte, Juan Carlos Montero
// 
// Create Date:    21:41:25 08/05/2015 
// Design Name:    
// Module Name:    maquinaDig 
// Project Name: 
// Target Devices: nexys 3
// Tool versions: 
// Description: programa que modela una maquina de estados en lenguaje de alto nivel
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module maquinaDig(
		
		input cristal_i, RST_rst_i,Sensor_Temp_i,Sensor_Humo_i, 
		output wire [3:0] an_o,
		output wire Led1_o, Led2_o, Led3_o,
		output wire a_o, b_o, c_o, d_o, e_o, f_o, g_o, dp_o
		);
		wire [6:0] variablealerta_o, variableestado_o;
		wire CLK_clk_o;
//CLK_clk_i
// Instantiate the module
CLK_clk_o100 CLK_clk_o100 (
    .cristal_i(cristal_i), 
    .RST_rst_i(RST_rst_i), 
    .CLK_clk_o(CLK_clk_o)
    );
	 
// Instantiate the module
maq_Digitales maq_Digitales (
    .Sensor_Temp_i(Sensor_Temp_i), 
    .Sensor_Humo_i(Sensor_Humo_i), 
    .CLK_clk_i(CLK_clk_o), 
    .RST_rst_i(RST_rst_i), 
	 .variablealerta_o(variablealerta_o), 
    .variableestado_o(variableestado_o), 
    .Led1_o(Led1_o), 
    .Led2_o(Led2_o), 
    .Led3_o(Led3_o)
    );
	 

//	 wire [3:0] estado;
// Instantiate the module
sevenseg sevenseg (
    .CLK_clk_i(cristal_i), 
    .RST_rst_i(RST_rst_i), 
    .in0_i(variableestado_o),  
    .in3_i(variablealerta_o), 
    .a_o(a_o), 
    .b_o(b_o), 
    .c_o(c_o), 
    .d_o(d_o), 
    .e_o(e_o), 
    .f_o(f_o), 
    .g_o(g_o), 
    .dp_o(dp_o), 
    .an_o(an_o)
    );




	
	
endmodule
