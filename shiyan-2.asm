assume cs:code

stack segment
   dw 8 dup (0)
stack ends

code segment
start:mov ax,stack
      mov ss,ax
      mov sp,16
      mov ax,4240h
      mov dx,000fh
      mov cx,0ah
     call divdw

divdw:push ax
     push dx
      mov ax,dx
      div cx
     mov dl,al
     mov dh,ah
     mov ah,0 
	 mov dx,65536
     mul dx
;问题：寄存器不够用，答案：：：：
;X/N=int(H//N)*65536+[rem(H/N)*65536+L]/N,int()取商   rem()取余数
divdw:     push ax    ;一般情况下ax用来储存各种变量
      mov ax,dx;做除法的要求
     mov dx,0;为了不影响下面的余数位
     div cx        ;H/N
	 
    mov bx,ax    ;ax和bx=int(h/n),dx=rem(h/n)
    pop ax
    div cx;l/n(16位除数，默认被除数是32位的dx+ax)
    mov cx,dx;取余数
    mov dx,bx;dx默认为是高位寄存器，所以不需要*65536
     ret	