module Data_Memory (
    input [31:0] A,
    input [31:0] WD,
    input WE,clk,rst,
    output [31:0] RD
);
    
    //memory creation
    reg [31:0] mem [31:0]; //32 registers of 32 bits each
    
    always @ (posedge clk)
    begin
        if(WE)
            mem[A] <= WD;
    end

    assign RD = (~rst) ? 32'd0 : mem[A];

    initial begin
        mem[0] = 32'h00000000;
        mem[27] = 32'h00000143;
    end

endmodule