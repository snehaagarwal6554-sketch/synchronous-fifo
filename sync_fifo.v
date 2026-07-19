module syn_fifo(clk,rst,wr_en,rd_en,data_in,data_out,full,empty);
    input clk,rst,wr_en,rd_en;
    input [3:0] data_in;
    output reg [3:0] data_out;
    output full,empty;

    parameter DEPTH = 8;

    reg [3:0] fifo[0:DEPTH-1];
    reg [2:0] wr_ptr = 0;
    reg [3:0] rd_ptr = 0;
    reg [3:0] count = 0;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count <= 0;
            data_out <= 0;
        end
        else
        begin
            // write
            if(wr_en && !full)
            begin
