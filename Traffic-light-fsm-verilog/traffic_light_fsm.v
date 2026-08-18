module traffic_light_fsm(
input clk,input rst,
output reg A_red,A_yellow,A_green,
output reg B_red,B_yellow,B_green
    );
    
//define state
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;

reg [1:0]current_state;
reg [1:0]next_state;

//state register
always @(posedge clk or posedge rst)
begin
    if(rst)
        current_state<=s0;
    else
        current_state<=next_state;
end

//next state logic
always@(*)
begin
    case(current_state)
    
    s0: next_state<=s1;
    s1: next_state<=s2;
    s2: next_state<=s3;
    s3: next_state<=s0;
    default:
    next_state<=s0;
    
    endcase
end

//output logic
always@(*)
begin
    //default:all will be off
    A_red=0;
    A_yellow=0;
    A_green=0;
    B_red=0;
    B_yellow=0;
    B_green=0;
    
    case(current_state)
    
    s0:begin 
    A_green=1;
    B_red=1;
    end
    
    s1:begin
    A_yellow=1;
    B_red=1;
    end
    
    s2:begin
    A_red=1;
    B_green=1;
    end
    
    s3:begin
    A_red=1;
    B_yellow=1;
    end
    
    endcase
end 

endmodule
