
module mux2X1_1bit  (

 input   wire                  IN0,
 input   wire                  IN1,
 input   wire                  SEL,
 output  wire                  OUT 

 );

 
assign OUT = SEL ? IN1 : IN0 ;
 
 
endmodule
 
