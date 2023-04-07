module cift_yollu_ram(
  input clk,       // saat girişi
  input [3:0] w_addr1, // 1. yazma adres girişi
  input [3:0] w_addr2, // 2. yazma adres girişi
  input w_en1,     // 1. yazma izni girişi
  input w_en2,     // 2. yazma izni girişi
  input [15:0] w_veri1, // 1. yazma verisi girişi
  input [15:0] w_veri2, // 2. yazma verisi girişi
  input [3:0] r_addr1, // 1. okuma adres girişi
  input [3:0] r_addr2, // 2. okuma adres girişi
  output reg [15:0] r_veri1, // 1. okuma verisi çıkışı
  output reg [15:0] r_veri2  // 2. okuma verisi çıkışı
);

reg [15:0] mem[0:15]; // 16x16 belleğin tanımı

// 1. port yazma 
always @(posedge clk) begin
  if (w_en1) begin
    mem[w_addr1] <= w_veri1;
  end
end

// 2. port yazma 
always @(posedge clk) begin
  if (w_en2) begin
    mem[w_addr2] <= w_veri2;
  end
end

// 1. port okuma 
always @(posedge clk) begin
  r_veri1 <= mem[r_addr1];
end

// 2. port okuma
always @(posedge clk) begin
  r_veri2 <= mem[r_addr2];
end

endmodule