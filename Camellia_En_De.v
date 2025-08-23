`timescale 1ns / 1ps


module Camellia_En_De(
 input  wire CLK_t ,
 input  wire RST_t ,
 input  wire control ,
 input  wire data_valid_t ,
 input  wire [127:0] in_t ,
 input  wire [127:0] KL_t ,
 output wire  [127:0] out_t ,
 output wire out_rdy_t
 
    );
    
     wire [127:0] out_en , out_de ;
     wire         out_rdy_en ,out_rdy_de ;
    
    Encryption_TOP en (
       .CLK(CLK_t) ,
       .RST(RST_t) ,
       .data_valid(data_valid_t) ,
       .M(in_t) ,
       .KL(KL_t) ,
       .C(out_en) ,
       .out_rdy(out_rdy_en)
    
    );
    
    Decryption_top de (
      .CLK(CLK_t) ,
      .RST(RST_t) ,
      .data_valid(data_valid_t) ,
      .C(in_t) ,
      .KL(KL_t) ,
      .M(out_de) ,
      .out_rdy(out_rdy_de)
    
    );
    
    mux2X1_128bit m1 (
      .IN_0(out_en),
      .IN_1(out_de),
      .SEL(control),
      .OUT(out_t) 
    );
    
     mux2X1_1bit m2 (
      .IN0(out_rdy_en),
      .IN1(out_rdy_de),
      .SEL(control),
      .OUT(out_rdy_t) 
    );
   
    
endmodule
