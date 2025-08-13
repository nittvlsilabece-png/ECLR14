module tb;
  reg clk, rst_n;
  reg j, k;
  wire [3:0] q, q_bar;
  asynchronous_counter dut(clk, rst_n, j, k, q, q_bar);
  
  initial begin
    clk = 0; rst_n = 0; 
    #4; rst_n = 1;
    j = 1; k = 1;
    #80;
    rst_n = 0;
    #4; rst_n = 1;
    #50;
    $finish;
  end
  always #2 clk = ~clk;

endmodule
