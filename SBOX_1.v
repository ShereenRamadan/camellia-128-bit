`timescale 1ns / 1ps


module SBOX_1(
    input  wire       clk,                  
    input  wire [7:0] addra,          
    input  wire [7:0] addrb,          
    output reg  [7:0] douta,          
    output reg  [7:0] doutb           
);

    // Define the ROM as a 256-entry lookup table
    reg [7:0] ROM [0:255];

    // Initialize the ROM with S-box values using a generate block
    generate
        genvar i;
        for (i = 0; i < 256; i = i + 1) begin   
            always @(posedge clk) begin
                case (i)
                    0: ROM[i] = 8'h70; 1: ROM[i] = 8'h82; 2: ROM[i] = 8'h2C; 3: ROM[i] = 8'hEC;
                    4: ROM[i] = 8'hB3; 5: ROM[i] = 8'h27; 6: ROM[i] = 8'hC0; 7: ROM[i] = 8'hE5;
                    8: ROM[i] = 8'hE4; 9: ROM[i] = 8'h85; 10: ROM[i] = 8'h57; 11: ROM[i] = 8'h35;
                    12: ROM[i] = 8'hEA; 13: ROM[i] = 8'h0C; 14: ROM[i] = 8'hAE; 15: ROM[i] = 8'h41;
                    16: ROM[i] = 8'h23; 17: ROM[i] = 8'hEF; 18: ROM[i] = 8'h6B; 19: ROM[i] = 8'h93;
                    20: ROM[i] = 8'h45; 21: ROM[i] = 8'h19; 22: ROM[i] = 8'hA5; 23: ROM[i] = 8'h21;
                    24: ROM[i] = 8'hED; 25: ROM[i] = 8'h0E; 26: ROM[i] = 8'h4F; 27: ROM[i] = 8'h4E;
                    28: ROM[i] = 8'h1D; 29: ROM[i] = 8'h65; 30: ROM[i] = 8'h92; 31: ROM[i] = 8'hBD;
                    32: ROM[i] = 8'h86; 33: ROM[i] = 8'hB8; 34: ROM[i] = 8'hAF; 35: ROM[i] = 8'h8F;
                    36: ROM[i] = 8'h7C; 37: ROM[i] = 8'hEB; 38: ROM[i] = 8'h1F; 39: ROM[i] = 8'hCE;
                    40: ROM[i] = 8'h3E; 41: ROM[i] = 8'h30; 42: ROM[i] = 8'hDC; 43: ROM[i] = 8'h5F;
                    44: ROM[i] = 8'h5E; 45: ROM[i] = 8'hC5; 46: ROM[i] = 8'h0B; 47: ROM[i] = 8'h1A;
                    48: ROM[i] = 8'hA6; 49: ROM[i] = 8'hE1; 50: ROM[i] = 8'h39; 51: ROM[i] = 8'hCA;
                    52: ROM[i] = 8'hD5; 53: ROM[i] = 8'h47; 54: ROM[i] = 8'h5D; 55: ROM[i] = 8'h3D;
                    56: ROM[i] = 8'hD9; 57: ROM[i] = 8'h01; 58: ROM[i] = 8'h5A; 59: ROM[i] = 8'hD6;
                    60: ROM[i] = 8'h51; 61: ROM[i] = 8'h56; 62: ROM[i] = 8'h6C; 63: ROM[i] = 8'h4D;
                    64: ROM[i] = 8'h8B; 65: ROM[i] = 8'h0D; 66: ROM[i] = 8'h9A; 67: ROM[i] = 8'h66;
                    68: ROM[i] = 8'hFB; 69: ROM[i] = 8'hCC; 70: ROM[i] = 8'hB0; 71: ROM[i] = 8'h2D;
                    72: ROM[i] = 8'h74; 73: ROM[i] = 8'h12; 74: ROM[i] = 8'h2B; 75: ROM[i] = 8'h20;
                    76: ROM[i] = 8'hF0; 77: ROM[i] = 8'hB1; 78: ROM[i] = 8'h84; 79: ROM[i] = 8'h99;
                    80: ROM[i] = 8'hDF; 81: ROM[i] = 8'h4C; 82: ROM[i] = 8'hCB; 83: ROM[i] = 8'hC2;
                    84: ROM[i] = 8'h34; 85: ROM[i] = 8'h7E; 86: ROM[i] = 8'h76; 87: ROM[i] = 8'h05;
                    88: ROM[i] = 8'h6D; 89: ROM[i] = 8'hB7; 90: ROM[i] = 8'hA9; 91: ROM[i] = 8'h31;
                    92: ROM[i] = 8'hD1; 93: ROM[i] = 8'h17; 94: ROM[i] = 8'h04; 95: ROM[i] = 8'hD7;
                    96: ROM[i] = 8'h14; 97: ROM[i] = 8'h58; 98: ROM[i] = 8'h3A; 99: ROM[i] = 8'h61;
                    100: ROM[i] = 8'hDE; 101: ROM[i] = 8'h1B; 102: ROM[i] = 8'h11; 103: ROM[i] = 8'h1C;
                    104: ROM[i] = 8'h32; 105: ROM[i] = 8'h0F; 106: ROM[i] = 8'h9C; 107: ROM[i] = 8'h16;
                    108: ROM[i] = 8'h53; 109: ROM[i] = 8'h18; 110: ROM[i] = 8'hF2; 111: ROM[i] = 8'h22;
                    112: ROM[i] = 8'hFE; 113: ROM[i] = 8'h44; 114: ROM[i] = 8'hCF; 115: ROM[i] = 8'hB2;
                    116: ROM[i] = 8'hC3; 117: ROM[i] = 8'hB5; 118: ROM[i] = 8'h7A; 119: ROM[i] = 8'h91;
                    120: ROM[i] = 8'h24; 121: ROM[i] = 8'h08; 122: ROM[i] = 8'hE8; 123: ROM[i] = 8'hA8;
                    124: ROM[i] = 8'h60; 125: ROM[i] = 8'hFC; 126: ROM[i] = 8'h69; 127: ROM[i] = 8'h50;
                    128: ROM[i] = 8'hAA; 129: ROM[i] = 8'hD0; 130: ROM[i] = 8'hA0; 131: ROM[i] = 8'h7D;
                    132: ROM[i] = 8'hA1; 133: ROM[i] = 8'h89; 134: ROM[i] = 8'h62; 135: ROM[i] = 8'h97;
                    136: ROM[i] = 8'h54; 137: ROM[i] = 8'h5B; 138: ROM[i] = 8'h1E; 139: ROM[i] = 8'h95;
                    140: ROM[i] = 8'hE0; 141: ROM[i] = 8'hFF; 142: ROM[i] = 8'h64; 143: ROM[i] = 8'hD2;
                    144: ROM[i] = 8'h10; 145: ROM[i] = 8'hC4; 146: ROM[i] = 8'h00; 147: ROM[i] = 8'h48;
                    148: ROM[i] = 8'hA3; 149: ROM[i] = 8'hF7; 150: ROM[i] = 8'h75; 151: ROM[i] = 8'hDB;
                    152: ROM[i] = 8'h8A; 153: ROM[i] = 8'h03; 154: ROM[i] = 8'hE6; 155: ROM[i] = 8'hDA;
                    156: ROM[i] = 8'h09; 157: ROM[i] = 8'h3F; 158: ROM[i] = 8'hDD; 159: ROM[i] = 8'h94;
                    160: ROM[i] = 8'h87; 161: ROM[i] = 8'h5C; 162: ROM[i] = 8'h83; 163: ROM[i] = 8'h02;
                    164: ROM[i] = 8'hCD; 165: ROM[i] = 8'h4A; 166: ROM[i] = 8'h90; 167: ROM[i] = 8'h33;
                    168: ROM[i] = 8'h73; 169: ROM[i] = 8'h67; 170: ROM[i] = 8'hF6; 171: ROM[i] = 8'hF3;
                    172: ROM[i] = 8'h9D; 173: ROM[i] = 8'h7F; 174: ROM[i] = 8'hBF; 175: ROM[i] = 8'hE2;
                    176: ROM[i] = 8'h52; 177: ROM[i] = 8'h9B; 178: ROM[i] = 8'hD8; 179: ROM[i] = 8'h26;
                    180: ROM[i] = 8'hC8; 181: ROM[i] = 8'h37; 182: ROM[i] = 8'hC6; 183: ROM[i] = 8'h3B;
                    184: ROM[i] = 8'h81; 185: ROM[i] = 8'h96; 186: ROM[i] = 8'h6F; 187: ROM[i] = 8'h4B;
                    188: ROM[i] = 8'h13; 189: ROM[i] = 8'hBE; 190: ROM[i] = 8'h63; 191: ROM[i] = 8'h2E;
                    192: ROM[i] = 8'hE9; 193: ROM[i] = 8'h79; 194: ROM[i] = 8'hA7; 195: ROM[i] = 8'h8C;
                    196: ROM[i] = 8'h9F; 197: ROM[i] = 8'h6E; 198: ROM[i] = 8'hBC; 199: ROM[i] = 8'h8E;
                    200: ROM[i] = 8'h29; 201: ROM[i] = 8'hF5; 202: ROM[i] = 8'hF9; 203: ROM[i] = 8'hB6;
                    204: ROM[i] = 8'h2F; 205: ROM[i] = 8'hFD; 206: ROM[i] = 8'hB4; 207: ROM[i] = 8'h59;
                    208: ROM[i] = 8'h78; 209: ROM[i] = 8'h98; 210: ROM[i] = 8'h06; 211: ROM[i] = 8'h6A;
                    212: ROM[i] = 8'hE7; 213: ROM[i] = 8'h46; 214: ROM[i] = 8'h71; 215: ROM[i] = 8'hBA;
                    216: ROM[i] = 8'hD4; 217: ROM[i] = 8'h25; 218: ROM[i] = 8'hAB; 219: ROM[i] = 8'h42;
                    220: ROM[i] = 8'h88; 221: ROM[i] = 8'hA2; 222: ROM[i] = 8'h8D; 223: ROM[i] = 8'hFA;
                    224: ROM[i] = 8'h72; 225: ROM[i] = 8'h07; 226: ROM[i] = 8'hB9; 227: ROM[i] = 8'h55;
                    228: ROM[i] = 8'hF8; 229: ROM[i] = 8'hEE; 230: ROM[i] = 8'hAC; 231: ROM[i] = 8'h0A;
                    232: ROM[i] = 8'h36; 233: ROM[i] = 8'h49; 234: ROM[i] = 8'h2A; 235: ROM[i] = 8'h68;
                    236: ROM[i] = 8'h3C; 237: ROM[i] = 8'h38; 238: ROM[i] = 8'hF1; 239: ROM[i] = 8'hA4;
                    240: ROM[i] = 8'h40; 241: ROM[i] = 8'h28; 242: ROM[i] = 8'hD3; 243: ROM[i] = 8'h7B;
                    244: ROM[i] = 8'hBB; 245: ROM[i] = 8'hC9; 246: ROM[i] = 8'h43; 247: ROM[i] = 8'hC1;
                    248: ROM[i] = 8'h15; 249: ROM[i] = 8'hE3; 250: ROM[i] = 8'hAD; 251: ROM[i] = 8'hF4;
                    252: ROM[i] = 8'h77; 253: ROM[i] = 8'hC7; 254: ROM[i] = 8'h80; 255: ROM[i] = 8'h9E;
                endcase
            end
        end
    endgenerate

    // Port A: Read from ROM
    always @(posedge clk) begin
        douta <= ROM[addra];
    end

    // Port B: Read from ROM
    always @(posedge clk) begin
        doutb <= ROM[addrb];
    end

endmodule