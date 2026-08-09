module PC_Module (
    input [31:0] PC_NEXT,
    input clk,rst,   //active low reset signal to reset the PC 0 reset, 1 normal operation
    output reg [31:0] PC    
);
    always @(posedge clk) begin //on the rising edge of the clock
        if (rst == 1'b0) begin
            PC <= 32'h00000000; //reset PC to 0
        end 
        else begin
            PC <= PC_NEXT; //update PC with the next address
        end
    end
endmodule