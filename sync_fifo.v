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
            fifo[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
        end
        // Read
        if (rd_en && !empty)
        begin
            data_out <= fifo[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
        end
    end
end

assign full  = (count == DEPTH);
assign empty = (count == 0);
endmodule
