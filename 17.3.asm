assume cs:code

data segment
    table dw'0,1,2'
data ends
	
code segment
start:mov ah,0
      int 16h
     
	 cmp ah,2
	 ja sret
	 mov bl,ah
	 mov bh,0
	 add bx,bx
	 jmp word ptr table[bx]      ;索引地址，执行输入功能号对应的功能

0:   cmp ah,1ch
     jne ??
	 mov si,0
	 mov cx,;字符串长度
   s:push ??
	 call 2
	 inc si
	 loop s
	 
1:	 cmp ah,0eh
     jne s
	 pop ??
	 
2:   mov ax,0b800h
     mov es,ax
     sub dh,1
	 mov ax,0ah
     mul dh
	 add dh,dl
	 add dh,2
	 mov bx,dh
	 mov es:[bx+si],???
	 ret
	 
code ends
end start	 