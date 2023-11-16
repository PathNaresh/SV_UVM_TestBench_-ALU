
class my_sequencer extends uvm_sequencer#(my_sequence_item);
  `uvm_component_utils(my_sequencer)
  
  function new(input string name = "my_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SEQUENCER_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER_CLASS", "Inside Build_Phase", UVM_NONE)
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENECR_CLASS", "Inside Connect_Phase", UVM_NONE)
  endfunction
  
endclass
