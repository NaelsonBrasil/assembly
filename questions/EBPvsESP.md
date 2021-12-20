What is between ESP and EBP?
https://stackoverflow.com/questions/15020621/what-is-between-esp-and-ebp

ESP is the current stack pointer. EBP is the base pointer for the current stack frame.

When you call a function, typically space is reserved on the stack for local variables. This space is usually referenced via EBP (all local variables and function parameters are a known constant offset from this register for the duration of the function call.) ESP, on the other hand, will change during the function call as other functions are called, or as temporary stack space is used for partial operation results.

Note that most compilers these days have an option to reference all local variables through ESP. This frees up EBP for use as a general purpose register.

In general, when you look at the disassembly code at the top of a function you'll see something like this:

push EBP
mov  EBP, ESP
sub  ESP, <some_number>
So EBP will point to the top of your stack for this frame, and ESP will point to the next available byte on the stack. (Stacks usually - but don't have to - grow down in memory.)

