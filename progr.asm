assume cs:code

data segment
    db "welcome to masm!"
data ends

code segment
start:mov ax,cs
      mov ds,ax
      mov ax,0
      mov es,ax
	  mov bx,offset do0
	  mov si,200h
	  mov cx,offset do0-offset s2;³¤¶È
	  cld
     rep movsb	  
	 
	 mov ax,0
	 mov es,ax
	 mov word ptr es:[0*4],200h
	 mov word ptr es:[0*4+2],0h

	 
do0: mov dx,0
	 mov dl,02h
	 mov ax,data
	 mov ds,ax
	 mov ax,0b800h
	 mov es,ax
	 
	 mov cx,16
	 mov si,12*0ah+0ah
  s1:mov ax,ds:[bx]
	 mov es:[si],ax
	 mov es:[si+1],dl
	 inc bx
	 add si,2
	 loop s1
	 

     
	 mov ax,4c00h
	 int 21h
  s2: nop
code ends

end start  