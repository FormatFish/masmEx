assume cs:code

data segment
  db "Beginner's All-purpose Sysbolic Instruction Code.",0
data ends

code segment
start:mov ax,data
      mov ds,ax
      mov si,0
      call letterc

     mov ax,4c00h
     int 21h

letterc:push ax
        push si

		mov cx,0
     s:	mov ax,[si]
        cmp ax,97
         jnb ok
        jmp short s2
    ok:and ax,1011111b

     s2: mov cx,ax
        jcxz s1
		mov [si],ax
		inc si
		jmp short s 
s1:pop si
   pop ax
   ret   
   
code ends
end start   