module stack(
    input clk,
    input rst,
    input push,
    input pop,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg full,
    output reg empty
);

    reg [7:0] stack_mem [0:7];              
    reg [2:0] sp;                           

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sp <= 0;
            full <= 0;
            empty <= 1;
            data_out <= 0;
        end else begin

            if (push && !full) begin
                stack_mem[sp] <= data_in;
                sp <= sp + 1;
            end 

            else if (pop && !empty) begin
                sp <= sp - 1;
                data_out <= stack_mem[sp - 1];
            end

            // Update status flags
            full <= (sp == 8);        
            empty <= (sp == 0);        
        end
    end

endmodule
