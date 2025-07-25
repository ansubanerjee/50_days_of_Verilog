module tb_stack;
    reg clk = 0;
    reg reset = 1;
    reg push, pop;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    stack uut (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    always #5 clk = ~clk; 

    initial begin
        #10 reset = 0;
        push = 0; pop = 0; data_in = 0;

        #10 push = 1; data_in = 8'hAA;
        #10 data_in = 8'hBB;
        #10 data_in = 8'hCC;
        #10 push = 0;

        #10 pop = 1;
        #10;
        #10;
        #10 pop = 0;

        #20 $finish;
    end
endmodule
