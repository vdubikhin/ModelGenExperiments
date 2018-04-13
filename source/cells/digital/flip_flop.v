module flip_flop(in, out, clk);
    input in, clk;
    output reg out = 0;
    
    always @(posedge clk) begin
        out <= in;
    end
    
endmodule
