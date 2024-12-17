module subtractor_TB;
  // Declare inputs and outputs
  reg [3:0] a, b;    // 4-bit inputs
  reg m;             // Control input for subtraction
  wire [3:0] sum;    // Output sum
  wire cout, v;      // Carry-out and overflow signals
  
  // Instantiate the Subtractor module
  Subtractor S1 (.A(a), .B(b), .m(m), .S(sum), .C4(cout), .v(v));
  
  // Clock and reset signals
  reg clk;
  reg rst;

  // Clock generation
  initial begin
    clk = 0;
    rst = 1;
    #20;
    rst = 0;
  end

  always begin
    #10 clk = ~clk; // Clock toggles every 10 time units
  end

  // Test sequence
  reg [3:0] i;  // Iteration counter
  initial begin
    i = 0;
    $monitor("%d: a=%b, b=%b, m=%b, sum=%b, cout=%b, overflow=%b", 
             $time, a, b, m, sum, cout, v);
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      i = 0; // Reset the iteration counter
    end
    else begin
      a <= $random % 16;  // Random 4-bit value for 'a'
      b <= $random % 16;  // Random 4-bit value for 'b'
      m <= $random % 2;   // Random value for 'm' (0 or 1)
      #20;                // Wait for 20 time units
      i = i + 1;          // Increment the counter
      if (i == 10) $finish; // Stop the simulation after 10 iterations
    end
  end
endmodule

