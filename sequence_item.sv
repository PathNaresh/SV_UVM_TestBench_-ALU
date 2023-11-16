
class my_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(my_sequence_item)
  
  rand logic reset;
  rand logic [2:0] a, b;
  rand logic sel;
  
  logic [3:0] result;
  
  constraint input1_c {a inside {[4:7]};}
  constraint input2_c {b inside {[1:3]};}
  
  constraint sel_c {sel inside {0, 1};}
  
  function new(input string name = "alu_sequence_item");
    super.new(name);
  endfunction
  
endclass
    
