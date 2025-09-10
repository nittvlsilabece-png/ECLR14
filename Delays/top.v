module bufd(
    input a,
    output reg c1, c2, c3, c4
    );
    always@(*)
    begin
    #3 c1 =  a;
         end
       always@(*)
    begin
       c2 = #3 a;
         end
       always@(*)
    begin
        #3 c3 <=  a;
           end
       always@(*)
    begin
         c4 <= #3 a;
       end
endmodule
