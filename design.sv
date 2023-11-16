
module my_dut(
  
  clock,
  reset,
  a,
  b,
  sel,
  result
  
);
  
  input clock;
  input  reset;
  input [2:0] a, b;
  input sel;
  
  output reg [3:0] result;
    
  always @(posedge clock) begin
    
    if(reset) begin
      
      result = 0;
      
    end 
    
    else begin
      
      case(sel)
        
        1'b0: result = a + b; 
        1'b1: result = a - b;
      
        default: result = 0; 
      
      endcase
    
    end
    
  end

endmodule
  
  
  
