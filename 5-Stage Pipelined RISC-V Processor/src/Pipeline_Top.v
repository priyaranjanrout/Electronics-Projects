//internal modules
`include "PC.v"
`include "PC_Adder.v"
`include "Mux.v"
`include "Instruction_Memory.v"
`include "Control_Unit_Top.v"
`include "Register_files.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Data_Memory.v"
//modules of the pipeline stages
`include "Fetch_Cycle.v"
`include "Decode_Cycle.v"
`include "Execute_Cycle.v"
`include "Memory_Cycle.v"
`include "Writeback_Cycle.v"  
`include "Hazard_unit.v"//hazard



module Pipeline_Top (
    input clk,rst
);
    //internal wires
    wire PCSrcE,RegWriteW,RegWriteM,MemWriteM,ResultSrcM,ResultSrcW,RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE;
    wire [2:0] ALUControlE;
    wire [4:0] RDW,RDM,RD_E;
    wire [31:0] ResultW,PCPlus4M,WriteDataM,ALUResultM,PCPlus4W,ALUResultW,ReadDataW,InstrD,PCD,PCPlus4D,PCTargetE,RD1_E,RD2_E,Imm_Ext_E,PCE,PCPlus4E;
    wire [4:0] RS1_E, RS2_E;
    wire [1:0] ForwardBE, ForwardAE;

    //module instantiation
    //fetch cycle instantiation
    Fetch_Cycle Fetch(
        .clk(clk),
        .rst(rst),
        .PCSrcE(PCSrcE), 
        .PCTargetE(PCTargetE), 
        .InstrD(InstrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D)
    );
    //decode cycle instantiation
    Decode_Cycle Decode(
        .clk(clk), 
        .rst(rst), 
        .InstrD(InstrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D), 
        .RegWriteW(RegWriteW), 
        .RDW(RDW), 
        .ResultW(ResultW), 
        .RegWriteE(RegWriteE), 
        .ALUSrcE(ALUSrcE), 
        .MemWriteE(MemWriteE), 
        .ResultSrcE(ResultSrcE),
        .BranchE(BranchE),  
        .ALUControlE(ALUControlE), 
        .RD1_E(RD1_E), 
        .RD2_E(RD2_E), 
        .Imm_Ext_E(Imm_Ext_E), 
        .RD_E(RD_E), 
        .PCE(PCE), 
        .PCPlus4E(PCPlus4E),
        .RS1_E(RS1_E),
        .RS2_E(RS2_E)
    );
    //execute cycle instantiation
    Execute_Cycle Execute(
        .clk(clk),
        .rst(rst), 
        .RegWriteE(RegWriteE), 
        .ALUSrcE(ALUSrcE), 
        .MemWriteE(MemWriteE), 
        .ResultSrcE(ResultSrcE), 
        .BranchE(BranchE), 
        .ALUControlE(ALUControlE), 
        .RD1_E(RD1_E), 
        .RD2_E(RD2_E), 
        .Imm_Ext_E(Imm_Ext_E), 
        .RD_E(RD_E), 
        .PCE(PCE), 
        .PCPlus4E(PCPlus4E), 
        .PCSrcE(PCSrcE), 
        .PCTargetE(PCTargetE), 
        .RegWriteM(RegWriteM), 
        .MemWriteM(MemWriteM), 
        .ResultSrcM(ResultSrcM), 
        .RDM(RDM), 
        .PCPlus4M(PCPlus4M), 
        .WriteDataM(WriteDataM), 
        .ALUResultM(ALUResultM),
        .ResultW(ResultW),
        .ForwardA_E(ForwardAE),
        .ForwardB_E(ForwardBE)
    );
    //memory cycle instantiation
    Memory_Cycle Memory(
        .clk(clk), 
        .rst(rst), 
        .RegWriteM(RegWriteM), 
        .MemWriteM(MemWriteM), 
        .ResultSrcM(ResultSrcM), 
        .RDM(RDM), 
        .PCPlus4M(PCPlus4M), 
        .WriteDataM(WriteDataM), 
        .ALUResultM(ALUResultM), 
        .RegWriteW(RegWriteW), 
        .ResultSrcW(ResultSrcW), 
        .RDW(RDW), 
        .PCPlus4W(PCPlus4W), 
        .ALUResultW(ALUResultW), 
        .ReadDataW(ReadDataW)
    );
    //writeback cycle instantiation
    WriteBack_Cycle WriteBack(
        .ResultSrcW(ResultSrcW), 
        .PCPlus4W(PCPlus4W), 
        .ALUResultW(ALUResultW), 
        .ReadDataW(ReadDataW), 
        .ResultW(ResultW)
    );

 // Hazard Unit
    hazard_unit Forwarding_block (
        .rst(rst), 
        .RegWriteM(RegWriteM), 
        .RegWriteW(RegWriteW), 
        .RD_M(RDM), 
        .RD_W(RDW), 
        .Rs1_E(RS1_E), 
        .Rs2_E(RS2_E), 
        .ForwardAE(ForwardAE), 
        .ForwardBE(ForwardBE)
    );

endmodule