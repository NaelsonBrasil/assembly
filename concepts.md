--- Usually opcode refers to the type of operation (ADD), and register B is an operand. 

```
ADD B
```



--- Machine code]	[Instruction]	Addressing mode]	[Hexadecimal	Example

```
    0000	          STORE	           Address	               0	    STO 12
    0001	          LOAD	           Number	               1        LDA #12
    0010	          LOAD	           Address	               2	    LDA 12
    0100	          ADD	           Number	               4	    ADD #12
    1000	          ADD	           Address	               8	    ADD 12
    1111	          HALT	            None	               F	    HALT
```

##### Using the table above provide machine code to do the following:

```
LOAD 12
ADD #6

```
--- Answer:

```
    0010 00001100
    0100 00000110
```

##### Using the table above give the assembly code for the following machine code:

```
0001 00000111
0100 00001001
0000 00011110
```

--- Answer:

```
LOAD #7
ADD #9
STORE 30
```

##### Explain what the above code does:

--- Answer:

loads the integer 7 into the Accumulator, adds the integer 9 to the Accumulator, stores the result, 16, in memory location 30


##### Convert the following machine code into hexadecimal:
```
0001 00111011
0100 00001001
0000 00011110
1111 00000000
```

--- Answer:
```
1 3 B
4 0 9
0 1 E
F 0 0
```

--- above seen when range is between 0-9 you can do see him add 0 before like 0 9 in this 4 0 9