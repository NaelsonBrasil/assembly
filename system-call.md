https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm

others things i should know about assembly language beyond system call?

``` 
section	.text
    extern printf   ; If you need other functions, list them in a similar way
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point


   mov eax, 4
   mov ebx, 2
   mov ecx, msg
   mov edx, 1
   int 80h
   mov	eax, 1	    ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data

msg	db	'Hello, world!',0xa	;our dear string
len	equ	$ - msg			;length of our dear string
``` 