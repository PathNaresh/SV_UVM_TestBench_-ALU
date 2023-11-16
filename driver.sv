
class my_driver extends uvm_driver#(my_sequence_item);
  `uvm_component_utils(my_driver)
  
  virtual my_interface vif;
  
  my_sequence_item item;
  
  function new(input string name = "my_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "Inside Build_Phase", UVM_NONE)
    
    if(!uvm_config_db#(virtual my_interface)::get(this, "", "vif", vif)) begin
      `uvm_error("DRIVER", "Unable to get Virtual Interface")
    end
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "Inside Connect_Phase", UVM_NONE)
  endfunction
  
  task run_phase(uvm_phase phase);
    
    `uvm_info("DRIVER_CLASS", "Inside Run_Phase", UVM_NONE)
    
    forever begin
      item = my_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  
  endtask
  
  task drive(my_sequence_item item);
    @(posedge vif.clock);
   
    vif.reset <= item.reset;
    vif.a     <= item.a;
    vif.b     <= item.b;
    vif.sel   <= item.sel;
   
  endtask
  
  
endclass
