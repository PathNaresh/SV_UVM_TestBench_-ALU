
`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "interface.sv"

`include "sequence_item.sv"
`include "sequence.sv"

`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"

`include "agent.sv"
`include "scoreboard.sv"

`include "env.sv"
`include "test.sv"


module top;
  
  logic clock;
  logic reset;
  
  my_interface vif(
  
    .clock(clock)
   
  );
  
  my_dut dut(
    
    .clock(vif.clock),
    .reset(vif.reset),
    .a(vif.a),
    .b(vif.b),
    .sel(vif.sel),
    .result(vif.result)
    
  );
  
  initial begin
    
    clock = 0;
    #2;
    
    forever begin
      clock = ~clock;
      #2;
    end
    
  end
  
  initial begin
    run_test("my_test");
  end
  
  initial begin
    uvm_config_db#(virtual my_interface)::set(null, "*", "vif", vif);
  end
  
  initial begin
    #5000;
    $display("Sorry ran out of clock cycles!");
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
  
    
    
