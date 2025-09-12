module dataMemory #(parameter propDelay=2)(
    input clk,
    input [31:0] ReadAddress,
    input [31:0] WriteAddress,
    input [31:0] WriteData,
    output [31:0] ReadData,
    input MemWrite
);


reg [31:0] ramMem [20:0];

assign #propDelay ReadData =  ramMem[ReadAddress];

always @(posedge clk)
begin
    if(MemWrite)
        ramMem[WriteAddress] <= WriteData;
end


endmodule
    
