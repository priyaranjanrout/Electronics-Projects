// `include "Data_Memory.v"

module Memory_Cycle (
    input clk,rst,
    input RegWriteM,
    input MemWriteM,
    input ResultSrcM,
    input [31:0] ALUResultM,
    input [31:0] WriteDataM,
    input [31:0] PCPlus4M,
    input [4:0] RDM,

    output [31:0] ReadDataW,
    output [31:0] ALUResultW,
    output [31:0] PCPlus4W,
    output [4:0] RDW,
    output RegWriteW,
    output ResultSrcW
);
    
    //internal wires
    wire [31:0] ReadDataM;

    // Declaration of Memory Cycle Register
    reg RegWriteM_r,ResultSrcM_r;
    reg [31:0]ALUResultM_r,ReadDataM_r,PCPlus4M_r;
    reg [4:0] RDM_r;

    // instantiation of data memory
    Data_Memory data_memory(
        .clk(clk),
        .rst(rst),
        .WE(MemWriteM),
        .WD(WriteDataM),
        .A(ALUResultM),
        .RD(ReadDataM)
    );

    //memory cycle register logic
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            RegWriteM_r <= 1'b0;
            ResultSrcM_r <= 1'b0;
            ALUResultM_r <= 32'h00000000;
            ReadDataM_r <= 32'h00000000;
            PCPlus4M_r <= 32'h00000000;
            RDM_r <= 5'b00000;
        end 
        else begin
            RegWriteM_r <= RegWriteM;
            ResultSrcM_r <= ResultSrcM;
            ALUResultM_r <= ALUResultM;
            ReadDataM_r <= ReadDataM;
            PCPlus4M_r <= PCPlus4M;
            RDM_r <= RDM;
        end
    end

    //assign outputs
    assign ReadDataW = ReadDataM_r;
    assign ALUResultW = ALUResultM_r;
    assign PCPlus4W = PCPlus4M_r;
    assign RDW = RDM_r;
    assign RegWriteW = RegWriteM_r;
    assign ResultSrcW = ResultSrcM_r;

endmodule