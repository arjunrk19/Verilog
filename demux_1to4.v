//RTL

module demux_1_to_4 (
    input wire in,
    input wire [1:0] sel,
    output reg [3:0] out
);

always @(*) begin
    out = 4'b0000; // Default all outputs to 0
    case (sel)
        2'b00: out[0] = in;
        2'b01: out[1] = in;
        2'b10: out[2] = in;
        2'b11: out[3] = in;
        default: out = 4'b0000;
    endcase
end

endmodule

//TB

`timescale 1ns / 1ps

module tb_demux_1_to_4;

    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    demux_1_to_4 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("Time = %0t | in = %b | sel = %b | out = %b", $time, in, sel, out);

        in = 1'b0; sel = 2'b00; #10;
        in = 1'b1; sel = 2'b00; #10;
        in = 1'b1; sel = 2'b01; #10;
        in = 1'b1; sel = 2'b10; #10;
        in = 1'b1; sel = 2'b11; #10;

        $finish;
    end

endmodule
