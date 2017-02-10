assume cs:code

code segment
start:mov al,60

      call showsin
	  
	  mov ax,4c00h
	  int 21h
	  
showsin:
	  jmp short show
	  
	  table dw ag0,ag30,ag60,ag90,ag120,ag150,ag180
	  ag0    db '0',0
	  ag30   db '0.5',0
	  ag60   db '0.866',0
	  ag90   db '1',0
	  ag120  db '0.866',0
	  ag150  db '0.5',0
	  ag180  db '0',0          ;���б�
	
	mov ah,0
     mov bh,0
     mov bl,30
     div bl

     cmp ah,0
     jne ok            ;����������

show:mov ax,0b800h
	 mov es,ax
	 
	  mov al,60
	  mov ah,0
	  mov bx,0
	  mov bl,30
	  div bl                    ;�ò���/30
	  mov ax,table[bx+2]
	  
	  mov es:[12*160+10],ax
	
	 mov si,160*12+10
shows:
     mov ah,cs:[bx+2]
	 cmp ah,0                  ;��⵽0ʱ˵�������������
	 je showret            ;����sin(60)=0.886��5���ֽڣ���������
	 mov es:[si],ah          ;?????/
	 inc bx
	 add si,2
	 jmp short shows

ok:  'you're wrong'	 
showret:ret	 
	  
code ends
end start	  