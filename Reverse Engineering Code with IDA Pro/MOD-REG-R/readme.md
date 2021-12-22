http://www.c-jump.com/CIS77/CPU/x86/X77_0090_addressing_modes.htm

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


```
No. It's more complicated, as you can see on sandpile.org/x86/opc_rm

d8 = 11 011 000
     11         = both operands are registers
        011     = the 'r' operand is ebx
            000 = the 'rm' operand is eax
mov r32, imm32 works differently, the destination register is the low 3 bits of the opcode, here 000 so eax. In the manual, that type of encoding is written as a + sign after the opcode, as in B8+rd id.

This is all explained in the manual, of course.
```