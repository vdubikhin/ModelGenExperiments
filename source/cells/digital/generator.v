module gen(out);
    parameter D = 1;
    output reg out = 0;
    
    always begin
        #(D) out = ~out;
    end
    
endmodule
