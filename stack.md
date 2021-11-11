Most function prologs look something like:

``` 
push ebp      ; Preserve current frame pointer
mov ebp, esp  ; Create new frame pointer pointing to current stack top
sub esp, 20   ; allocate 20 bytes worth of locals on stack.
``` 


### Can someone provide a visualization or detailed flow of the stack frame in this Assembly MIPS code block?
- To visualize, first we need to establish the direction of visualization, usually whether up or down.  Both are correct, but one may be - harder to read than the other.


https://faculty.kfupm.edu.sa/COE/shazli/coe205/Help/asm_tutorial_09.html