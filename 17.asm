assume cs:code

data segment
    db 'rgb'
data ends	
code segment
start:
      mov ah,0
	  int 15h
	  
	  mov si,[160*12+12]
	  cmp al,72h
	  je s1
	  cmp al,67h
	  je s2
	  cmp al,62h
	  je s3
	  
	  mov ax,0b800h
	  mov es,ax
	  
	  mov ax,data
	  mov ds,ax
	  
	  mov bx,0
	  push ax
	  push si
	  push bx

s1:   mov ax,ds:[bx]
      mov es:[si],ax
	  mov dl,00000100b
	  mov es:[si+1],dl
	  jmp ok
	  
s2:	  mov ax,ds:[bx+1]
      mov es:[si+2],ax
	  mov dl,00000010b
	  mov es:[si+1+2],dl
	  jmp ok
	  
s3:	  mov ax,ds:[bx+2]
      mov es:[si+4],ax
	  mov dl,00000001b
	  mov es:[si+1+4],dl
	  jmp ok
	  
ok:   pop bx
      pop si
	  pop ax
	  
	  mov ax,4c00h
	  int 21h
	  
code ends
end start	  