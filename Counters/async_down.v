module JK_flipflop (
  input clk, rst_n,
  input j,k,
  output reg q, 
  output q_bar
  );
  
  always@(posedge clk or negedge rst_n) begin // for asynchronous reset
    if(!rst_n) q <= 0;
    else begin
      case({j,k})
        2'b00: q <= q;    // No change
        2'b01: q <= 1'b0; // reset
        2'b10: q <= 1'b1; // set
        2'b11: q <= ~q;   // Toggle
      endcase
    end
  end
  assign q_bar = ~q;
endmodule


module asynchronous_counter #(parameter SIZE=4)(
  input clk, rst_n,
  input j, k,
  output [3:0] q, q_bar
);
  // Down Counter (at output q)
  JK_flipflop jk1(clk, rst_n, j, k, q[0], q_bar[0]);
  JK_flipflop jk2(q[0], rst_n, j, k, q[1], q_bar[1]);
  JK_flipflop jk3(q[1], rst_n, j, k, q[2], q_bar[2]);
  JK_flipflop jk4(q[2], rst_n, j, k, q[3], q_bar[3]);
  
endmodule
