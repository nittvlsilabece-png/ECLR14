module tb_alu_4bit;
    reg [3:0] A, B;
    reg [2:0] sel;
    wire [3:0] result;
    wire carry;

    alu_4bit uut (.A(A), .B(B), .sel(sel), .result(result), .carry(carry));

    initial begin
        $display("A    B    Sel | Result Carry");
        $display("-----------------------------");

        A = 4'b0101; B = 4'b0011; // 5 and 3

        sel = 3'b000; #10; // Addition
        sel = 3'b001; #10; // Subtraction
        sel = 3'b010; #10; // AND
        sel = 3'b011; #10; // OR
        sel = 3'b100; #10; // XOR
        sel = 3'b101; #10; // NOT A
        sel = 3'b110; #10; // Increment A
        sel = 3'b111; #10; // Decrement A

        $finish;
    end
endmodule
