
module mux2X1_128bit  (

 input   wire      [127:0]      IN_0,
 input   wire      [127:0]      IN_1,
 input   wire                   SEL,
 output  wire      [127:0]      OUT 

 );

 
assign OUT = SEL ? IN_1 : IN_0 ;
 
 
endmodule
 
