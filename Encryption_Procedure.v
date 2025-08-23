`timescale 1ns / 1ps


module Encryption_Procedure(
     input             CLK, RST,
     input      [63:0] In_L, In_R,
     input      [63:0] K1, K2, K3, K4, K5, K6,
     output reg [63:0] OUT_L, OUT_R
    );
    
   wire [63:0] f_out_1, f_out_2, f_out_3, f_out_4, f_out_5, f_out_6; 
   wire [63:0] L1, L2, L3, L4, L5; 
   wire [63:0] out_ll, out_rr;
    
   F_function f1(
     .CLK(CLK),
     .RST(RST),
     .X(In_L),
     .K(K1),
     .Z(f_out_1)   
    );
    
    assign L1 =  In_R ^ f_out_1;
    
    F_function f2(
     .CLK(CLK),
     .RST(RST),
     .X(L1),
     .K(K2),
     .Z(f_out_2)   
    );
    
     assign L2 =  In_L ^ f_out_2;
    
    F_function f3(
     .CLK(CLK),
     .RST(RST),
     .X(L2),
     .K(K3),
     .Z(f_out_3)   
    );
    
    assign L3 =  L1   ^ f_out_3;
    
    F_function f4(
     .CLK(CLK),
     .RST(RST),
     .X(L3),
     .K(K4),
     .Z(f_out_4)   
    );
    
    assign L4 =  L2   ^ f_out_4;
    
    F_function f5(
     .CLK(CLK),
     .RST(RST),
     .X(L4),
     .K(K5),
     .Z(f_out_5)   
    );
    
    assign L5 =  L3   ^ f_out_5;
    
    F_function f6(
     .CLK(CLK),
     .RST(RST),
     .X(L5),
     .K(K6),
     .Z(f_out_6)   
    );
    
    assign out_ll = L4 ^ f_out_6;
    assign out_rr = L5;
 
  always @(posedge CLK , negedge RST)
    begin
      if (!RST)
        begin
         OUT_L  <= 0;
         OUT_R  <= 0;
       end
     else
       begin
         OUT_L  <= out_ll;
         OUT_R  <= out_rr; 
       end   
    
    end
    
    
    
endmodule
