`timescale 1ns / 1ps


module SBOX_4(
    input         clk,               // Clock signal
    input   [7:0] addra_s4,       // Address for port A
    input   [7:0] addrb_s4,       // Address for port B
    output  [7:0] douta_s4,      // Data output for port A
    output  [7:0] doutb_s4 
    );
    
     wire [7:0] s1_douta, 
                s1_doutb, 
                addra, 
                addrb;
                
     // Instantiate SBOX1
    SBOX_1 s1_inst (
        .clk(clk),                
        .addra(addra),            
        .addrb(addrb),           
        .douta(s1_douta),         
        .doutb(s1_doutb)          
    );
   
  assign  addra = {addra_s4[6:0],addra_s4[7]} ;
  assign  addrb = {addrb_s4[6:0],addrb_s4[7]} ;
  
  assign douta_s4 = s1_douta;
  assign doutb_s4 = s1_doutb;
  
  
   
endmodule
