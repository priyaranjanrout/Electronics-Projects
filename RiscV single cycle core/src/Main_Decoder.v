module Main_Decoder (
    input [6:0] Op,
    output RegWrite,MemWrite,ALUSrc,ResultSrc,Branch,
    output [1:0] ALUOp,ImmSrc
    
);

    

    assign RegWrite = ((Op == 7'b0110011) | (Op == 7'b0000011)) ? 1'b1 :
                                                                 1'b0; //high for R-type or Load
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 
                                            1'b0; //high for Store
    assign ALUSrc = ((Op == 7'b0000011) | (Op == 7'b0100011)) ? 1'b1 :
                                                                 1'b0; //high for Load or Store
    assign ResultSrc = (Op == 7'b0000011) ? 1'b1 :
                                             1'b0; //high for Load
    assign Branch = (Op == 7'b1100011) ? 1'b1 :
                                         1'b0; //high for Branch

    assign ALUOp = (Op == 7'b0110011) ? 2'b10 : 
                    (Op == 7'b0110011) ? 2'b01 : 
                    2'b0; //10 for R-type, 01 for Branch, 00 default
    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 : 
                    (Op == 7'b1100011) ? 2'b10 : 
                    2'b00; //01 for Store, 10 for Branch, 00 default
    
    

endmodule