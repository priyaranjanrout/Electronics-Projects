module Single_Cycle_Top_Tb ();

    reg clk=1'b1,rst;
    //instace of Single Cycle Top module
    Single_Cycle_Top Single_Cycle_Top (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $dumpfile("Single_Cycle.vcd");
        $dumpvars(0);
        
    end

    always 
    begin
        clk = ~clk;
        #50;    
    end

    initial begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #200;
        $finish;
    end

endmodule