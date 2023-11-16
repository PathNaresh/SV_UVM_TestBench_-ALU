
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_env env;
  
  my_base_sequence reset_seq;
  my_test_sequence test_seq;
  
  function new(input string name = "my_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Inside Build_Phase", UVM_NONE)
    
    env = my_env::type_id::create("env", this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Inside Connect_Phase", UVM_NONE)
  endfunction
  
  task run_phase(uvm_phase phase);
    
    `uvm_info("TEST_CLASS", "Inside Run_Phase", UVM_NONE)
    
    phase.raise_objection(this);
    
    //reset_sequence
    reset_seq = my_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agent.seqr);
    #10;
    
    //test_sequence
    repeat(10) begin
      test_seq = my_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agent.seqr);
      #10;
    end
   
    phase.drop_objection(this);
  
  endtask
  
  
endclass
