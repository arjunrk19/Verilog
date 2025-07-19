//RTL 

module full_subtractor (
    input  wire a,           
    input  wire b,           
    input  wire cin,         
    output wire diff,       
    output wire bout         
);

    
    assign diff = a ^ b ^ cin;
    assign bout = (~a & b) | ((~(a ^ b)) & cin);

endmodule

//TB

`timescale 1ns / 1ps

module tb_full_subtractor;

    reg a, b, cin;
    wire diff, bout;

   
    full_subtractor uut (
        .a(a),
        .b(b),
      .cin(cin),
        .diff(diff),
        .bout(bout)
    );

    initial begin
      
      $monitor("Time =%0t  | a=%b | b=%b | cin=%b |diff=%b |  bout=%b ",$time,a,b,cin,diff,bout);

        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
    end

endmodule
