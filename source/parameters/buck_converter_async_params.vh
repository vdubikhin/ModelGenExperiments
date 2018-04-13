/*
Parameters for simple analog model of buck environment.

Authors: Vladimir Dubikhin.
*/

`ifndef _params_simple_analog_vh
`define _params_simple_analog_vh

`define SIMULATION_TIME 100000

`define VOLTAGE_SUPPLY 10
  
//LC network
`define LC_OUT_CAP  0.00001  //in Farads
`define LC_COIL_IND 0.000001 //in Henry

//ZC module
`define ZC_CMP_HYST    0.01
`define ZC_CMP_DELAY   0
`define ZC_CMP_OFFSET  0.0

//VDD_OC module
`define CMP_HYST       0.01
`define CMP_DELAY      0
`define CMP_OFFSET     0.6
`define FILTER_DELAY   10
`define FILTER_SAMPLES 10

//P switch
`define P_VOLTAGE_ACK    5
`define P_GATE_RES       0.05
`define P_G_S_CAP        2p
`define P_G_D_CAP        2p
`define P_GAIN_COEFF     3
`define P_CMP_HYST       2.0
`define P_CMP_DELAY      0
`define P_FW_D_RES       2

//N switch
`define N_VOLTAGE_ACK    5
`define N_GATE_RES       0.02
`define N_G_S_CAP        1p
`define N_G_D_CAP        1p
`define N_GAIN_COEFF     3
`define N_CMP_HYST       2.0
`define N_CMP_DELAY      0
`define N_FW_D_RES       2

// Variable resistor
`define LOAD_RESISTANCE  15
`define LOAD_TIME_DELAY  10000 //100
`define LOAD_MULT_MAX    0 //100


`endif
