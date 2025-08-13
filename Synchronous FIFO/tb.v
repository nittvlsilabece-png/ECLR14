`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2025 17:00:18
// Design Name: 
// Module Name: tb_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module tb_synchronous_fifo;

  parameter DEPTH = 8;
  parameter DATA_WIDTH = 8;

  reg clk;
  reg rst_n;
  reg w_en;
  reg r_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;

  // Instantiate DUT
  synchronous_fifo #(DEPTH, DATA_WIDTH) dut (
    .clk(clk),
    .rst_n(rst_n),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // Clock generation: 10ns period
  initial clk = 0;
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Initial values
    rst_n   = 0;
    w_en    = 0;
    r_en    = 0;
    data_in = 0;

    // Apply reset
    #15;
    rst_n = 1;
    $display("[%0t] Release reset", $time);

    // Write until full
    repeat (DEPTH) begin
      @(negedge clk);
      if (!full) begin
        w_en    = 1;
        data_in = data_in + 8'h11; // Increment pattern
        $display("[%0t] Write data: 0x%0h", $time, data_in);
      end
    end
    @(negedge clk) w_en = 0;

    // Small gap
    #20;

    // Read until empty
    repeat (DEPTH) begin
      @(negedge clk);
      if (!empty) begin
        r_en = 1;
        $display("[%0t] Read data: 0x%0h", $time, data_out);
      end
    end
    @(negedge clk) r_en = 0;

    // Finish simulation
    #20;
    $display("[%0t] Simulation complete", $time);
    $finish;
  end

endmodule


