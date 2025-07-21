module HA(s,c,a,b);
input a,b;
output s,c;
assign s = a^b;
assign c = a&b;
endmodule

module FA(s,c,a,b,cin);
input a,b,cin;
output s,c;
assign s = a^b^cin;
assign c = (a&b) | cin&(a^b);
endmodule

module multiplier_4x4(p,a,b);
input [3:0]a;
input [3:0]b;
output [7:0]p;
wire [20:0]w;

assign p[0] = a[0]&b[0];

HA HA1(p[1],w[0],a[1]&b[0],a[0]&b[1]);
FA FA1(w[4],w[1],(a[2]&b[0]),a[1]&b[1],w[0]);
FA FA2(w[5],w[2],~(a[3]&b[0]),(a[2]&b[1]),w[1]);
FA FA3(w[6],w[3],4'b0001,~(a[3]&b[1]),w[2]);

HA HA2(p[2],w[7],w[4],(a[0]&b[2]));
FA FA4(w[11],w[8],w[5],(a[1]&b[2]),w[7]);
FA FA5(w[12],w[9],w[6],(a[2]&b[2]),w[8]);
FA FA6(w[13],w[10],w[3],~(a[3]&b[2]),w[9]);
HA HA3(p[3],w[14],w[11],~(a[0]&b[3]));
FA FA7(p[4],w[15],w[12],~(a[1]&b[3]),w[14]);
FA FA8(p[5],w[16],w[13],~(a[2]&b[3]),w[15]);
FA FA9(p[6],w[17],w[10],a[3]&b[3],w[16]);
HA HA4(p[7],w[18],4'b0001,w[17]);

endmodule
