`timescale 1ns / 1ps


module FL_Function(
     input             clk,RST,
     input      [63:0] X,
     input      [31:0] KI_l , KI_r,
     output reg [63:0] Y 
    );
    
    wire [31:0] XR , XL, YR, YL, Z;
    
    assign XL = X[63:32];
    assign XR = X[31:0];
   
    assign Z  = XL & KI_l;
    assign YR = {Z[30:0] , Z[31]} ^ XR;
    assign YL = (YR | KI_r) ^ XL;
    
    always @(posedge clk, negedge RST) begin
      if(!RST)
       Y <= 64'd0;
       else
       Y <= {YL , YR};
       
    end
    
    
endmodule
