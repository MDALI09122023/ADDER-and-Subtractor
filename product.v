//Binary multiplier
`include "CLA_ADDER.v"
module product(a,b,res);
input[3:0]b;
input[2:0]a;
output [6:0] res;
wire[4:0] r1;
wire [3:0] r2,r3;
wire [4:0] i1;

assign r1[0]=b[0]&a[0];
assign r1[1]=b[1]&a[0];
assign r1[2]=b[2]&a[0];
assign r1[3]=b[3]&a[0];

assign r2[0]=b[0]&a[1];
assign r2[1]=b[1]&a[1];
assign r2[2]=b[2]&a[1];
assign r2[3]=b[3]&a[1];


assign r3[0]=b[0]&a[2];
assign r3[1]=b[1]&a[2];
assign r3[2]=b[2]&a[2];
assign r3[3]=b[3]&a[2];


assign r1[4]=1'b0;
assign res[0]=r1[0];

CLA_adder BP1(.a(r1[4:1]), .b(r2[3:0]),.cin(1'b0),.sum(i1[3:0]),.cout(i1[4]));
assign res[1]=i1[0];
CLA_adder BP2(.a(i1[4:1]), .b(r3[3:0]),.cin(1'b0),.sum(res[5:2]),.cout(res[6]));


endmodule