
class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)
  
  virtual my_interface vif;
  
  my_sequence_item item;
  
  uvm_analysis_port #(my_sequence_item) ap;
  
  function new(input string name = "alu_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Inside Build_Phase", UVM_NONE)
    
    ap = new("ap", this);
    
    if(!uvm_config_db#(virtual my_interface)::get(this, "", "vif", vif)) begin
      `uvm_error("MONITOR", "Unable to Virtual Interface")
    end
                 
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Inside Connect_Phase", UVM_NONE)
  endfunction
  
  task run_phase(uvm_phase phase);
    
    `uvm_info("MONITOR_CLASS", "Inside Run_Phase", UVM_NONE)
    
    forever begin
    
      item = my_sequence_item::type_id::create("item");
      
      wait(!vif.reset);
      @(posedge vif.clock);
      
      item.a = vif.a;            //sample inputs
      item.b = vif.b;
      item.sel = vif.sel;
      
      @(posedge vif.clock);      //sample output : send input on cuurent cycle then DUT gives output on next cycle
      item.result = vif.result;
      
      ap.write(item);            //send item to scb
      
    end
  
  endtask
  
  
endclass
