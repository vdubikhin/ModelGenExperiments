// Verilog model of simple control of buck converter
module ctrl_module (nrst, en, uv, 
                    zc, oc, gp, gp_ack, gn, gn_ack);

    input nrst, en, uv;
    input  zc, oc, gp_ack, gn_ack;
    output gp, gn;
    
    // Control Logic
    //or2_gate or2 (.A(oc), .B(gn_ack), .O(or_sr));
    //sr_nor_gate sr_nor (.S(uv), .R(or_sr), .Q(gn));
    //or3_gate or3 (.A(uv), .B(gp_ack), .C(zc), .O(gn));

    //nor2 _U0 (.A(uv), .B(gp_ack), .O(gn));
    //nor2 _U1 (.A(oc), .B(gn_ack), .O(gp));
    
    inv _U0 (.A(oc), .O(_0_));
    // This inverter should have a short delay
    inv _U1 (.A(gn), .O(_1_));
    OAI32 _U2 (.A1(_0_), .A2(gp), .A3(gp_ack), .B1(_1_), .B2(gn_ack), .ON(_2_));
    // This inverter should have a short delay
    inv _U3 (.A(uv), .O(_3_));
    AO21 _U4 (.A1(gn_ack), .A2(_3_), .B(_2_), .O(gn));
    nand2 _U5 (.A(oc), .B(gp_ack), .O(_5_));
    NOR4B _U6 (.A(uv), .B(gn_ack), .C(gn), .D(oc), .O(_6_));
    c_element0_WITH_RESET _U7 (.A(_5_), .B(_6_), .C(gp), .nrst(nrst));



endmodule
