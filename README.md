##### 
Data Representation
--- 

Probably the biggest stumbling block most beginners encounter when attempting to
learn assembly language is the common use of the binary and hexadecimal numbering
systems. Many programmers think that hexadecimal (or hex1
) numbers represent absolute proof that God never intended anyone to work in assembly language. While it is true
that hexadecimal numbers are a little different from what you may be used to, their
advantages outweigh their disadvantages by a large margin. Nevertheless, understanding
these numbering systems is important because their use simplifies other complex topics
including boolean algebra and logic design, signed numeric representation, character
codes, and packed data. 

1.0 Chapter Overview
This chapter discusses several important concepts including the binary and hexadecimal numbering systems, binary data organization (**bits**, **nibbles**, **bytes**, **words**, and **double**
**words**), **signed** and **unsigned** numbering systems, arithmetic, logical, **shift**, and **rotate**
operations on binary values, **bit fields** and **packed data**, and the **ASCII character** set. This
is basic material and the remainder of this text depends upon your understanding of these
concepts. If you are already familiar with these terms from other courses or study, you
should at least skim this material before proceeding to the next chapter. If you are unfamiliar with this material, or only vaguely familiar with it, you should study it carefully
before proceeding. All of the material in this chapter is important! Do not skip over any material.

1.1 Numbering Systems
Most modern computer systems **do not represent numeric values using the decimal**
system. Instead, **they typically use a binary or two’s complement numbering system.** To
understand the limitations of computer arithmetic, you must understand how computers
represent numbers.

1.1.1 A Review of the Decimal System
You’ve been using the decimal (base 10) numbering system for so long that you probably take it for granted. When you see a number like “123”, you don’t think about the
value 123; rather, you generate a mental image of how many items this value represents.
In reality, however, the number 123 represents:

``` 1*10^2 + 2 * 10^1 + 3*100 ```

``` 100+20+3 ``` 

Each digit appearing to the left of the decimal point represents a value between zero
and nine times an increasing power of ten. Digits appearing to the right of the decimal
point represent a value between zero and nine times an increasing negative power of ten.
For example, the value 123.456 means:
```1*10^2 + 2*10^1 + 3*10^0 + 4*10^-1 + 5*10^-2 + 6*10^-3```
``` 100 + 20 + 3 + 0.4 + 0.05 + 0.006 ```

STOP IN 1.1.2
```

```
#####