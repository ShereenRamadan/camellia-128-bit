`timescale 1ns / 1ps


module Subkeys_128bits(
 input  wire          CLK ,
 input  wire          RST ,
 input  wire  [127:0] KL ,
 input  wire  [127:0] KA ,
 output reg   [63:0] kw1,kw2 ,              // Prewhitening 
 output reg   [63:0] k1,k2,k3,k4,k5,k6 ,    // input for first 6 function
 output reg   [63:0] kL1,kL2 ,              // input for first fl and fli
 output reg   [63:0] k7,k8,k9,k10,k11,k12 , // input for second 6 function
 output reg   [63:0] kL3,kL4 ,              // input for scond fl and fli
 output reg   [63:0] k13,k14,k15,k16,k17,k18 , // input for third 6 function
 output reg   [63:0] kw3,kw4                   // Postwhitening
    );
    
 always @(posedge CLK ,negedge RST)
    begin
     if(!RST) begin
       
        kw1 <= 64'd0 ;
        kw2 <= 64'd0 ;
        
        k1  <= 64'd0 ;
        k2  <= 64'd0 ;
        k3  <= 64'd0 ;
        k4  <= 64'd0 ;
        k5  <= 64'd0 ;
        k6  <= 64'd0 ;
        
        kL1 <= 64'd0 ;
        kL2 <= 64'd0 ;
        
        k7  <= 64'd0 ;
        k8  <= 64'd0 ;
        k9  <= 64'd0 ;
        k10 <= 64'd0 ;
        k11 <= 64'd0 ;
        k12 <= 64'd0 ;
        
        kL3 <= 64'd0 ;
        kL4 <= 64'd0 ;
        k13 <= 64'd0 ;
        k14 <= 64'd0 ;
        k15 <= 64'd0 ;
        k16 <= 64'd0 ;
        k17 <= 64'd0 ;
        k18 <= 64'd0 ;
         
        kw3 <= 64'd0 ;
        kw4 <= 64'd0 ;  
       end   
     else 
       begin
        kw1 <= (KL ) >> 64;
        kw2 <= (KL ) & 64'hffffffffffffffff;
        
        k1  <= (KA ) >> 64;
        k2  <= (KA ) & 64'hffffffffffffffff;
        k3  <= ({KL[112 :0] ,KL[127:113]}) >> 64;
        k4  <= ({KL[112 :0] ,KL[127:113]}) & 64'hffffffffffffffff;
        k5  <= ({KA[112 :0] ,KA[127:113]}) >> 64;
        k6  <= ({KA[112 :0] ,KA[127:113]}) & 64'hffffffffffffffff;
        
        kL1 <= ({KA[97 :0] ,KA[127:98]}) >> 64;
        kL2 <= ({KA[97 :0] ,KA[127:98]}) & 64'hffffffffffffffff;
        
        k7  <= ({KL[82 :0] ,KL[127:83]}) >> 64;
        k8  <= ({KL[82 :0] ,KL[127:83]}) & 64'hffffffffffffffff;
        k9  <= ({KA[82 :0] ,KA[127:83]}) >> 64;
        k10 <= ({KL[67 :0] ,KL[127:68]}) & 64'hffffffffffffffff;
        k11 <= ({KA[67 :0] ,KA[127:68]}) >> 64;
        k12 <= ({KA[67 :0] ,KA[127:68]}) & 64'hffffffffffffffff;
        
        kL3 <= ({KL[50 :0] ,KL[127:51]}) >> 64;
        kL4 <= ({KL[50 :0] ,KL[127:51]}) & 64'hffffffffffffffff;
        
        k13 <= ({KL[33 :0] ,KL[127:34]}) >> 64;
        k14 <= ({KL[33 :0] ,KL[127:34]}) & 64'hffffffffffffffff;
        k15 <= ({KA[33 :0] ,KA[127:34]}) >> 64;
        k16 <= ({KA[33 :0] ,KA[127:34]}) & 64'hffffffffffffffff;
        k17 <= ({KL[16 :0] ,KL[127:17]}) >> 64;
        k18 <= ({KL[16 :0] ,KL[127:17]}) & 64'hffffffffffffffff;
        
        kw3 <= ({KA[16 :0] ,KA[127:17]}) >> 64;
        kw4 <= ({KA[16 :0] ,KA[127:17]}) & 64'hffffffffffffffff; 
       end 
    end
    
    
    
endmodule
