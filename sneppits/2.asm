;https://www.jdoodle.com/compile-assembler-nasm-online/
section	.text
   global start        ;must be declared for using gcc
	
start:	                ;tell linker entry point
   mov ecx,100  ;
   mov eax, '1' ;
l1:

   mov [num], eax ;1 to this address reference
   mov eax, 4 ;sys_write
   mov ebx, 1 ;to stdout
   push ecx ;to stack
	
   mov ecx, num ;100       
   mov edx, 10   ;DX is known as the data register. It is also used in input/output operations.
   int 0x80 ;requests a service from the kernel of the operating system on which it is executed.
	
   mov eax, [num]
   
   sub eax, '0' ;The subtraction sub eax, '0' converts the character in AL into the corresponding number 0-9. Nothing more.
   inc eax ;1+1 = 2
   add eax, '0' ;?
   pop ecx ;counter
   
   loop l1
	
   mov eax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel
   
section	.bss
num resb 1