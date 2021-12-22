- Shellcode is simply a series of opcodes,

- typically stored in a C character array. The term shellcode derives from the fact that the series of opcodes are the instructions necessary to execute a shell, such as /bin/sh or cmd.exe.

```
return 0;
```

 to generate shellcode for that particular C level instruction, we would simply use the opcodes for that instruction, which are ```0xC9, 0x31, 0xC0, 0xC9; ```if we put it into a C program it would probably look like this:


```
 unsigned char shellcode[] = “\xc9\x31\xc0\xc9”;
```


int foo() {
  return 10;
}


The shellcode
The output of this function will look something similar to this:

ex.o:     file format elf64-x86-64


Disassembly of section .text:

```
0000000000000000 <foo>:
   0:	b8 0a 00 00 00       	mov    $0xa,%eax
   5:	c3                   	retq


```

```
#include <stdio.h>

unsigned char code[] = "\xb8\x0a\x00\x00\x00\xc3";

int main(int argc, char **argv) {
  int foo_value = 0;

  int (*foo)() = (int(*)())code;
  foo_value = foo();

  printf("%d\n", foo_value);
}
```