// Instruction Memory Module takes address as input and 
//outputs the instruction stored at that address.
module Instruction_Memory (
    input [31:0] A,
    input rst,//active low reset signal to reset the memory 0 reset, 1 normal operation
    output [31:0] RD
);

    //memory creation
    reg [31:0] Mem [1023:0]; // 1024 locations of 32 bits each

    assign RD = (rst == 1'b0) ? 32'h00000000 : Mem[A[31:2]]; //if rst is low, output 0, else output the instruction at address A[31:2]


//initializing memory with some instructions for testing purpose
/*    initial begin
        //Mem[0] = 32'hFFC4A303; //instruction 1
       // Mem[1] = 32'h00832383; //instruction 2
        //Mem[0] = 32'h0064A423; //instruction 1 sw
        //Mem[1] = 32'h00B62423; //instruction 2 sw
          Mem[0] = 32'h0062E233; //instruction 1 R type
    end
*/

//giving instructions through hex file for testing purpose
    initial begin
        $readmemh("instructions.hex",Mem);
    end

endmodule