
class my_base_sequence extends uvm_sequence;
  `uvm_object_utils(my_base_sequence)
  
  my_sequence_item reset_pkt;
  
  function new(input string name = "my_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQUENCE", "Inside Constructor", UVM_NONE)
  endfunction
  
  task body();
    `uvm_info("BASE_SEQUENCE", "Inside Body method", UVM_NONE)
    
    reset_pkt = my_sequence_item::type_id::create("reset_pkt");
    
    start_item(reset_pkt);
    reset_pkt.randomize() with {reset == 1;};
    finish_item(reset_pkt);
    
  endtask

endclass


class my_test_sequence extends my_base_sequence;
  `uvm_object_utils(my_test_sequence)
  
  my_sequence_item item;
  
  function new(input string name = "my_test_sequence");
    super.new(name);
    `uvm_info("BASE_SEQUENCE", "Inside Constructor", UVM_NONE)
  endfunction
  
  task body();
    `uvm_info("TEST_SEQUENCE", "Inside Body method", UVM_NONE)
    
    item = my_sequence_item::type_id::create("item");
    
    start_item(item);
    item.randomize() with {reset == 0;};
    finish_item(item);
    
  endtask

endclass
