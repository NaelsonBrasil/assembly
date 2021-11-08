https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm


https://www.geeksforgeeks.org/general-purpose-registers-8086-microprocessor/

others things i should know about assembly language beyond system call?

``` 
section	.text
    extern printf   ; If you need other functions, list them in a similar way
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point

  
   mov eax, 4       ;sys_write
   mov ebx, 1       ;ebx 
   mov ecx, msg     ;ecx = "xxxxxxxxxxxxx"
   mov edx, len       ;ecx new array[edx] = "xxxxxxxxxxxxx"
  
   int 80h
   mov eax, 1	    ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data

msg	db	'Hello, world!hhhhhhhhhhhhhh'	;our dear string
len	equ	$ - msg			;length of our dear string
``` 


@Kaunda Well, when you put the length in ecx and the pointer to the message into edx, the kernel still thinks that ecx contains the pointer to the message and edx contains the length of the message. A length interpreted as a pointer points nowhere useful and a pointer interpreted as a number is usually a very large number, so the kernel returns the error EFAULT meaning “invalid address” as @prl already explained. It's your job to turn the kernel's error codes into error messages. The kernel itself is rarely concerned with this (except under rare circumstances). 


### Since you know about basic programming languages things will get a lot easier Wink
https://forum.cheatengine.org/viewtopic.php?t=548644&sid=f9f9a83787ba946575dda00193f3b2d3

well, written programms (except for java programs) compile into assembler. Assembler is a thery abstract language. Everything that assembler knows is:
1: a universal stack. you can access it with the push and pop commands
2: the program memory. Simply, a huge block of memory that is directly accessed using the adresses. Imagine it as if you put every variable into a huuuuuge single array
3: the so-called registers. Imagine it as a bunch of local variables. As for the registers there are:
- eax, ebx, ecx and edx which are 32 bit integers. They are generally used for everything. In modern compilers, there is a guideline that edx may not be altered by a function call while the other 3 registers may have a completely different value after a function call. (eg, eax is used as a return value quite often)
- esi and edi: usually used with string operations
- ebp and esp: these registers are used with the universal stack where ebp is the beginning of the stack and esp the top of it.
- eip: doesnt even matter. points at the next instruction that is executet. nothing you should worry about Wink

So, the registers are used to read and write from/into memory. Most of the commands in assembler can only be used with those registers. For example, if you have the "int i" and write something like "i += 5", in assembler it might look like this:
Code:
``` 
//assuming 0x1234 is the adress in this huge memory block where i is stored (could be anywhere)
mov eax, [1234] //moves the value which is standing at the adress "0x1234" (note: always hex) into eax
add eax, 5 //adds 5 to it
mov [1234], eax //moves the new value back to the adress
``` 

As you can see, you need those registers for any kind of calculation and thus, basically for everything.

Now about those offsets:
Assuming basic c++ knowledge (its so mutch clearer than java could ever be ^.^) i just give you this peace of code:
Code:
``` 
struct unitStruct {
int health;
int ammo;
}
//somwhere in your code
unitStruct* unitPtr = new unitStruct;
``` 
As you might know, you do now have a pointer pointing at a unitStruct structure. When you create sutch a structure, the int health and the int ammo will be put into the huge memory block - next to each other. No space in between them. It would look like this:
Code:
``` 
0x0000fab0: 64 00 00 00
0x0000fab4: 0a 00 00 00
``` 

(note that the numbers are in the hexadecimal system; thus 00 is exactly one byte)
Now, when you access the ammo or the health
Code:
unitPtr->health = 100;
unitPtr->ammo = 10;

You obviously use the pointer to do so. The pointer will point to the start of the structure (using the upper example, to 0x00fab0). Now knowing that the variables are always in the same order, how do you access the ammo? As we know, its always 4 bytes behind the first variable. Thus, we add a 4 to the pointer. Since we cant actually add 4 to the value of the pointer, we need the registers (eax etc) again. This is what it will look like in assembler:
Code:
``` 
mov eax, 0000fab0 //load the address into eax (you do that using the pointer, but for sake of easiness we assume that its on a static position)
mov [eax+4],a
``` 
now we have the situation that we have in the tutorial: you have the start adress of the structure (eax) and add a 4 to it to get to the ammo. The same thing happens with classes (which are basically structs) or if you have an array.

Now so far about integer offsets. But why do you have a register as offset? well, that for example happens if you iterate through an array using a for loop. Given code:
Code:
``` 
for(int i = 0; i < 10; i++) {
    someArray[i] = 5;
}
``` 

As for an array, you can imagine it as a struct with a lot of variables of the same type in it. As for this, you, again, access them using an offset. Just this time, you cant just write +4 or something like that, since you dont access one single variable, but the first 10 inside this array. Ever wondered why the first index of an array is 0 and not 1? thats because the index of an array is basically the offset (multiplied by the size of a single element of corse, else we would jump one byte further instead of the 4 bytes that an integer holds and read some mix of element 1 and element 2). As for the code snipped, the offset is 0 at first, than 1, than 2 etc. It has to change. As for changing values, you need to use a register (else you cant calculate nothing). Thus, in sutch a situation, the offset is not a static number, but another register. The sniped could look like this:

Code:
``` 
[... more code ...]
mov eax, 0x1234 //assuming 1234 is the start address of the array
mov ebx, 0 //we start at the first index: 0
``` 

``` 
mov [eax+ebx*4],5 //moves 5 into the calculated adress. note the *4; the size of an integer is 4 bytes, not only 1.
add ebx, 1 //to the next index
cmp ebx, 10
jb <back to the mov[eax+ebx*4]>
[... more code ...]
``` 

here you use ebx to count the index; ebx here is the int i in the code sniped. the cmp is simply a if(ebx < 10) repeat it
You see something like [eax+ebx*4] quite often. However, you sniped might be more complicated, the 4 might allready be calculated into the ebx (add ebx,4 instead of add ebx,1) or the variable you were finding is just a single byte.

Now using that knowledge, heres the code from your screenshot:
Code:
``` 
mov [ecx+ebx],eax
``` 

The values are written below:
``` 
eax = 8
ebx = 8
ecx = C419588
And the "value of the pointer needed" is C419588. Note that this is exactly the value of ecx. Because it its the address of the array, and ebx is the index (mostlikely 8 or 2, depending on if it holds integer or bytes). eax is the value written into this variable.
``` 
Well, read it a few times. Hope you understand most of it.
As for the name, as long as you cant play it online, mentioning the name should be fine. Else, if you want further help, information like "rpg" or "shooter", what kind of value you were searching for (ammo, health, whatever) etc would be quite helpful.


### Explain the concept of a stack frame in a nutshell


If you understand stack very well then you will understand how memory works in program and if you understand how memory works in program you will understand how function store in program and if you understand how function store in program you will understand how recursive function works and if you understand how recursive function works you will understand how compiler works and if you understand how compiler works your mind will works as compiler and you will debug any program very easily

Let me explain how stack works:

First you have to know how functions are represented in stack :

Heap stores dynamically allocated values.
Stack stores automatic allocation and deletion values.


https://stackoverflow.com/questions/1395591/what-is-exactly-the-base-pointer-and-stack-pointer-to-what-do-they-point
https://stackoverflow.com/questions/1395591/what-is-exactly-the-base-pointer-and-stack-pointer-to-what-do-they-point
ESP is the current stack pointer, which will change any time a word or address is pushed or popped onto/off off the stack. EBP is a more convenient way for the compiler to keep track of a function's parameters and local variables than using the ESP directly.

Generally (and this may vary from compiler to compiler), all of the arguments to a function being called are pushed onto the stack by the calling function (usually in the reverse order that they're declared in the function prototype, but this varies). Then the function is called, which pushes the return address (EIP) onto the stack.

Upon entry to the function, the old EBP value is pushed onto the stack and EBP is set to the value of ESP. Then the ESP is decremented (because the stack grows downward in memory) to allocate space for the function's local variables and temporaries. From that point on, during the execution of the function, the arguments to the function are located on the stack at positive offsets from EBP (because they were pushed prior to the function call), and the local variables are located at negative offsets from EBP (because they were allocated on the stack after the function entry). That's why the EBP is called the Frame Pointer, because it points to the center of the function call frame.

Upon exit, all the function has to do is set ESP to the value of EBP (which deallocates the local variables from the stack, and exposes the entry EBP on the top of the stack), then pop the old EBP value from the stack, and then the function returns (popping the return address into EIP).

Upon returning back to the calling function, it can then increment ESP in order to remove the function arguments it pushed onto the stack just prior to calling the other function. At this point, the stack is back in the same state it was in prior to invoking the called function.