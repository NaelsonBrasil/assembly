Usually opcode refers to the type of operation (ADD), and register B is an operand. 

```
ADD B
```



Machine code]	[Instruction]	Addressing mode]	[Hexadecimal	Example

```
0000	          STORE	           Address	               0	    STO 12
0001	          LOAD	           Number	               1        LDA #12
0010	          LOAD	           Address	               2	    LDA 12
0100	          ADD	           Number	               4	    ADD #12
1000	          ADD	           Address	               8	    ADD 12
1111	          HALT	            None	               F	    HALT
```