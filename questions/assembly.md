First of all, you have to understand that there is a specification for all these things. These specifications differ from one assembly language to another and from one operating system to the other.


How much stack usage is too much?

It depends on your operating system. On Windows, the typical maximum size for a stack is 1MB, whereas it is 8MB on a typical modern Linux, although those values are adjustable in various ways. If the sum of your stack variables (including low-level overhead such as return addresses, stack-based arguments, return value placeholders and alignment bytes) in the entire call stack exceeds that limit, you get a stack overflow, which typically takes down your program without any chance at recovery.
https://softwareengineering.stackexchange.com/questions/310658/how-much-stack-usage-is-too-much
