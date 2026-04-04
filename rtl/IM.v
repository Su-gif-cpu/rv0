`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/26 09:28:20
// Design Name: 
// Module Name: IM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "ctrl_signal_def.v"
module IM(InsMemRW, addr, Ins);
    input               InsMemRW;       //指令存储单元信号
    input       [11:2]  addr;           //指令存储器地址
    output reg [31:0] Ins;             //取得的指令
    reg [31:0] memory[0:1023];

    // 组合读：阻塞赋值，避免 NBA 在仿真里与 addr 错拍导致 Ins 长期 X
    always @(*) begin
        Ins = InsMemRW ? memory[addr] : 32'b0;
    end

endmodule
