assume cs:code

data segment
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'      ;四字节合体
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
data ends

table segment
    db 21 dup ('year summ ne ??')       ;注意！！！1
table ends

code segment
start:mov bx,0
      mov si,0
	  mov di,0                                ;由于年份与收入都是4字节数据，故由bx递增。而雇员是2字节数据，构视si递增  ..bi则负责列数
	  
	  mov ax,data
	  mov ds,ax
	  
	  mov ax,table
	  mov es,ax
	  
	  mov cx,21
s:	  mov al,[bx]
      mov es:[di],al                     ;db为一个字节
      mov al,[bx+1]
      mov es:[di+1],al
      mov al,[bx+2]
      mov es:[di+2],al
      mov al,[bx+3]
       mov es:[di+3],al
                       					   ;0-53h是年份 54h-0a7h存放收入 0a8h-0d1h存放雇员 
	  mov ax,54h[bx]                      ;第一个‘年收入’的段及地址为54h
	  mov dx,56h[bx]
	  mov es:5h[di],ax
	  mov es:7h[di],dx
	  
	  mov ax,0a8h[si]
	  mov es:0ah[di],ax	  ;雇员
	  
	  div word ptr es:0a8h[di]
	  mov es:0dh[di],ax
	  
	  add bx,4
	  add si,2
	  add di,16
	  loop s
	 
	  mov ax,4c00h
       int 21h
code ends

end start	   