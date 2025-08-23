`timescale 1ns / 1ps


module Encryption_TOP(
 input  wire CLK ,
 input  wire RST ,
 input  wire data_valid,
 input  wire [127:0] M ,
 input  wire [127:0] KL ,
 output wire  [127:0] C ,
 output wire out_rdy
    );
    
    wire [127:0] ka  ;
    wire [63:0] kw_1 , kw_2 ;
    wire [63:0] k_1,k_2,k_3,k_4,k_5,k_6 ;    
    wire [63:0] kL_1,kL_2 ;              
    wire [63:0] k_7,k_8,k_9,k_10,k_11,k_12 ; 
    wire [63:0] kL_3,kL_4 ;              
    wire [63:0] k_13,k_14,k_15,k_16,k_17,k_18 ; 
    wire [63:0] kw_3,kw_4 ;
    wire [63:0] L0, R0;  
    wire [63:0] OUT_L_1 , OUT_R_1;
    wire [63:0] OUT_FL1, OUT_FLi1; 
    wire [63:0] OUT_L_2 , OUT_R_2; 
    wire [63:0] OUT_FL2, OUT_FLi2; 
    wire [63:0] L_18, R_18;
    wire [63:0] CL, CR;
    
    



    counter c1 (
      .clk(CLK),
      .rst(RST),
      .data_valid(data_valid),
      .out_rdy(out_rdy)
      );
    
    Key_subkeys k_top (
      .CLK(CLK) ,
      .RST(RST) ,
      .KL(KL) ,
      
      .kw1(kw_1),
      .kw2(kw_2) , 
                   
      .k1(k_1),
      .k2(k_2),
      .k3(k_3),
      .k4(k_4),
      .k5(k_5),
      .k6(k_6) ,
          
      .kL1(kL_1),
      .kL2(kL_2) ,
                    
      .k7(k_7),
      .k8(k_8),
      .k9(k_9),
      .k10(k_10),
      .k11(k_11),
      .k12(k_12) ,
       
      .kL3(kL_3),
      .kL4(kL_4) ,
                    
      .k13(k_13),
      .k14(k_14),
      .k15(k_15),
      .k16(k_16),
      .k17(k_17),
      .k18(k_18) ,
       
      .kw3(kw_3),
      .kw4(kw_4)
       
    );
   
     xorx x1 (
     .in1(M[127:64]),
     .in2(kw_1),
     .out(L0)
    );
    
     xorx x2 (
     .in1(M[63:0]),
     .in2(kw_2),
     .out(R0)
    );
    
//    assign L0 = M[127:64] ^ kw_1 ;
//    assign R0 = M[63:0]   ^ kw_2 ;
    
    Encryption_Procedure EP_1( 
        .CLK(CLK), 
        .RST(RST),
        .In_L(L0), 
        .In_R(R0),
        .K1(k_1), 
        .K2(k_2), 
        .K3(k_3), 
        .K4(k_4), 
        .K5(k_5), 
        .K6(k_6),
        .OUT_L(OUT_L_1), 
        .OUT_R(OUT_R_1)
    );
    
    
    FL_Function FL_1(
       .clk(CLK),
       .RST(RST),
       .X(OUT_L_1),
       .KI_l(kL_1[63:32]), 
       .KI_r(kL_1[31:0]),
       .Y(OUT_FL1) 
    );
    
    FLi_Function FLI_1(
        .clk(CLK),
        .RST(RST),
        .Yi(OUT_R_1),
        .KI_l(kL_2[63:32]), 
        .KI_r(kL_2[31:0]),
        .Xi(OUT_FLi1) 
    );
    
    
    Encryption_Procedure EP_2( 
        .CLK(CLK), 
        .RST(RST),
        .In_L(OUT_FL1), 
        .In_R(OUT_FLi1),
        .K1(k_7), 
        .K2(k_8), 
        .K3(k_9), 
        .K4(k_10), 
        .K5(k_11), 
        .K6(k_12),
        .OUT_L(OUT_L_2), 
        .OUT_R(OUT_R_2)
    );
    
    
    FL_Function FL_2(
       .clk(CLK),
       .RST(RST),
       .X(OUT_L_2),
       .KI_l(kL_3[63:32]), 
       .KI_r(kL_3[31:0]),
       .Y(OUT_FL2) 
    );
    
    FLi_Function FLI_2(
        .clk(CLK),
        .RST(RST),
        .Yi(OUT_R_2),
        .KI_l(kL_4[63:32]), 
        .KI_r(kL_4[31:0]),
        .Xi(OUT_FLi2) 
    );
    
    
    Encryption_Procedure EP_3( 
        .CLK(CLK), 
        .RST(RST),
        .In_L(OUT_FL2), 
        .In_R(OUT_FLi2),
        .K1(k_13), 
        .K2(k_14), 
        .K3(k_15), 
        .K4(k_16), 
        .K5(k_17), 
        .K6(k_18),
        .OUT_L(L_18), 
        .OUT_R(R_18)
    );
    

     xorx x3 (
     .in1(R_18),
     .in2(kw_3),
     .out(C[127:64])
    );
    
     xorx x4 (
     .in1(L_18),
     .in2(kw_4),
     .out(C[63:0])
    );



//    assign C[127:64] = kw_3 ^ R_18;
//    assign C[63:0] = kw_4 ^ L_18;
    

   
        
endmodule
