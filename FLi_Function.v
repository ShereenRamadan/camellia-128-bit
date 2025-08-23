`timescale 1ns / 1ps


module FLi_Function(
     input             clk,RST,
     input      [63:0] Yi ,
     input      [31:0] KI_l , KI_r,
     output reg [63:0] Xi 
    );
    
    wire [31:0] YRi , YLi, XRi, XLi, Z;
    
    assign YLi = Yi [63:32];
    assign YRi = Yi [31:0];
   
    assign XLi = (YRi | KI_r) ^ YLi;
    assign Z   = XLi & KI_l;   
    assign XRi = {Z[30:0] , Z[31]} ^ YRi;
    
    
    always @(posedge clk, negedge RST) begin
      if(!RST)
       Xi <= 64'd0;
       else
       Xi <= {XLi , XRi};
       
    end
 endmodule
