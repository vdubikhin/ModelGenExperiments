/*
Transistor switches of buck converter.

Authors: Vladimir Dubikhin.
*/


/*
Inputs:
gp - P-type mosfet control.
gn - N-type mosfte control.
Ouputs:
gp_ack - P-type mosfet acknowledgment signal.
gn_ack - N-type mosfet acknowledgment signal.
out - switches output.
*/
module switches(power, gp, gn, gp_ack, gn_ack, out, nrst);
    inout power, gp, gn;
    inout gp_ack, gn_ack, out;
    input nrst;

    p_switch p_switch_inst(.g(gp), .s(power), .d(out), .g_ack(gp_ack), .nrst(nrst));
    n_switch n_switch_inst(.g(gn), .s(sw_gnd), .d(out), .g_ack(gn_ack), .nrst(nrst));
    
    gnd sw_gnd_inst(sw_gnd);
    
endmodule
