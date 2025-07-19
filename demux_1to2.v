//RTL

module mux_to_out (
    input wire in,
    input wire sel,
    output reg [1:0] out
);

always @(*) begin
    out = 2'b00;
    if (sel == 1'b0)
        out[0] = in;
    else
        out[1] = in;
end

endmodule

//TB


`timescale 1ns / 1ps

module tb_mux_to_out;

    
    reg in;
    reg sel;
    wire [1:0] out;

    
    mux_to_out uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        
        $monitor("Time = %0t | in = %b | sel = %b | out = %b", $time, in, sel, out);

  
        in = 1'b0; sel = 1'b0; #10;
        
        
        in = 1'b1; sel = 1'b0; #10;
        
      
        in = 1'b0; sel = 1'b1; #10;
        
      
        in = 1'b1; sel = 1'b1; #10;

        $finish;
    end

endmodule

