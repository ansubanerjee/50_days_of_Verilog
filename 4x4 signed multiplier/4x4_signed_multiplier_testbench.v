module multiplier_4x4_tb;

  reg [3:0] a, b;
  wire [7:0] p;

  multiplier_4x4 uut (
    .p(p),
    .a(a),
    .b(b)
  );

  initial begin
    $display("Time\t a\t b\t | Product");
    $display("----------------------------------");

    
    a = 4'd3; b = 4'd2; #10;
    $display("%4t\t %d\t %d\t | %d", $time, a, b, p);

    a = 4'd4; b = 4'd7; #10;
    $display("%4t\t %d\t %d\t | %d", $time, a, b, p);

    a = 4'd15; b = 4'd15; #10;
    $display("%4t\t %d\t %d\t | %d", $time, a, b, p);

    a = 4'd0; b = 4'd9; #10;
    $display("%4t\t %d\t %d\t | %d", $time, a, b, p);

    a = 4'd8; b = 4'd1; #10;
    $display("%4t\t %d\t %d\t | %d", $time, a, b, p);

    $finish;
  end

endmodule
