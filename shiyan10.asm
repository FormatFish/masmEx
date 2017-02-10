assume cs:codesg,ds:data,es:table

 

data segment

        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'

        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'

        db '1993','1994','1995'

        ;以上是表示21年的21个字符串,4字节0~53h

 

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514

        dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

        ;以上是表示21年公司总收的21个dword型数据，4字节54~0a7h

 

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226

        dw 11542,14430,45257,17800

        ;以上是表示21年公司雇员人数的21个word型数据，2字节0a8~0d2h

data ends

 

table segment

        db 21 dup('year summ ne ?? ')

table ends

 

codesg segment
start:mov ax,data
      mov ds,ax
	  
	  mov ax,0b800h
	  mov es,ax
	  
	  mov bx,0
	  mov si,0
	  mov di,0
	  mov dx,0
	  
s:	     mov al,[bx]

         mov es:[di],al

                mov al,[bx+1]

                mov es:[di+1],al

                mov al,[bx+2]

                mov es:[di+2],al

                mov al,[bx+3]

                mov es:[di+3],al
        ;输入地一个年份
	  
	  mov ax,ds:54h[si]
	  mov es:5[bx],ax           ;输入第一个收入
	  
	  mov ax,ds:0a8h[di]
	  mov es:0ah[bx],ax
	  
	  mov ax,ds:54h[si]
	  mov dx,ds:54h[si+2]
	  
	  mov ax,ds:0a8h[si]
	  mov es:0dh[di],ax
	  
	  div word ptr es:0a8h[di]
	  mov es:0ch[si],ax
	  
	  add bx,0a0h
	  add si,4
	  add di,2
	  loop s
	  
	  mov ax,4c00h
	  int 21h
codesg ends
end start	  