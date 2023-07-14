module figofsm_TB;
  
  // Parameters
  parameter CLK_PERIOD = 10;  // Clock period in time units
  
  // Inputs
  reg clk;
  reg reset;
  reg input_data;
  reg [2:0] current_state;
  
  // Outputs
  wire [2:0] next_state;
  
  // Instantiate the DUT
  FigoController dut (
    .clk(clk),
    .reset(reset),
    .input_data(input_data),
    .current_state(current_state),
    .next_state(next_state)
  );
  
  // Clock generation
  always #((CLK_PERIOD/2)) clk = ~clk;
  
  // Test stimulus
  initial begin
    // Initialize inputs
    reset = 1;
    input_data = 0;
    current_state = 3'b000;
    
    // Apply reset
    #10 reset = 0;
    
    // Test case 1: Move from Room0 to Room1
    #10 input_data = 1;
    #10 input_data = 0;
    
    // Test case 2: Move from Room1 to Room2
    #10 input_data = 0;
    #10 input_data = 0;
    
    // Test case 3: Move from Room2 to Room3
    #10 input_data = 1;
    #10 input_data = 1;
    
    // Test case 4: Move from Room3 to Room0
    #10 input_data = 0;
    #10 input_data = 1;
    
    // Test case 5: Move from Room0 to Room1
    #10 input_data = 1;
    #10 input_data = 0;
    
    // Add more test cases as needed
    
    // End simulation
    #10 $finish;
  end
  
endmodule
