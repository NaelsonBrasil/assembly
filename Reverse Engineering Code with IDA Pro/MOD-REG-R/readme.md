http://www.c-jump.com/CIS77/CPU/x86/X77_0090_addressing_modes.htm

Opration Code 

```
Encoding Real x86 Instructions
x86 Instructions Overview
x86 Instruction Format Reference
x86 Opcode Sizes
x86 ADD Instruction Opcode
Encoding x86 Instruction Operands, MOD-REG-R/M Byte
General-Purpose Registers
REG Field of the MOD-REG-R/M Byte
MOD R/M Byte and Addressing Modes
SIB (Scaled Index Byte) Layout
Scaled Indexed Addressing Mode
Encoding ADD Instruction Example
Encoding ADD CL, AL Instruction
Encoding ADD ECX, EAX Instruction
Encoding ADD EDX, DISPLACEMENT Instruction
Encoding ADD EDI, [EBX] Instruction
Encoding ADD EAX, [ ESI + disp8 ] Instruction
Encoding ADD EBX, [ EBP + disp32 ] Instruction
Encoding ADD EBP, [ disp32 + EAX*1 ] Instruction
Encoding ADD ECX, [ EBX + EDI*4 ] Instruction
Encoding ADD Immediate Instruction
Encoding Eight, Sixteen, and Thirty-Two Bit Operands
Encoding Sixteen Bit Operands
x86 Instruction Prefix Bytes
Alternate Encodings for Instructions
x86 Opcode Summary
MOD-REG-R/M Byte Summary
ISA Design Considerations
ISA Design Challenges
Intel Architecture Software Developer's Manual
Intel Instruction Set Reference (Volume2)
Chapter 3 of Intel Instruction Set Reference
Intel Reference Opcode Bytes
Intel Reference Opcode Bytes, Cont.
Intel Reference Opcode Bytes, Cont.
Intel Reference Opcode Bytes, Cont.
Intel Reference Opcode Bytes, Cont.
Intel Reference Opcode Bytes, Cont.
Intel Reference Instruction Column
```


![MODE Reg - R/M](https://raw.githubusercontent.com/devnaelson/assembly/master/Reverse%20Engineering%20Code%20with%20IDA%20Pro/MOD-REG-R/rm.png)

https://www.youtube.com/watch?v=O4vUzl33rNw&list=PLfMCiCIRnpUmn-O0umAYuI270lr2myoML

```
No. It's more complicated, as you can see on sandpile.org/x86/opc_rm

d8 = 11 011 000
     11         = both operands are registers
        011     = the 'r' operand is ebx
            000 = the 'rm' operand is eax
mov r32, imm32 works differently, the destination register is the low 3 bits of the opcode, here 000 so eax. In the manual, that type of encoding is written as a + sign after the opcode, as in B8+rd id.

This is all explained in the manual, of course.
```

```
0xC9 (leave)
0x31, 0xc0 (xor eax, eax)
0xC9 (ret)
-----
0x31 operator 

0xc0 = Operands

```
Operands
An x86 instruction can have zero to three operands. Operands are separated by commas (,) (ASCII 0x2C). For instructions with two operands, the first (lefthand) operand is the source operand, and the second (righthand) operand is the destination operand (that is, source->destination).

Note –
The Intel assembler uses the opposite order (destination<-source) for operands.

Operands can be immediate (that is, constant expressions that evaluate to an inline value), register (a value in the processor number registers), or memory (a value stored in memory). An indirect operand contains the address of the actual operand value. Indirect operands are specified by prefixing the operand with an asterisk (*) (ASCII 0x2A). Only jump and call instructions can use indirect operands.


