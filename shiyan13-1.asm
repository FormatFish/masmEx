assume cs:code 
stack segment
    db 2 dup (0)
stack ends

code segment
start:mov ax,stack
      mov ss,ax
      mov sp,2
      
     mov ax,cs
     mov ds,ax
   
     mov ax,0
     mov es,ax

	 mov bx,int9;开始标志
	 mov si,200h
     mov cx,offset ok-offset int9;changdu

     cld
     rep movsb	 
	 
	 push es:[9*4]
	 pop ds:[0]
	 push es:[9*4+2]
	 pop ds:[2]       ;将原来int 9地址存放
	 
	 sti
	 mov ax,0
	 mov es,ax
	 mov byte ptr es:[9*4],200h
	 mov byte ptr es:[9*4+2],0
	 
	 int9:                ;新中断
	 push ax
	 push bx
	 push cx
	 push ds
	 push es
	 
	 in al,60h
	pushf
	 pushf
	  pop bx
      and bh,11111100b
       push bx
     popf
      call dword ptr ds:[0]  	  ;对int指令进行模拟
	  
	  cmp al,3bh
      jne ok
     mov ax,0b800h
	 mov es,ax
	 mov bx,1
	 
	 mov cx,2000
	 s:
	 inc byte ptr es:[bx]
	 add bx,2
	 loop s
	 
	 ok:
	 pop es
	 pop ds
	 pop cx
	 pop bx
	 pop bx
	 pop ax
	 iret
	 
code ends

end start	 