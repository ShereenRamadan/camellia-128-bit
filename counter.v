module counter(
    input clk,
    input rst,
    input data_valid,
    output reg out_rdy
);


reg [4:0] counter; 

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            counter <= 5'd0;
            out_rdy <= 1'b0;
        end else if (data_valid) begin
            counter <= 5'd27; 
            out_rdy <= 1'b0;
        end else if (counter > 0) begin
            counter <= counter - 1;
            if (counter == 1) begin
                out_rdy <= 1'b1; 
            end
        end else begin
            out_rdy <= 1'b0;
        end
    end
    
endmodule