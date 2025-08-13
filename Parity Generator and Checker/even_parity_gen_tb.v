module tb_even_parity_gen;
    reg [3:0] data;
    wire parity;

    even_parity_gen uut (.data(data), .parity(parity));

    initial begin
        $display("Data   | Parity");
        $display("----------------");
        data = 4'b0000; #10;
        data = 4'b0001; #10;
        data = 4'b1010; #10;
        data = 4'b1111; #10;
        $finish;
    end
endmodule
