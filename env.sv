
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  my_agent agent;
  my_scoreboard scb;
  
  function new(input string name = "alu_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV_CLASS", "Inside Constructor", UVM_NONE)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "Inside Build_Phase", UVM_NONE)
    
    agent = my_agent::type_id::create("agent", this);
    scb = my_scoreboard::type_id::create("scb", this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "Inside Connect_Phase", UVM_NONE)
    
    agent.mon.ap.connect(scb.aimp);
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    `uvm_info("ENV_CLASS", "Inside Run_Phase", UVM_NONE)
  
  endtask
  
  
endclass
