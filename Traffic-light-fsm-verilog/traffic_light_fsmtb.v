module traffic_light_fsmtb;
reg clk,rst;
wire A_red,A_yellow,A_green;
wire B_red,B_yellow,B_green;

traffic_light_fsm uut(.clk(clk),.rst(rst),.A_red(A_red),.A_yellow(A_yellow),.A_green(A_green),
.B_red(B_red),.B_yellow(B_yellow),.B_green(B_green));

always #5 clk = ~clk;
 
initial
 begin
   clk=0;rst=1;
   #10 rst=0;
   #100;
   $finish;
 end