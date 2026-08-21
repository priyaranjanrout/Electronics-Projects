// `include "Mux.v"

module WriteBack_Cycle (
    input [31:0] ReadDataW,
    input [31:0] ALUResultW,
    input [31:0] PCPlus4W,
    input clk, rst, ResultSrcW,

    output [31:0] ResultW
);

    // Declaration of Mux
    Mux Result_Mux(
        .a(ALUResultW),
        .b(ReadDataW),
        .s(ResultSrcW),
        .c(ResultW)
    );
    
endmodule