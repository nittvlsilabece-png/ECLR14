module tb_bufd;

    reg a;        // input to DUT
    wire c1, c2, c3, c4;       // output from DUT

    // Instantiate the Design Under Test (DUT)
    bufd dut (
        .a(a),
        .c1(c1),  .c2(c2),  .c3(c3),  .c4(c4)
    );

    initial begin
        // Monitor values
 

        // Test sequence
         a = 1;   #5; 
        a = 0;   #2;   // Apply 0
        a = 1;   #1;   // Apply 1
        a = 0;   #5;   // Back to 0
        a = 1;   #5;   // Again 1
        a = 0;   #5;   // Back to 0
        a = 1;   #5;   // Again 1
        // Finish simulation
        $finish;
    end

endmodule
