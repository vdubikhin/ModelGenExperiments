/*
Load module with under voltage and high load sensors.

Authors: Vladimir Dubikhin.
*/

`include "buck_converter_async_params.vh"

/*
Inputs:
power_in - power supply
Outputs:
uv - under voltage signal
hl - high load signal
*/
module load(power_in, uv, nrst);
    parameter HL_CMP_HYST = 0.01;
    parameter HL_CMP_DELAY = 0;
    parameter UV_CMP_HYST = 0.01;
    parameter UV_CMP_DELAY = 0;
    parameter HL_THR = 3;
    parameter UV_THR = 5;
    inout power_in;
    input nrst;
    output uv;

    //Load
    var_res #(.R(`LOAD_RESISTANCE), .TIME_DELAY(`LOAD_TIME_DELAY), .MULT_MAX(`LOAD_MULT_MAX)) 
        res_load (power_in, gnd);
    
    //UV
    v_source #(.voltage_out(UV_THR)) uv_volt(.v_out(uv_ref), .g(gnd)); 
    comparator #(.hyst(UV_CMP_HYST), .D(UV_CMP_DELAY)) uv_cmp(.out(uv), .p(uv_ref), .n(power_in), .nrst(nrst));   
    
    gnd load_gnd(gnd);
    
endmodule
