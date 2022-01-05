https://eli.thegreenplace.net/2011/02/04/where-the-top-of-the-stack-is-on-x86/
https://notes.shichao.io/disassembly/
https://docs.microsoft.com/en-us/cpp/build/x64-software-conventions?view=msvc-170

```
A negative offset should never be used because data "above" the stack cannot be counted on to stay the way you left it. The operation of reading from the stack without popping is often referred to as "peeking", but since this isn't the official term for it this wikibook won't use it. ```
https://en.wikibooks.org/wiki/X86_Disassembly/The_Stack

- 
https://0xinfection.github.io/reversing/pages/part-15-stack.html

-  the stack is decrement when you add things and increment when you deallocated the things then the stack get spaces that have been miss
Most function prologs look something like:

``` 
push ebp      ; Preserve current frame pointer
mov ebp, esp  ; Create new frame pointer pointing to current stack top
sub esp, 20   ; allocate 20 bytes worth of locals on stack. 
``` 

### Can someone provide a visualization or detailed flow of the stack frame in this Assembly MIPS code block?
- To visualize, first we need to establish the direction of visualization, usually whether up or down.  Both are correct, but one may be - harder to read than the other.


https://faculty.kfupm.edu.sa/COE/shazli/coe205/Help/asm_tutorial_09.html


The difference between cs, ds, ss, es in the register
First, the register in the CPU is used to store the physical address of the data in the memory

cs is a code segment register, generally used to store code;

 Usually used with IP to process the next executed code

cs:IP

Base address: Offset address

The data corresponding to the cs address is equivalent to the code statement in the c language

ds is the data segment register, generally used to store data;

The data corresponding to the ds address is equivalent to the global variable in c language

ss is a stack segment register, generally used as a stack and sp partner;

The data corresponding to the ss address is equivalent to the local variable in c language
ss is equivalent to the first address of the stack segment sp is equivalent to the offset address of the stack segment

es is the extended segment register; 



Stacks Data Structure:
A stack is an array-like data structure in the memory in which data can be stored and removed from a location
called the 'top' of the stack. The data need to be stored is 'pushed' into the stack and data to be retrieved is
'popped' out from the stack. Stack is a LIFO data structure, i.e., the data stored first is retrieved last.


Only words or doublewords could be saved into the stack, not a byte.

The stack implementation has the following characteristics:
 Only words or doublewords could be saved into the stack, not a byte.
 The stack grows in the reverse direction i.e., toward the lower memory address
 The top of the stack points to the last item inserted in the stack; it points to the lower byte of the last word
inserted.
As we discussed about storing the values of the registers in the stack before using them for some use; it can be
done in following way:
; Save the AX and BX registers in the stack
PUSH AX
PUSH BX
; Use the registers for other purpose
MOV AX, VALUE1


### 
It depends on the architecture. To check your own system, use this code from GeeksForGeeks:

```
// C program to check whether stack grows 
// downward or upward. 
#include<stdio.h> 

void fun(int *main_local_addr) 
{ 
    int fun_local; 
    if (main_local_addr < &fun_local) 
        printf("Stack grows upward\n"); 
    else
        printf("Stack grows downward\n"); 
} 

int main() 
{ 
    // fun's local variable 
    int main_local; 

    fun(&main_local); 
    return 0; 
}
```