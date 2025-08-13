// Signed Pipelined Multiplier (4x4 bits)
module csmsignedpipe(a, b, clk1, clk2, y);
input signed [3:0] a, b;
input clk1, clk2;
output signed [7:0] y;

// Internal pipeline registers
reg l12y1, l12c1, l12s2, l12c2, l12s3, l12c3, l12s4, l12c4;
reg l23y2, l23c5, l23s5, l23c6, l23s6, l23c7, l23s7, l23c8;
reg l34y3, l34c9, l34s8, l34c10, l34s9, l34c11, l34s10, l34c12;

reg l12p00, l23p00, l34p00;
reg l12p02, l12p12, l12p22, l12p32;
reg l12p03, l12p13, l12p23, l12p33;
reg l23p03, l23p13, l23p23, l23p33;
reg l23y1, l34y1;
reg l34y2;

// Partial Product Generation
wire p00, p01, p02, p03;
wire p10, p11, p12, p13;
wire p20, p21, p22, p23;
wire p30, p31, p32, p33;

assign {p30, p20, p10, p00} = a & {4{b[0]}};
assign {p31, p21, p11, p01} = a & {4{b[1]}};
assign {p32, p22, p12, p02} = a & {4{b[2]}};
assign {p33, p23, p13, p03} = a & {4{b[3]}};

// First stage adders
wire y1, c1, s2, c2, s3, c3, s4, c4;
ha m1(p01, p10, y1, c1);
ha m2(p20, p11, s2, c2);
ha m3(~p30, p21, s3, c3);
ha m4(~p31, 1'b1, s4, c4);  // Two's complement sign bit handling

// Pipeline Stage 1 (posedge clk1)
always @(posedge clk1) begin
    l12p00 <= p00;
    l12y1  <= y1;
    l12c1  <= c1;
    l12s2  <= s2;
    l12c2  <= c2;
    l12s3  <= s3;
    l12c3  <= c3;
    l12s4  <= s4;
    l12c4  <= c4;

    l12p02 <= p02;
    l12p12 <= p12;
    l12p22 <= p22;
    l12p32 <= p32;

    l12p03 <= p03;
    l12p13 <= p13;
    l12p23 <= p23;
    l12p33 <= p33;
end

// Second stage adders
wire y2, c5, s5, c6, s6, c7, s7, c8;
fa m5(l12p02, l12c1, l12s2, y2, c5);
fa m6(l12p12, l12c2, l12s3, s5, c6);
fa m7(l12p22, l12c3, l12s4, s6, c7);
ha m8(~l12p32, l12c4, s7, c8);  // Sign bit for final row

// Pipeline Stage 2 (posedge clk2)
always @(posedge clk2) begin
    l23y1  <= l12y1;
    l23p00 <= p00;

    l23y2  <= y2;
    l23c5  <= c5;
    l23s5  <= s5;
    l23c6  <= c6;
    l23s6  <= s6;
    l23c7  <= c7;
    l23s7  <= s7;
    l23c8  <= c8;

    l23p03 <= l12p03;
    l23p13 <= l12p13;
    l23p23 <= l12p23;
    l23p33 <= l12p33;
end

// Third stage adders
wire y3, c9, s8, c10, s9, c11, s10, c12;
fa m9(~l23p03, l23c5, l23s5, y3, c9);
fa m10(~l23p13, l23c6, l23s6, s8, c10);
fa m11(~l23p23, l23c7, l23s7, s9, c11);
ha m12(l23p33, l23c8, s10, c12);

// Pipeline Stage 3 (posedge clk1)
always @(posedge clk1) begin
    l34y1  <= l23y1;
    l34y2  <= l23y2;
    l34y3  <= y3;

    l34c9  <= c9;
    l34s8  <= s8;
    l34c10 <= c10;
    l34s9  <= s9;
    l34c11 <= c11;
    l34s10 <= s10;
    l34c12 <= c12;

    l34p00 <= l23p00;
end

// Final stage adders and output assignment
wire c13, c14, c15, c16;
assign y[0] = l34p00;
assign y[1] = l34y1;
assign y[2] = l34y2;
assign y[3] = l34y3;

ha m13(l34c9,  l34s8,  y[4], c13);
fa m14(l34c10, l34s9,  c13,  y[5], c14);
fa m15(l34c11, l34s10, c14,  y[6], c15);
fa m16(l34c12, c15,    1'b1, y[7], c16);

endmodule

// Half Adder
module ha(input a, b, output s, c);
assign s = a ^ b;
assign c = a & b;
endmodule

// Full Adder
module fa(input a, b, cin, output sum, cout);
assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
