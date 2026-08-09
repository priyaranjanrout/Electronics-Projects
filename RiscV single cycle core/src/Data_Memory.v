module Data_Memory (
    input [31:0] A,
    input [31:0] WD,
    input WE,clk,rst,
    output [31:0] RD
);
    
    //memory creation
    reg [31:0] Data_MEM [31:0]; //32 registers of 32 bits each
    
    //read functionality
    assign RD = (~WE == 1'b1) ? Data_MEM[A] : 32'h00000000; //if WE is 0, read the data from memory, else output 0

    //write functionality
    always @(posedge clk) begin
        if (WE) begin
            Data_MEM[A] <= WD;  //if WE is 1, write the data to memory
        end
    end

    //initializing memory location 28 to 32'h00000020 for testing purpose, this will be used as rs2 in the first instruction
    initial begin
        Data_MEM[28] = 32'h00000004; //initialize memory location 28 to 32'h00000020 for testing purpose, this will be used as rs2 in the first instruction
        Data_MEM[12] = 32'h123EE324; //initialize memory location 48 to 32'h123EE0324 for testing purpose, this will be used as rs2 in the first instruction
    end

endmodule