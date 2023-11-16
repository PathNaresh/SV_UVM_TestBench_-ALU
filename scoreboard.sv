
class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)
  
  uvm_analysis_imp #(my_sequence_item, my_scoreboard) aimp;
  
  my_sequence_item transactions[$];
    
  function new(input string name = "my_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Inside Build_Phase", UVM_NONE)
    
    aimp = new("aimp", this);
  
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Inside Connect_Phase", UVM_NONE)
  endfunction
  
  //write method
  
  function void write(my_sequence_item item);
    
    transactions.push_back(item);
  
  endfunction
  
  task run_phase(uvm_phase phase);
    
    `uvm_info("SCB_CLASS", "Inside Run_Phase", UVM_NONE)
    
    forever begin
      // get the packet & then generate the expected value and compare it with actual value & score the transactions accordingly
      my_sequence_item curr_trans;
      wait(transactions.size() != 0);
      curr_trans = transactions.pop_front();
      compare(curr_trans);
    end
    
  endtask
  
  task compare(my_sequence_item curr_trans);
    
    logic [3:0] expected;
    logic [3:0] actual;
    
    case(curr_trans.sel)
      
      0 : begin 
        expected = curr_trans.a + curr_trans.b;
      end
      
      1 : begin
        expected = curr_trans.a - curr_trans.b;
      end
      
    endcase
    
    actual = curr_trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction FAILED! [%0t] :: a = %0d b = %0d sel = %0b ACTUAL = %0d & EXPECTED = %0d", $time,  curr_trans.a, curr_trans.b, curr_trans.sel, actual, expected))
    end
    
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction PASSED! [%0t] :: a = %0d b = %0d sel = %0b ACTUAL = %0d & EXPECTED = %0d", $time,  curr_trans.a, curr_trans.b, curr_trans.sel, actual, expected), UVM_NONE)
    end
        
  endtask
  
  
endclass
