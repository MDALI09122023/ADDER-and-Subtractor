//RCA

module FA(s,c,a,b,cin);
input a,b,cin;
output s,c;
assign s=a^b^cin;
assign c=(a&b)|(b&cin)|(cin&a);

endmodule
module Subtractor(S,C4,A,B,m,v);
input[3:0] A,B;
output[3:0] S;
input m;
output C4,v;
wire C0 ,c1,c2,c3,t1,t2,t3,t4;
FA f1(.s(S[0]),.c(c1),.a(A[0]),.b(t1),.cin(C0)),
f2(.s(S[1]),.c(c2),.a(A[1]),.b(t2),.cin(c1)),
f3(.s(S[2]),.c(c3),.a(A[2]),.b(t3),.cin(c2)),
f4(.s(S[3]),.c(C4),.a(A[3]),.b(t4),.cin(c3));
assign C0=m;
assign t1=m^B[0];
assign t2=m^B[1];
assign t3=m^B[2];
assign t4=m^B[3];
assign v=c3^C4;

endmodule
