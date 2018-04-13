/*
Environment module of buck converter: switch network, lc network and load submodules.

Authors: Vladimir Dubikhin.
*/

/*
Inputs:

Ouputs:

*/
module environment(gp, gn, gp_ack, gn_ack, oc, zc, uv, nrst);
    
    input  gp, gn;
    input nrst;
    output gp_ack, gn_ack, oc, zc;
    output uv;
        
    wire out;
    
    wire power_out;
    wire mos_n_in, mos_p_in, mos_p_voltage;
    
    //switch network
    sw_network sw_network_inst (.gp(gp), .gn(gn), .gp_ack(gp_ack), .gn_ack(gn_ack), 
                                    .oc(oc), .zc(zc), .out(out), .nrst(nrst));
    
    //lc network
    lc_network lc_network_inst(.power_in(out), .power_out(power_out));
    
    //load
    load load_inst(.power_in(power_out), .uv(uv), .nrst(nrst));

  
endmodule
