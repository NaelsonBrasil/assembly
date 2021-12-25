
Address
Shows the offset (location) of each line in the byte string.


Little Endian UTF-16 Text
offset address 0x1 0x2 0x3 0x4

[reference](https://github.com/devnaelson/assembly/blob/master/compiled-resolutions/hex-editor/hexeditor.md)

offset<br>
0x00000000 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15<br>
0x00000010<br>

#### Hexdecimal litter indian
```
A load word or store word instruction uses only one memory address. The lowest address of the four bytes is used for the address of a block of four contiguous bytes.

Big Endian Byte Order: The most significant byte (the "big end") of the data is placed at the byte with the lowest address. The rest of the data is placed in order in the next three bytes in memory.

Little Endian Byte Order: The least significant byte (the "little end") of the data is placed at the byte with the lowest address. The rest of the data is placed in order in the next three bytes in memory.

example in memory 
number decimal 12345678
to BC614E hex
to 1011 1100| 0110 0001| 0100 1110 = 16 bits
-->   BC          61        4E  

12 34 56 78

Big Endian
|12||34||56||78|

 0x1 0x2 0x3 0x4
|78||56||34||12| => least significant byte (the "little end") of the data is placed at the byte with the lowest address. 78 = 0x1 that represent 4E in hex and not value! the 


whole BC614E = 12345678 more convert in binary first you can know what is the leat significant byte

offset
           0  1  2  3  4  5 6 7 8 9 10 11 12 13 14 15
0x00000000 4E 61 BC
0x00000010

```
- opcode(code operation) vs machine code
- opcode = instructions 
- oprands = machine code

continue;