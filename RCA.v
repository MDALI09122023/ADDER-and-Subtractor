//RCA

module FA(s,c,a,b,cin);
input a,b,cin;
output s,c;
assign s=a^b^cin;
assign c=(a&b)|(b&cin)|(cin&a);

endmodule
module RCA(S,C4,A,B,C0);
input[3:0] A,B;
output[3:0] S;
input C0;
output C4;
wire c1,c2,c3;
FA f1(.s(S[0]),.c(c1),.a(A[0]),.b(B[0]),.cin(C0)),
f2(.s(S[1]),.c(c2),.a(A[1]),.b(B[1]),.cin(c1)),
f3(.s(S[2]),.c(c3),.a(A[2]),.b(B[2]),.cin(c2)),
f4(.s(S[3]),.c(C4),.a(A[3]),.b(B[3]),.cin(c3));
endmodule

