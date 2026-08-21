// `include "Pipeline_Top.v"
module tb ();

    reg clk=1'b0,rst;

    always begin
        clk = ~clk;
        #50;    
    end

    initial begin
        rst <= 1'b0;
        #170;
        rst <=1'b1;
        #1000;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

    //Design under test 
    Pipeline_Top dut (
        .clk(clk),
        .rst(rst)
    );
    
endmodule