```
int main(int a, int b, long int c, long d, long e) {
    
    long int add = 200;
    long int add2 = 200;
    long int add3 = 200;
    int add4 = 200;
    int add6 = 200;

    printf("a", &a);
    return 0;
}
```

```

.LC0:
  .string "a"
main:

  push rbp ;Preserve current frame pointer
  mov rbp, rsp ;Create new frame pointer pointing to current stack top
  sub rsp, 64 ;allocate 48 bits worth of locals on stack.
 
  ;QWORD=8bytes, DWORD=bytes

  mov DWORD PTR [rbp-36], edi ;first parameter ;address 0xFFFFFFFFFFFFFFDC
  mov DWORD PTR [rbp-40], esi ;second parameter
  mov QWORD PTR [rbp-48], rdx ;third parameter
  mov QWORD PTR [rbp-56], rcx ;fourth parameters
  mov QWORD PTR [rbp-64], r8  ;fifth parameters
  mov QWORD PTR [rbp-8], 200 ; 200=0xC8 address = 0xFFFFFFFFFFFFFFF8
  mov QWORD PTR [rbp-16], 200
  mov QWORD PTR [rbp-24], 200
  mov DWORD PTR [rbp-28], 200
  mov DWORD PTR [rbp-32], 200
  
  lea rax, [rbp-36]
  mov rsi, rax
  mov edi, OFFSET FLAT:.LC0
  mov eax, 0
  call printf
  mov eax, 0
  leave
  ret
  
```
