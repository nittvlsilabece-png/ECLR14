module tb_demux1to4;
    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    demux1to4 uut (.in(in), .sel(sel), .out(out));

    initial begin
        $display("In  Sel | Out");
        $display("---------------");
        in = 1; sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        in = 0; sel = 2'b10; #10; // check with zero input
        $finish;
    end
endmodule
