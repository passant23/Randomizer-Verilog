module Randomizer(
input clk,enable,seed_load,reset,
input [1:15] Seed_Data, 
input data_in,
output reg data_out,
output reg [95:0] dataout);
 
  reg [1:15] shift_data = 15'b011011100010101;
  reg   XOR1_out;
  reg   XOR2_out;
  
  reg [6:0] i=95;
always @(negedge clk)
begin
if (reset==1'b1)
begin
shift_data = 15'b011011100010101;
end
if(enable==1'b1)
begin 
if(seed_load==1'b1)
begin
shift_data=Seed_Data;
end
else 
begin
//xor

shift_data={XOR1_out,shift_data[1:14]};

XOR2_out=XOR1_out^data_in;
data_out=XOR2_out;
dataout[i]=data_out;
i=i-1;
end
end
end
  
    
 always@(posedge clk)
 begin
   
 XOR1_out= shift_data[15]^shift_data[14];
 end
   

    
    

    
endmodule

