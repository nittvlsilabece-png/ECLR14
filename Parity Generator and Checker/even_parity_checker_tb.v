`timescale 1ns/1ps

module tb_even_parity_check;
    reg [3:0] data;
    reg parity;
    wire error;

    even_parity_check uut (.data(data), .parity(parity), .error(error));

    initial begin
        $display("Data   Parity | Error");
        $display("----------------------");
        data = 4'b1010; parity = ^data;  #5; // correct
        data = 4'b1010; parity = ~(^data); #5; // wrong
        #10;
        $finish;
    end
endmodule
