//RTL

module mux2to1 (
  input  wire [1:0] in,     
    input  wire  sel,    
    output  reg  y     
);
  //here i am using behavioural modelling
  
  always@(*)begin
    if (sel == 1'b0)
      y = in[0];
    else 
      y = in[1];
  end 
endmodule

//TB
//thi is not covering all the possible inpuy combinations

 mux2to1 dut(in,sel,y);
  
  initial begin
    $monitor("TIME = %0t,sel=%0b,in=%0b,y=%0b",$time,sel,in,y);   
    
in=2'b01;
    sel=1'b0;//in[0]=1
   
#10;  
    
in=2'b00;
    sel=1'b0;//in[0]=0
   
#10;     
 
$finish;
end
endmodule
