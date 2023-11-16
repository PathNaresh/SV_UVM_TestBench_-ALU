
class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)
  
  my_driver drv;
  my_monitor mon;
  my_sequencer seqr;
  
  function new(input string name = "my_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("AGENT_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "Inside Build_Phase", UVM_NONE)
    
    drv = my_driver::type_id::create("drv", this);
    mon = my_monitor::type_id::create("mon", this);
    seqr = my_sequencer::type_id::create("seqr", this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "Inside Connect_Phase", UVM_NONE)
    
    drv.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    `uvm_info("AGENT_CLASS", "Inside Run_Phase", UVM_NONE)
  
  endtask
  
  
endclass
