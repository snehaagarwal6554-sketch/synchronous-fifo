module syn_fifo_tb;
    reg clk,rst,wr_en,rd_en;
    reg [3:0] data_in;
    wire full,empty;
    wire [3:0] data_out;
    syn_fifo dut(clk,rst,wr_en,rd_en,data_in,data_out,full,empty);
    always #5 clk = ~clk;
    initial begin
        $monitor("Time=%0t,clk=%b,rst=%b,wr=%b,rd=%b,data_in=%0d,data_out=%0d full=%b,empty=%b",$time,clk,rst,wr_en,rd_en,data_in,data_out,full,empty);
        clk=0;
        rst=1;
        wr_en=0;
        rd_en=0;
        data_in=0;
        #10;
        rst=0;
        //write data
        #10 wr_en=1; data_in=4;
        #10 data_in=7;
        #10 data_in=9;
        #10 wr_en=0;
        //read data
        #10 rd_en=1;
        #30 rd_en=0;
      #20 $finish;
    end
endmodule
