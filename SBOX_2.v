`timescale 1ns / 1ps


module SBOX_2(
    input wire       clk,               // Clock signal
    input wire [7:0] addra_s2,         // Address for port A
    input wire [7:0] addrb_s2,        // Address for port B
    output wire [7:0] douta_s2,      // Data output for port A
    output wire [7:0] doutb_s2       // Data output for port B
);

    wire [7:0] s1_douta, 
               s1_doutb;
   


    // Instantiate SBOX1
    SBOX_1 s1_inst (
        .clk(clk),                // Clock signal
        .addra(addra_s2),            // Address for port A
        .addrb(addrb_s2),            // Address for port B
        .douta(s1_douta),         // Data output for port A from SBOX1
        .doutb(s1_doutb)          // Data output for port B from SBOX1
    );

  
    // Perform bit rotation on the outputs of SBOX1
    assign douta_s2 = {s1_douta[6:0], s1_douta[7]}; // Rotate left by 1 bit
    assign doutb_s2 = {s1_doutb[6:0], s1_doutb[7]}; // Rotate left by 1 bit

endmodule