`include "ctrl_signal_def.v"
// 写同步、读组合：与 load 同周期可旁路 RD，缩短信赖 load 的停顿（端口未改）。
module DM( Addr, WD, clk, DMCtrl, RD);
    input  [11:2] Addr;
    input  [31:0] WD;
    input  clk;
    input DMCtrl;
    output reg [31:0] RD;

    reg [31:0] memory[0:1023];

    always @(posedge clk) begin
        if (DMCtrl)
            memory[Addr] <= WD;
    end

    always @(*) begin
        if (DMCtrl)
            RD = 32'h0000_0000;
        else
            RD = memory[Addr];
    end

endmodule
