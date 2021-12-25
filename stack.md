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