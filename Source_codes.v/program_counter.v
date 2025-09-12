module programCounter(
    input clk,
    input reset,
    input [31:0] pcIn,
    output reg [31:0] instructionAddress
    );
    

always @(posedge clk or posedge reset)
begin
    if(reset)
        instructionAddress <= 0;
    else
        instructionAddress <= pcIn;
end    
    
endmodule
