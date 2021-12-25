
The number of address lines in 8086 is 20, 8086 BIU will send 20bit address, so as to access one of the 1MB memory locations. The four segment registers actually contain the upper 16 bits of the starting addresses of the four memory segments of 64 KB each with which the 8086 is working at that instant of time. A segment is a logical unit of memory that may be up to 64 kilobytes long. Each segment is made up of contiguous memory locations. It is an independent, separately addressable unit. Starting address will always be changing. It will not be fixed.

The number of Address lines gives you the memory capacity.

Take an example with less address lines…

If we have only 2 address lines…. Then 2^2 =4 memory locations can be accessed which will have the address 00, 01,10,11.

If we increase 1 address line then the memory capacity becomes 2^3=8 memory locations

Like this if we go on increasing the address lines the memory accessing capacity becomes more.

So if we have 20 address lines , 2^20 = 1mega memory locations can be accessed.