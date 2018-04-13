/*
Complex latch with 2 clock inputs.

Authors: Vladimir Dubikhin.
*/

module c_latch(in_pos, in_neg, clk1, clk2, out);
    input in_pos, in_neg, clk1, clk2;
    output reg out = 0;
    
    always @(posedge clk1)
        out <= in_pos;
    
    always @(negedge clk2)
        out <= in_neg;
    
endmodule
