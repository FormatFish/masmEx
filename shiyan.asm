assume cs:code,ds:data

data segment
    db "welcome to masm!" 
data ends

code segment
start:mov ax,data
      mov ds,ax
      mov bx,0
	  
	  mov ax,0b872h
	  mov es,ax
	  mov si,0ah
	  
	  mov cx,16
s:	  mov al,ds:[bx]
	  mov es:[si],al
	  mov al,00000010b
	  mov es:[si+1],al
	  add si,2
	  inc bx
	  loop s
	  
	  mov ax,4c00h
	  int 21h
code ends

end start	  