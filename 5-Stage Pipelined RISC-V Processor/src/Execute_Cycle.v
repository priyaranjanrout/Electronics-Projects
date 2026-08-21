// `include "ALU.v"
// `include "Mux.v"
// `include "PC_Adder.v" //simple adder

module Execute_Cycle (
    input clk,rst,RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE,
    input [2:0] ALUControlE,
    input [31:0] RD1_E, RD2_E, Imm_Ext_E,
    input [4:0] RD_E,
    input [31:0] PCE, PCPlus4E,
    input [31:0] ResultW,//
    input [1:0] ForwardA_E, ForwardB_E,//hazard
    
    output PCSrcE,
    output RegWriteM,
    output MemWriteM,
    output ResultSrcM,
    output [31:0] PCTargetE,
    output [31:0] ALUResultM,
    output [31:0] WriteDataM,
    output [31:0] PCPlus4M,
    output [4:0] RDM

);

    //internal wires
    // wire [31:0] SrcE;
    wire [31:0] Src_A, Src_B_interim, Src_B;//hazard
    wire [31:0] ResultE;
    wire ZeroE;
    
    // Declaration of Execute Cycle Register
    reg RegWriteE_r,MemWriteE_r,ResultSrcE_r;
    // reg [31:0]ALUResultE_r,WriteDataE_r,PCPlus4E_r;
    reg [31:0] PCPlus4E_r, RD2_E_r, ResultE_r;//hazard
    reg [4:0] RDE_r;

    // instantiation of modules

    // 3 by 1 Mux for Source A
    Mux_3_by_1 srca_mux (//hazard
        .a(RD1_E),
        .b(ResultW),
        .c(ALUResultM),
        .s(ForwardA_E),
        .d(Src_A)
    );

    // 3 by 1 Mux for Source B
    Mux_3_by_1 srcb_mux (//hazard
        .a(RD2_E),
        .b(ResultW),
        .c(ALUResultM),
        .s(ForwardB_E),
        .d(Src_B_interim)
    );

    //declaration of Mux for ALU input B
    Mux alu_src_mux(
        // .a(RD2_E),
        // .b(Imm_Ext_E),
        // .s(ALUSrcE),
        // .c(SrcE)
        .a(Src_B_interim),
        .b(Imm_Ext_E),
        .s(ALUSrcE),
        .c(Src_B)
    );
    //declaration of ALU
    ALU alu(
        // .A(RD1_E),
        // .B(SrcE),
        .A(Src_A),
        .B(Src_B),
        .Result(ResultE),
        .ALUControl(ALUControlE),
        .Overflow(),
        .Carry(),
        .Zero(ZeroE),
        .Negative()
    );
    //declaration of Adder
    PC_Adder branch_adder(
        .a(PCE),
        .b(Imm_Ext_E),
        .c(PCTargetE)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    );

    //execute cycle register logic
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            RegWriteE_r <= 1'b0;
            MemWriteE_r <= 1'b0;
            ResultSrcE_r <= 1'b0;
            RDE_r <= 5'b00000;
            PCPlus4E_r <= 32'h00000000;
            RD2_E_r  <= 32'h00000000;
            ResultE_r <= 32'h00000000;
        end 
        else begin
            RegWriteE_r <= RegWriteE;
            MemWriteE_r <= MemWriteE;
            ResultSrcE_r <= ResultSrcE;
            RDE_r <= RD_E;
            PCPlus4E_r <= PCPlus4E;
            RD2_E_r <= Src_B_interim;
            ResultE_r <= ResultE;
        end
    end

    //assign outputs
    assign PCSrcE = BranchE & ZeroE; //PCSrcE is set if BranchE is 1 and ZeroE is 1
    assign RegWriteM = RegWriteE_r;
    assign MemWriteM = MemWriteE_r; 
    assign ResultSrcM = ResultSrcE_r;
    assign RDM = RDE_r;
    assign PCPlus4M = PCPlus4E_r;
    assign WriteDataM = RD2_E_r;
    assign ALUResultM = ResultE_r;

endmodule
