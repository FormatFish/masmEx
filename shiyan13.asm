assume cs:code

data segment
     db "welcome to masm!",0
data ends

code segment
start:mov ax,cs
      mov ds,ax
      mov bx,offset xian
	  mov ax,0
	  mov es,ax
	  mov si,200h
	  mov cx,offset s-offset s1;³¤¶È
	  cld
	  rep movsb
	  
	  mov ax,0
	  mov es,ax
	  mov word ptr es:[7ch*4],200h
	  mov word ptr es:[7ch*4+2],0
	  
xian: mov ax,0b800h
	  mov es,ax
	  mov di,10*0a0h+10
	  mov cl,2
s:	  mov dl,cl
      mov al,ds:[bx]
	  mov es:[di],al
	  mov es:[di+1],cl
	  mov cl,al
	  mov ch,0
	  jcxz ok
	  inc bx
	  add di,2
	  mov cl,dl
	  jmp short s
	  
ok:  mov ax,4c00h
     int 21h

s1:  nop

code ends

end start	 