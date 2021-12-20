https://stackoverflow.com/questions/1856320/purpose-of-esi-edi-registers
https://www.cs.uregina.ca/Dept/manuals/Manuals/7Language/7_9_8086/7_9Assembly.html

SI = Source Index
DI = Destination Index

As others have indicated, they have special uses with the string instructions. For real mode programming, the ES segment register must be used with DI and DS with SI as in

``` 

movsb  es:di, ds:si

``` 

SI and DI can also be used as general purpose index registers. For example, the C source code

``` 

srcp [srcidx++] = argv [j];

``` 

compiles into

``` 
8B550C         mov    edx,[ebp+0C]
8B0C9A         mov    ecx,[edx+4*ebx]
894CBDAC       mov    [ebp+4*edi-54],ecx
47   

``` 

// Type your code here, or load an example.
int square(int num) {

}


OUT ASM 
   push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi <-------------- EDI
        nop
        pop     rbp
        ret
``` 


where ebp+12 contains argv, ebx is j, and edi has srcidx. Notice the third instruction uses edi mulitplied by 4 and adds ebp offset by 0x54 (the location of srcp); brackets around the address indicate indirection.

