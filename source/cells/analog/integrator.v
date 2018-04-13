/*
Integrator filter.

Authors: Vladimir Dubikhin.
*/

module integrator(in, sample, out);
    parameter DELAY = 5;
    parameter SAMPLES = 10;

    input in, sample;
    output reg out = 0;
    
    reg first_sample;
    integer counter;

    always @(sample) begin
        counter = 0;
        first_sample = in;

        while (in==first_sample && counter < SAMPLES) begin
            #(DELAY) counter = counter + 1;
        end
        
        if (counter == SAMPLES && in==first_sample)
            out = first_sample;
    end
    
endmodule
