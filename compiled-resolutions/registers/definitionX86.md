```
General registers
EAX EBX ECX EDX

Segment registers
CS DS ES FS GS SS

Index and pointers
ESI EDI EBP EIP ESP

Indicator
EFLAGS
```

General registers
As the title says, general register are the one we use most of the time Most of the instructions perform on these registers. They all can be broken down into 16 and 8 bit registers.<br>

```
32 bits :  EAX EBX ECX EDX
16 bits : AX BX CX DX
 8 bits : AH AL BH BL CH CL DH DL
```

###### EAX,AX,AH,AL : Called the Accumulator register<br>
- It is used for I/O port access, arithmetic, interrupt calls,<br>
###### EBX,BX,BH,BL : Called the Base register,<br>
- it is used as a base pointer for memory access Gets some interrupt return values,<br>
###### ECX,CX,CH,CL : Called the Counter register,<br>
- it is used as a loop counter and for shifts Gets some interrupt values.<br>
###### EDX,DX,DH,DL : Called the Data register.<br>
-              It is used for I/O port access, arithmetic, some interrupt 
               calls.<br>
