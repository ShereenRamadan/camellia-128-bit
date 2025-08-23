`timescale 1ns / 1ps


module Key_subkeys(
 input  wire CLK ,
 input  wire RST ,
 input  wire  [127:0] KL ,
 output wire   [63:0] kw1,kw2 ,              // Prewhitening 
 output wire   [63:0] k1,k2,k3,k4,k5,k6 ,    // input for first 6 function
 output wire   [63:0] kL1,kL2 ,              // input for first fl and fli
 output wire   [63:0] k7,k8,k9,k10,k11,k12 , // input for second 6 function
 output wire   [63:0] kL3,kL4 ,              // input for scond fl and fli
 output wire   [63:0] k13,k14,k15,k16,k17,k18 , // input for third 6 function
 output wire   [63:0] kw3,kw4                   // Postwhitening
    );
    
    wire [127:0] ka ;
    
    Key_Schedule K_S (
      .CLK(CLK) ,
      .RST(RST) ,
      .KL(KL) ,
//      .KR(128'd0) ,
      .KA(ka) 
//      .KB(kb)
    );
    
    Subkeys_128bits S_B (
      .CLK(CLK) ,
      .RST(RST) ,
      .KL(KL) ,
      .KA(ka) ,
      
      .kw1(kw1),
      .kw2(kw2) , 
                   
      .k1(k1),
      .k2(k2),
      .k3(k3),
      .k4(k4),
      .k5(k5),
      .k6(k6) ,
          
      .kL1(kL1),
      .kL2(kL2) ,
                    
      .k7(k7),
      .k8(k8),
      .k9(k9),
      .k10(k10),
      .k11(k11),
      .k12(k12) ,
       
      .kL3(kL3),
      .kL4(kL4) ,
                    
      .k13(k13),
      .k14(k14),
      .k15(k15),
      .k16(k16),
      .k17(k17),
      .k18(k18) ,
       
      .kw3(kw3),
      .kw4(kw4)              
    );
endmodule
