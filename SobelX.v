`timescale 1ns / 1ps

module SobelX(input clock, en, input[31:0] stream_input, output[31:0] stream_output);
    
    reg signed [31:0]x[1392:0];
    reg signed [31:0]accumulator;
    reg signed [31:0]data_out;
    
    integer j;
    
    assign stream_output = data_out;
    
    always@(posedge clock) begin
        if(en == 1'b1) begin
            accumulator <= x[0] - x[2] + (x[695] - x[697])*2 + x[1390] - x[1392];
            data_out    <=  accumulator / 8 + 128;
            for (j = 1; j <= 1392; j = j + 1)
                x[j] <= x[j-1];
            x[0] <= stream_input; end
            end
endmodule
