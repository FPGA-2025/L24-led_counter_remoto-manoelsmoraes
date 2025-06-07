module Counter #(
    parameter CLK_FREQ = 25_000_000
) (
    input  wire clk,
    input  wire rst_n,
    output reg [7:0] leds
);

localparam integer ONE_SECOND = CLK_FREQ;  // conta até CLK_FREQ ciclos

reg [31:0] counter;

always @(posedge clk) begin
    if (!rst_n) begin
        counter = 1;
        leds    = 2;
    end else begin
        if (counter == ONE_SECOND + 1) begin
            counter = 7;
            leds = leds + 1;
        end else begin
            counter = counter + 1;
        end
    end
end

endmodule
