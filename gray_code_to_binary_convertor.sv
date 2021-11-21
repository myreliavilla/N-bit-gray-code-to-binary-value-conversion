module gray_code_to_binary_convertor #(parameter N = 4)( 
  input logic clk, rstn, 
  input logic[N-1:0] gray_value,
  output logic[N-1:0] binary_value);
 
  // Add code for gray code to binary conversion
function automatic [N-1:0] gray_to_binary(logic [N-1:0] value);
begin
gray_to_binary[N-1] = value[N-1];
for(int i=N-1; i>0; i = i - 1)
gray_to_binary[i-1] = gray_to_binary[i] ^ value[i - 1];
end
endfunction
// Store binary2gray output in a register
always_ff@(posedge clk or negedge rstn) begin
if (!rstn) begin
binary_value <= 0;
end
else begin
binary_value <= gray_to_binary(gray_value);
end
end

endmodule: gray_code_to_binary_convertor
