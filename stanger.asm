assume cs:code
code segment

    mov ax,4c00h
	int 21h
	
start:mov ax,0
   s:nop
     nop

     mov di,offset s
     mov si,offset s2
     mov ax,cs:[si]
     mov cs:[di],ax    ;段寄存器cs中储存的是指令，即：offset+标号

s0  :jmp short s

s1:  mov ax,0
     int 21h
     mov ax,0

s2: jmp short s1 ;执行完后跳至start,而后再向上偏移10个字节
     nop

code ends
end start	 