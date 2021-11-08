section	.text
	global _start       ;must be declared for using gcc
_start:  ;tell linker entry point

    push    ebp
    mov     ebp,esp
    
    push    eax          ;[bp-2]
    push    ebx          ;[bp-4]
    push    ecx          ;[bp-6]
    push    edx          ;[bp-8]

    mov     eax, 4              ;sys_write
    mov     ebx, 1              ;to stdout
    add     ecx, msg             ;add 47 for ASCII numbers
    mov     edx, 1              ;double word = 2 bytes
    int     0x80

    mov     esp,ebp       ;restore sp
    pop     ebp          ;restore bp
    
section	.data

msg	db	35h,0xa	;our dear string
len	equ	$ - msg			;length of our dear string