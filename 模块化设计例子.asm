assume cs:code 

data segment
   dw 1,2,3,4,5,6,7,8
   dd 0,0,0,0,0,0,0,0
data ends

code segment
start:mov ax,data
     mov ds,ax
     mov si,0    ;ds:siָ���һ��word��Ԫ
     mov di,16   ;ds:diָ��ڶ���dword��Ԫ

     mov cx,8
s:   mov bx,[si]
     call cude
	 mov [di],ax
	 mov [di+2],dx
	 add si,2
	 add di,4
	 
	 mov ax,4c00h
	 int 21h
	 
cude:mov ax,dx
	 mul dx
	 mul dx
	 ret
	 