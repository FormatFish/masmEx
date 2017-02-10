assume cs:code

data segment
 db 'welcome to masm!',0
data ends

stack segment
   db 8 dup (0)
   stack ends
   
code segment   
start:mov dh,8
    mov dl,3
   mov cl,2
    mov ax,data
	mov ds,ax
	mov si,0
	mov ax,stack
	mov ss,ax
	mov sp,8
	call s
	
	mov ax,4c00h
	int 21h
	
  s: mov ax,0b800h
     mov es,ax
      mov al,160
	  sub dh,1
	  mul dh
	  mov di,ax
	  mov al,ds:[si]
	  mov es:[di+dl-1],al
	  mov es:[di+dl],cl
	  push cl
     mov cl,ds:[si]
      mov ch,0
      jcxz s1
	  inc si
	  add dl,2
	  pop cl
	 jmp short s
s1；ret	 
code ends
end start
==========================================
;关键是不知道如何处理行数和列数与显存地址的对应关系
     mov al,0a0h;显存中一行有80*2个字节
	 dec dh
	 mul dh
	 mov bx,ax
	 mov al,2
	 mul dl
	 sub ax,2
	 add bx,ax;bx=ax+bx,行数和列数相加组成地址！！！！！！！！！！！！！！