/*
LC network of buck converter, consisting of inductors by number of phases and output capacitor.

Authors: Vladimir Dubikhin.
*/

`include "buck_converter_async_params.vh"

/*
Inputs:
power_in - input for all inductors.
Ouputs:
power_out - network output.
*/
module lc_network(power_in, power_out);
    parameter OUT_CAP =  `LC_OUT_CAP;
    parameter COIL_IND = `LC_COIL_IND;
    
    inout power_in;
    inout power_out;

    res #(.r(0.001)) lc_res(power_in, power_in_i);
    ind #(.l(COIL_IND)) lc_inductor(power_in_i, power_out);
    cap #(.c(OUT_CAP)) cap_out(power_out, gnd);
    gnd gnd_lc(gnd);
    
endmodule
