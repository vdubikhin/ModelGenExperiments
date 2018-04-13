/*
Switch network of buck converter.
Connects switches, power supply with current sensing and zero crossing sensor.

Authors: Vladimir Dubikhin.
*/

/*
Inputs:
gp - P-type mosfet control.
gn - N-type mosfte control.
Ouputs:
gp_ack - P-type mosfet acknowledgment signal.
gn_ack - N-type mosfet acknowledgment signal.
oc - overcurrent signal.
zc - zero crossing signal.
out - output of switch network.
*/
module sw_network (gp, gn, gp_ack, gn_ack, oc, zc, out, nrst);
    inout gp, gn;
    inout gp_ack, gn_ack, oc, zc, out;
    input nrst;
    
    vdd_oc vdd_oc_inst(.vsource(mos_p_voltage), .oc(oc), .gn_ack(gn_ack));
    switches switces_inst (.power(mos_p_voltage), .gp(gp), .gn(gn), .gp_ack(gp_ack), .gn_ack(gn_ack), 
                            .out(sw_out), .nrst(nrst));
    zc zc_inst(.power_in(sw_out), .power_out(out), .zc(zc), .gn_ack(gn_ack)); 

endmodule
