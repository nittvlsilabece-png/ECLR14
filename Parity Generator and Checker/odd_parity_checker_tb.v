module tb_odd_parity_check;
    reg [3:0] data;
    reg parity;
    wire error;

    odd_parity_check uut (.data(data), .parity(parity), .error(error));

    initial begin
        $display("Data   Parity | Error");
        $display("----------------------");
        data = 4'b1010; parity = ~(^data);  #10; // correct
        data = 4'b1010; parity = ^data; #10; // wrong
        $finish;
    end
endmodule
