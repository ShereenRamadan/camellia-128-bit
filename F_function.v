`timescale 1ns / 1ps


module F_function(
    input  wire        CLK,
    input  wire        RST,
    input  wire  [63:0]  X,
    input  wire  [63:0]  K,
    output wire  [63:0]  Z
    );
    
    wire  [63:0]Y;
    wire  [7:0] Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8; 
    wire  [7:0] z1,z2, z3, z4, z5, z6, z7, z8; 
    wire  [7:0] A1, A2, A3, A4, A5, A6, A7, A8;
    wire  [7:0] p1, p2, p3, p4, p5, p6, p7, p8; 
 
    
     // Instantiate SBOX_1
    SBOX_1 s1_inst (
        .clk(CLK),                
        .addra(Y8),            
        .addrb(Y1),           
        .douta(z8),         
        .doutb(z1)          
    );
    
    
    // Instantiate SBOX_2
    SBOX_2 s2_inst (
      .clk(CLK),               
      .addra_s2(Y5),       
      .addrb_s2(Y2),       
      .douta_s2(z5),      
      .doutb_s2(z2)       
);

   // Instantiate SBOX_3
    SBOX_3 s3_inst (
       .clk(CLK),               
       .addra_s3(Y6),       
       .addrb_s3(Y3),       
       .douta_s3(z6),      
       .doutb_s3(z3) 
    );
    
    // Instantiate SBOX_4
    SBOX_4 s4_inst(
       .clk(CLK),               
       .addra_s4(Y7),       
       .addrb_s4(Y4),      
       .douta_s4(z7),      
       .doutb_s4(z4) 
    );
    
    // inputs for sboxes
    assign Y  = X ^ K ;
    assign Y1 = Y[63:56];
    assign Y2 = Y[55:48];
    assign Y3 = Y[47:40];
    assign Y4 = Y[39:32];
    assign Y5 = Y[31:24];
    assign Y6 = Y[23:16];
    assign Y7 = Y[15:8];
    assign Y8 = Y[7:0];
    
     // P-FUNCTION
    assign A1 = z1 ^ z6;
    assign A2 = z2 ^ z7;
    assign A3 = z3 ^ z8;
    assign A4 = z4 ^ z5;
    assign A5 = A3 ^ z5;
    assign A6 = A4 ^ z6;
    assign A7 = A1 ^ z7;
    assign A8 = A2 ^ z8;
    
    
    assign p1 = A1 ^ A8;
    assign p2 = A2 ^ A5;
    assign p3 = A3 ^ A6;
    assign p4 = A4 ^ A7;
    assign p5 = A5 ^ p4;
    assign p6 = A6 ^ p1;
    assign p7 = A7 ^ p2;
    assign p8 = A8 ^ p3;  
    
    assign Z = {p5, p6, p7, p8, p1, p2, p3, p4}; 
    

    
    
endmodule
