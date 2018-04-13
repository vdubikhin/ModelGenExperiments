/*
Top module with stimulus for buck converter.

Authors: Vladimir Dubikhin.
*/

`timescale 1ns / 10ps

`include "buck_converter_async_params.vh"

module top();

    reg nrst, en;
    wire gp, gn;
    wire gp_ack, gn_ack, oc, zc;
    wire uv, hl;

    initial begin
	$display("\nSTART OF SIMULATION\n");
	
        nrst = 0;
        en = 0;

        #200
        nrst = 1;
        en = 1;

        #(`SIMULATION_TIME)
	$display("\nEND OF SIMULATION\n");
	$finish(0);
    end
    
    ctrl_module control (.nrst(nrst), .en(en), .uv(uv), 
        .zc(zc), .oc(oc), .gp(gp), .gp_ack(gp_ack), .gn(gn), .gn_ack(gn_ack));

    environment env(.gp(gp), .gn(gn), .gp_ack(gp_ack), .gn_ack(gn_ack),
        .oc(oc), .zc(zc), .uv(uv), .nrst(nrst));

endmodule
