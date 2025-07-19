//RTL

module demux_1_to_8 (
    input wire in,
    input wire [2:0] sel,
    output reg [7:0] out
);

always @(*) begin
    out = 8'b00000000;
    case (sel)
        3'b000: out[0] = in;
        3'b001: out[1] = in;
        3'b010: out[2] = in;
        3'b011: out[3] = in;
        3'b100: out[4] = in;
        3'b101: out[5] = in;
        3'b110: out[6] = in;
        3'b111: out[7] = in;
        default: out = 8'b00000000;
    endcase
end

endmodule

//TB

`timescale 1ns / 1ps

module tb_demux_1_to_8;

    reg in;
    reg [2:0] sel;
    wire [7:0] out;

    demux_1_to_8 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("Time = %0t | in = %b | sel = %b | out = %b", $time, in, sel, out);

        in = 1'b0; sel = 3'b000; #10;
        in = 1'b1; sel = 3'b000; #10;
        in = 1'b1; sel = 3'b001; #10;
        in = 1'b1; sel = 3'b010; #10;
        in = 1'b1; sel = 3'b011; #10;
        in = 1'b1; sel = 3'b100; #10;
        in = 1'b1; sel = 3'b101; #10;
        in = 1'b1; sel = 3'b110; #10;
        in = 1'b1; sel = 3'b111; #10;

        $finish;
    end

endmodule

