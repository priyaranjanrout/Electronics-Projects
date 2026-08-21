module Register_File (
    input WE3,clk,rst,    //active low reset
    input [4:0] A1,A2,A3,
    input [31:0] WD3,
    output [31:0] RD1,RD2
);
    //memory creation
    reg [31:0] Registers [31:0];//32 registers of 32 bits each

    //read functionality
    assign RD1 = (~rst) ? 32'h00000000 : Registers[A1] ; //if rst is 0, output 0, else read the data from register
    assign RD2 = (~rst) ? 32'h00000000 : Registers[A2] ;

    //write functionality
    always @(posedge clk) begin
        if (WE3) begin
            Registers[A3] <= WD3;//if WE3 is 1, write the data to register
        end
    end

    // adding data to register 9 for testing purpose, this will be used as rs1 in the first instruction
    initial begin
        Registers[1] = 32'h00000069; 
        Registers[2] = 32'h00000004; 
        Registers[3] = 32'h00000009; 
        Registers[4] = 32'h00000016; 
        Registers[5] = 32'h00000025; 
        Registers[6] = 32'h00000018; 
        Registers[7] = 32'h00000049; 
        Registers[0] = 32'h00000000; 
    end
endmodule