
```
                            `Base pointer           Stack pointer`
    16 bit real mode:       bp                     sp
    32 bit protected mode:  ebp                    esp
    64 bit mode:            rbp                    rsp
```

- calculate segment to address memory
```
PhysicalAddress = Segment * 16 + Offset
example: 0x7c0:0xff
convert decimal 0x7c0 = 1984 * 16 = 31744
31744 convert hex = 7C00 + FF = (7CFF) PhysicalAddress

```