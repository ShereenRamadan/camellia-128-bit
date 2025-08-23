`timescale 1ns / 1ps


module Key_Schedule(
 input  wire         CLK ,
 input  wire         RST ,
 input  wire [127:0] KL ,
 output wire  [127:0] KA 

    );
    
   
    wire [63:0] DL ,DR ;
    wire [63:0] f1_out , f2_out ; 
    wire [63:0] out1 , out2 ;
    
    wire [127:0] out3 ;
    wire [63:0] out3_L ,out3_R ;
    wire [63:0] f3_out ,f4_out ;
    wire [63:0] out4 ,out5 ;
    
   
   
    
    // The key schedule constants
   wire [63:0]  Sigma1 = 64'hA09E667F3BCC908B;
   wire [63:0]  Sigma2 = 64'hB67AE8584CAA73B2;
   wire [63:0]  Sigma3 = 64'hC6EF372FE94F82BE;
   wire [63:0]  Sigma4 = 64'h54FF53A5F1D36F1C;
  
   
  
   assign  DL = KL[127:64] ;
   assign  DR = KL[63:0] ; 
   
    F_function f1 (
     .CLK(CLK),
     .RST(RST),
     .X(DL),
     .K(Sigma1),
     .Z(f1_out) 
    );
   assign out1 = f1_out ^ DR ; 
   
    F_function f2 (
     .CLK(CLK),
     .RST(RST),
     .X(out1),
     .K(Sigma2),
     .Z(f2_out) 
    );
   assign out2 = f2_out ^ DL ;
   
   
   assign out3 = KL ^ {out2,out1} ;
   assign out3_L = out3[127:64] ;
   assign out3_R = out3[63:0] ; 
    
   F_function f3 (
     .CLK(CLK),
     .RST(RST),
     .X(out3_L),
     .K(Sigma3),
     .Z(f3_out) 
    );  
   assign out4 = f3_out ^ out3_R ;
   
   F_function f4 (
     .CLK(CLK),
     .RST(RST),
     .X(out4),
     .K(Sigma4),
     .Z(f4_out) 
    );  
   assign out5 = f4_out ^ out3_L ;
   assign KA = {out5,out4};       //this output for 128 bit
   

   
endmodule
