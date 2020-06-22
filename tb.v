`timescale 1ns / 1ps
//takes 3840 to finish
module tb();
reg clk,en,seed_load,reset;
 reg [1:15] Seed_Data;
  reg data_in;
wire data_out;
wire [95:0] dataout;
  reg [95:0] datain=96'hACBCD2114DAE1577C6DBF4C9;
  reg [6:0] i=95;

 Randomizer r1(
.clk(clk),
.enable(en),
.seed_load(seed_load),
.reset(reset),
.Seed_Data(Seed_Data), 
.data_in(data_in),
.data_out(data_out),
.dataout(dataout)
);
initial begin

  en=1'b1;
  seed_load=1'b0;
  reset=1'b0;
end
always 
begin
    clk = 1'b1; 
    #20; 

    clk = 1'b0;
    #20; 
end
 
always @(posedge clk)
begin
  if(i>=0)
    begin
      
 data_in=datain[i];  
   i=i-1;
$display("%g  \t%b",$time,data_out );
   #40;
 end
 
 else 
   $stop;
   
end 
 
 
 
endmodule
