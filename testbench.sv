module tb;
  reg clk = 0, rst_n = 0, din = 0;
  wire detected;
  reg [3:0] hist = 0;
  reg [15:0] stream = 16'b1011011001011101;
  integer i, errors = 0;

  seq_1011 dut (.clk(clk), .rst_n(rst_n),
                .din(din), .detected(detected));
  always #5 clk = ~clk;

  always @(posedge clk)
    if (!rst_n) hist <= 0;
    else        hist <= {hist[2:0], din};

  always @(negedge clk)
    if (rst_n && (detected !== (hist == 4'b1011)))
      errors = errors + 1;

  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    #12 rst_n = 1;
    for (i = 15; i >= 0; i = i - 1)
      @(negedge clk) din = stream[i];
    @(negedge clk) din=0;
    repeat(2) @(negedge clk);
    if (errors == 0) $display("PASS");
    else $display("FAIL: %0d errors", errors);
    $finish;
  end
endmodule
