module ALU (
    input [31:0] A,B,
    input [2:0] ALUControl,
    output [31:0] Result,
    output Zero,Negative,Overflow,Carry   //Zero, Negative, Overflow, Carry flags 1bit each

);
    
    //internal wire declaration 
    wire [31:0] a_and_b;
    wire [31:0] a_or_b;
    wire [31:0] not_b;
    wire [31:0] mux_1;
    wire [31:0] sum;
    wire [31:0] mux_2;
    wire cout;
    wire [31:0] slt; //zero extension of 1 bit result of slt operation

    //logic design

    //AND OR operation 
    assign a_and_b = A & B;
    assign a_or_b = A | B;

    //NOT operation
    assign not_b = ~B;
    //mux_1 operation
    //ternary operator to select between B and not_b based on ALUControl[0]
    assign mux_1 = (ALUControl[0] == 1'b0) ? B : not_b; 
    //Addition/subtraction operation
    //if ALUControl[0] is 1, then it will add 1 to the sum, effectively performing subtraction ,2's complement of B is added to A
    assign {cout, sum} = A + mux_1 + ALUControl[0]; //cout will get the MSB / 33th bit

    //Zero Extension of 1 bit result of slt operation
    assign slt = {31'b0000000000000000000000000000000, sum[31]}; //if sum[31] is 1, then slt will be 1, else 0

    //****now 3bits of AlUControl are used to select the operation to be performed****
    //mux_2 operation using ALUControl[2:0] , using 3 bits of ALUControl
    assign mux_2 =  (ALUControl[2:0] == 3'b000) ? sum : //if 000 sum
                    (ALUControl[2:0] == 3'b001) ? sum : //else if 001 sum
                    (ALUControl[2:0] == 3'b010) ? a_and_b : //else if 010 a_and_b
                    (ALUControl[2:0] == 3'b011) ? a_or_b : //else if 011 a_or_b
                    (ALUControl[2:0] == 3'b111) ? slt :  // else if 111 slt
                    32'h00000000; //else 0
    assign Result = mux_2; //result assignment

    //flag assignment
    assign Zero = &(~Result); //Zero flag is set if all bits of Result are 0
    assign Negative = Result[31]; //Negative flag is set if the MSB of Result is 1 
    assign Carry = cout & (~ALUControl[1]); //Carry flag is set if Cout is 1 and ALUControl[1] is 0 (for addition)
    assign Overflow =(~ALUControl[1]) &     //Overflow flag is set if there is a signed overflow in addition or subtraction
            (A[31] ^ sum[31]) &      //XOR of A[31] and sum[31] to determine if there is a signed overflow
            ~(A[31] ^ B[31] ^ ALUControl[0]);      //XNOR of A[31] and B[31] and ALUControl[0] to determine if there is a signed overflow
endmodule