//include files
`include "PC.v"
`include "Instruction_Memory.v"
`include "Register_files.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"

module Single_Cycle_Top (
    
    input clk,rst
);

    //wires for interconnection
    wire [31:0] PC_Top;
    wire [31:0] RD_Instr_Top;
    wire [31:0] Imm_Ext_Top;
    wire [31:0] RD1_Top,RD2_Top;
    wire [2:0] ALUControl_Top;
    wire [31:0] ALU_Result_Top;
    wire [31:0] Read_Data_Top;
    wire [31:0] PC_Plus4_Top;
    wire Reg_Write_Top;
    wire Memory_Write_Top;
    wire [1:0] ImmSrc_Top;
    wire ALUSrc_Top;
    wire [31:0] Mux_ALU_B_Top;
    wire ResultSrc_Top;
    wire [31:0] Mux_Data_Memory_to_Register_Top;

    //instace of PC module
    PC_Module PC (
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_NEXT(PC_Plus4_Top)
    );

    //instace of PC Adder module
    PC_Adder PC_Adder (
        .a(PC_Top),
        .b(32'd4),
        .c(PC_Plus4_Top)
    );

    //instace of Instruction Memory module
    Instruction_Memory Instruction_Memory ( 
        .rst(rst),
        .A(PC_Top),
        .RD(RD_Instr_Top)
    );

    //instace of Register File module
    Register_File Register_File (
        .clk(clk),
        .rst(rst),
        .A1(RD_Instr_Top[19:15]), //rs1 address
        .A2(RD_Instr_Top[24:20]), //rs2 address
        .A3(RD_Instr_Top[11:7]), //rd address
        .RD1(RD1_Top),
        .RD2(RD2_Top),
        .WD3(Mux_Data_Memory_to_Register_Top),
        .WE3(Reg_Write_Top)
    );

    //instace of Sign Extend module
    Sign_Extend Sign_Extend (
        .In(RD_Instr_Top), 
        .ImmSrc(ImmSrc_Top[0]),
        .Imm_Ext(Imm_Ext_Top)
    );

    //instace of ALU module
    ALU ALU (
        .A(RD1_Top),
        .B(Mux_ALU_B_Top),
        .ALUControl(ALUControl_Top),
        .Result(ALU_Result_Top),
        .Zero(),
        .Negative(),
        .Overflow(),
        .Carry()
    );

    //instace of Control Unit Top module
    Control_Unit_Top Control_Unit_Top (
        .Op(RD_Instr_Top[6:0]),
        .funct3(RD_Instr_Top[14:12]),
        .funct7(RD_Instr_Top[31:25]),
        .RegWrite(Reg_Write_Top),
        .ALUSrc(ALUSrc_Top),
        .MemWrite(Memory_Write_Top),
        .ResultSrc(ResultSrc_Top),
        .Branch(),
        .ImmSrc(ImmSrc_Top),
        .ALUControl(ALUControl_Top)
    );

    //instace of Data Memory module`    
    Data_Memory Data_Memory (
        .clk(clk),
        .rst(rst),
        .A(ALU_Result_Top),
        .WD(RD2_Top),
        .WE(Memory_Write_Top),
        .RD(Read_Data_Top)
    );

    //instace of Mux Register to Alu module
    Mux Mux_Register_to_Alu (
        .a(RD2_Top),
        .b(Imm_Ext_Top),
        .s(ALUSrc_Top),
        .c(Mux_ALU_B_Top)
    );

    //instace of Mux Data memory to Register module
    Mux Mux_Data_Memory_to_Register (
        .a(ALU_Result_Top),
        .b(Read_Data_Top),
        .s(ResultSrc_Top),
        .c(Mux_Data_Memory_to_Register_Top)
    );

endmodule