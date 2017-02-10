assume cs:code

data segment
    db 'conversation',0
data ends

code segment
start:mov ax,cs
      mov cs,ax
      mov si,offset nr
     mov ax,0
     mov es,ax
     mov di,200h
     mov cx,offset nrend-offset nr
     cld
     rep movsb     ;以上9句为中断安装例硉   条件：相关寄存器，cx长度，设置方向
	 
     mov word ptr es:[7ch*4],200h
     mov word ptr es:[7ch*4+2],0
      ;以上两句为设置中断向量

    mov ax,data
     mov ds,ax
	 mov si,0
     mov ax,0b800h
     mov es,ax
     mov di,12*180

s:   cmp byte ptr [si],0
     je ok
      mov al,[si]
      mov es:[di],al
      inc si
      add di,2
      mov bx,offset s-offset ok

      int 7ch        ;欲跳至s处，必须模拟jmp near s的指令执行方法

ok:   mov ax,4c00h
     int 21h

nr:    push bp
     mov bp,sp
     add [bp+2],bx

mret:  pop bp

     iret

nrend:  nop

code ends

end start	 