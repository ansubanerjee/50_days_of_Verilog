module traffic_light_controller(
    input clk, 
    input rst, 
    output reg red,
    output reg yellow,
    output reg green
    )

    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;

    reg [1:0] = state;
    reg[3:0] = timer;

    always @(posedge clk or posedge rst) begin
        if (reset) begin
        state <= RED;
        timer <= 4'd5;
    end 
        else begin
            if (timer = 0) begin
                case (state)
                    RED: begin
                        state <= GREEN;
                        timer <= 4'd5;
                    end
                    GREEN: begin
                        state <= YELLOW;
                        timer <= 4'd3;
                    end
                    YELLOW: begin
                        state <= RED;
                        timer <= 4'd5;
                    end
                endcase
            end 
            else begin
                timer <= timer-1;
            end
        end
    end

    //LIGHTS LOGIC
    always @(*) begin
        red = 0;
        yellow = 0;
        green = 0;
        case(state)
            RED: red = 1;
            GREEN: green = 1;
            YELLOW: yellow = 1;
        endcase
    end
endmodule



    