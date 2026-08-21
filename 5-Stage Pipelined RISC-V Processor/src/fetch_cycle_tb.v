module tb ();

    //Declaration of inputs and outputs
    reg clk=1'b0,rst,PCSrcE;
    reg [31:0] PCTargetE;
    wire [31:0] InstrD,PCD,PCPlus4D;

    //generate clock signal
    always 
    begin
        clk = ~clk;
        #50;    
    end

    //Provide stimulus to the inputs
    initial begin
        rst <= 1'b0;
        #200;
        rst <=1'b1;
        PCSrcE <= 1'b0;
        PCTargetE <= 32'h00000000;
        #500;
        $finish;
    end

    //generation of vcd file for waveform viewing
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
        
    end

    //Design under test 
    Fetch_Cycle dut (
        .clk(clk),
        .rst(rst),
        .PCSrcE(PCSrcE),
        .PCTargetE(PCTargetE),
        .InstrD(InstrD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D)
    );

endmodule