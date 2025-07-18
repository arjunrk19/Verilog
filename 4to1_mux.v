//RTL

module mux4to1 (
    input  wire [3:0] in,     
    input  wire [1:0] sel,    
    output wire       y     
);
  
//here i am using data flow modelling
  
assign y = (sel == 2'b00) ? in[0] :
             (sel == 2'b01) ? in[1] :
             (sel == 2'b10) ? in[2] :
             in[3];
endmodule

//TB

module tb_mux4to1;

 
  reg  [3:0] in;
  reg  [1:0] sel;
  wire y;

  // Instantiate the Unit Under Test (UUT) or coonecting to dut
  mux4to1 uut (
    .in(in),
    .sel(sel),
    .y(y)
  );

  initial begin
  
    $monitor("The values are Time=%ot,sel=%b,in=%b,y=%b", $time, sel, in, y);

    in = 4'b1010; 
    sel = 2'b00; #10;//in[0]=0
    sel = 2'b01; #10;//in[1]=1
    sel = 2'b10; #10;//in[2]=0
    sel = 2'b11; #10;//in[3]=1
    
    in = 4'b1100; 
    sel = 2'b00; #10;//in[0]=0
    sel = 2'b01; #10;//in[1]=0
    sel = 2'b10; #10;//in[2]=1
    sel = 2'b11; #10;//in[3]=1

    in = 4'b1001; 
    sel = 2'b00; #10;//in[0]=1
    sel = 2'b01; #10;//in[1]=0
    sel = 2'b10; #10;//in[2]=0
    sel = 2'b11; #10;//in[3]=1

    $finish;
  end

endmodule
