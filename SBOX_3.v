`timescale 1ns / 1ps


module SBOX_3(
    input         clk,               // Clock signal
    input   [7:0] addra_s3,       // Address for port A
    input   [7:0] addrb_s3,       // Address for port B
    output  [7:0] douta_s3,      // Data output for port A
    output  [7:0] doutb_s3 
    );
    
     wire [7:0] s1_douta, 
                s1_doutb;
                
     // Instantiate SBOX1
    SBOX_1 s1_inst (
        .clk(clk),                
        .addra(addra_s3),            
        .addrb(addrb_s3),           
        .douta(s1_douta),         
        .doutb(s1_doutb)          
    );
    
    
    
    assign douta_s3 = {s1_douta[0],s1_douta[7:1]};     // Rotate right by 1 bit
    assign doutb_s3 = {s1_doutb[0],s1_doutb[7:1]};     // Rotate right by 1 bit
    
    
endmodule
