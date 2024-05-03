//Countertestbench code
module counter_tb;
  reg clk,reset,load,up_down;
  reg [3:0] data;
  wire [3:0] count;
  
  // instance counter design
  counter counter_dut(.clk(clk),.reset(reset),.up_down(up_down),.load(load),.data(data),.count(count));
  
  //clock generator
  initial 
    begin 
      clk = 1'b0; repeat(30) #3 clk= ~clk;
    end
  
  //insert all the input signal
  initial 
    begin 
      reset = 1'b1;
      #7 reset = 1'b0; 
      #55 reset = 1'b1;
    end
  
  initial 
    begin 
      #12 load = 1'b1; 
      #5 load = 1'b0;
    end
  
  initial 
    begin 
      #5 up_down = 1'b1;
      #35 up_down = 1'b0;
    end
  
  initial 
    begin 
      data = 4'b1000;
      #14 data = 4'b1101;
      #2 data = 4'b1111;
    end
  
  //monitor all the input and output ports at times when any inputs changes its state
  initial 
    begin 
      $monitor("time=%0d,reset=%b,load=%b,ud=%b,data=%d,count=%d",$time,reset,load,up_down,data,count);
    end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
endmodule :counter_tb
