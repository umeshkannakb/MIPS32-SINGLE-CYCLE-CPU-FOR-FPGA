
module system(
input clk,
input reset
);

wire [31:0] instrAddress;
wire [31:0] instruction;
wire [31:0] dataMemReadAddress;
wire [31:0] dataMemWriteAddress;
wire [31:0] dataMemWriteData;
wire [31:0] dataMemOut;
wire [31:0] ReadData;
wire        MemWrite;

instructionMemory im(
    .ReadAddress(instrAddress),
    .instruction(instruction)
);

mips proc(
    .clk(clk),
    .reset(reset),
    .instrAddress(instrAddress),
    .currInstruction(instruction),
    .dataMemReadAddress(dataMemReadAddress),
    .dataMemWriteAddress(dataMemWriteAddress),
    .dataMemWriteData(dataMemWriteData),
    .dataMemOut(ReadData),
    .MemWrite(MemWrite)   
);

dataMemory dm(
    .clk(clk),
    .ReadAddress(dataMemReadAddress),
    .WriteAddress(dataMemWriteAddress),
    .WriteData(dataMemWriteData),
    .ReadData(ReadData),
    .MemWrite(MemWrite)
);

endmodule
