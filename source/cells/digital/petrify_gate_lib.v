/*
 * Gate library for Petrify
 */

module nor2 (A, B, O);
    input A;
    input B;
    output reg O = 0;

    always @ (A or B)
        #2 O <= ~(A | B);
endmodule

module and2 (A, B, O);
    input A;
    input B;
    output reg O = 0;
    
    always @(A or B)
        #2 O <= A & B;
endmodule

module inv (A, O);
    input A;
    output reg O = 0;

    always @(A)
        #1 O <= ~A;
        
endmodule

module oai12 (A, B, C, O);
    input A;
    input B;
    input C;
    output reg O = 0;

    always @(A or B or C)
        #2 O <= ~(A & (B | C)); 
        
endmodule

module buff (A, O);
    input A;
    output reg O = 0;

    always @(A)
        #2 O <= A;    
        
endmodule

module aoi12 (A, B, C, O);
    input A;
    input B;
    input C;
    output reg O = 0;

    always @(A or B or C)
         #2 O <= ~(A | B & C);
        
    //assign O = ~(A | B & C);
endmodule

module and2_1 (A, B, O);
    input A;
    input B;
    output reg O = 0;

    always @(A or B)
        #2 O <= A & (~B);
        
endmodule

module AO21(A1, A2, B, O);
    input A1;
    input A2;
    input B;
    output reg O = 0;
    
     always @(A1 or A2 or B)
        #2 O <= ( A1 & A2 | B);
      
endmodule

module OAI32 (A1, A2, A3, B1, B2, ON);
    input A1;
    input A2;
    input A3;
    input B1;
    input B2;
    output reg ON = 0;

    always @(A1 or A2 or A3 or B1 or B2)
        #2 ON <= ~( (A1 | A2 | A3) & (B1 | B2));
        
        
endmodule

module oai22 (A, B, C, D, O);
    input A;
    input B;
    input C;
    input D;
    output reg O = 0;

    always @(A or B or C or D)
        #2 O <= ~((A | B) & (C|D));
        
endmodule

module nand4 (A, B, C, D, O);
    input A;
    input B;
    input C;
    input D;
    output reg O = 0;

    always @(A or B or C or D)
        #2 O <= ~(A & B & C & D);
        
endmodule

module and3 (A, B, C, O);
    input A;
    input B;
    input C;
    output reg O = 0;

    always @(A or B or C)
        #2 O <= A & B & C;    
        
endmodule
    
module nand2_1 (A, B, O);
    input A;
    input B;
    output reg O = 0;
    
    always @(A or B)
        #2 O <= ~(A & ~B);
        
endmodule

module nor3 (A, B, C, O);
    input A;
    input B;
    input C;
    output reg O = 0;

    always @(A or B or C)
        #2 O <= ~(A|B|C);
            
endmodule

module nor4 (A, B, C, D, O);
    input A;
    input B;
    input C;
    input D;
    output reg O = 0;

    always @(A or B or C)
        #4 O <= ~(A|B|C|D);
            
endmodule

module NOR4B (A, B, C, D, O);
    input A;
    input B;
    input C;
    input D;
    output reg O = 0;

    always @(A or B or C or D)
        #4 O <= ~(~A|B|C|D);
            
endmodule


module nand2 (A, B, O);
    input A;
    input B;
    output reg O = 0;

    always @(A or B)
        #2 O <= ~(A & B);

endmodule

module nand3 (A, B, C, O);
    input A;
    input B;
    input C;
    output reg O = 0;

    always @(A or B or C)
        #2 O <= ~(A & B & C);    
        
endmodule

module or4 (A, B, C, D, O);
    input A;
    input B;
    input C;
    input D;
    output reg O = 0;

    always @(A or B or C or D)
        #2 O <= A | B | C | D;    
        
endmodule

module or3 (A, B, C, O);
    input A;
    input B;
    input C;
    output reg O = 0;

    always @(A or B or C)
        #2 O <= A | B | C;
endmodule

module or2 (A, B, O);
    input A;
    input B;
    output reg O = 0;

    always @(A or B)
        #2 O <= A | B;
endmodule


module c_element1 (A, B, C);
    input A;
    input B;
    output reg C = 0;
    
    always @(A or B or C)
        #2 C <= ~A & B | (~A | B) & C;
        
endmodule

module c_element0_WITH_RESET (nrst, A, B, C);
    input nrst;
    input A;
    input B;
    output reg C = 0;

    always @(A or B or C or nrst)
        if (!nrst)
            C <= 0;
        else
           #2 C <= nrst & (A & B | (A | B) & C);
endmodule

module c_element1_WITH_RESET (nrst, A, B, C);
    input A;
    input B;
    input nrst;
    output reg C = 0;
    
    always @(A or B or C or nrst)
        if (!nrst)
            C <= 0;
        else
           #2 C <= nrst & (~A & B | (~A | B) & C);
endmodule

module sr_nor (S, R, Q);
    input S;
    input R;
    output reg Q = 0;
    
    always @(S or R or Q)
       #2 Q <= S | ~R & Q;
        
endmodule

module sr_nor_WITH_RESET (nrst, S, R, Q);
    input nrst;
    input S;
    input R;
    output reg Q = 0;
    
    always @(S or R or Q or nrst)
        if (!nrst)
            Q <= 0;
        else
           #2 Q <= nrst & (S | ~R & Q);
endmodule
