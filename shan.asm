assume  cs:codesg, ss:stack 
data segment 
   db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995' ;�����Ǳ�ʾ21���21���ַ���
    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ;���ϱ�ʾ����21���������dword����
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
    ;���ϱ�ʾ����21���Ա��word����
 data ends
 stack segment
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 stack ends
 table segment 
        db 21 dup ('year summ ne ?? ')
 table ends
 
codesg segment
 start:        mov ax,stack
                 mov ss,ax
                 mov sp,12
                 mov ax,table
                 mov ds,ax ;ds����table�Ķε�ַ
                 mov ax,data
                 mov es,ax ;es����data�Ķε�ַ   
                 mov di,0    
                mov bx,0   ;table �е�ÿ��
                 mov cx,21  ;������ѭ��21��
                 mov si,0 
   s2: mov ax,es:0A8H[si];�ȷŹ�Ա
                 mov word ptr 0Ah[bx],ax
                  add bx,10H
                  add si,2
                  loop s2
                  mov bx,0
                  mov cx,21  ;������ѭ��21��
         s:  push cx
                    mov si,0 
                mov cx,2
         s1: mov ax,es:[di] ;���ÿ�����ֽڴ��
                  mov [bx+si],ax
                  mov ax,es:54H[di];����
                  mov [bx+si+5],ax
                  add si,2
                  add di,2
                  loop s1
                  mov dx,word ptr [bx+7]; �˾�����ļ���
                  mov ax,word ptr [bx+5]
                  div word ptr 0aH[bx]
                  mov 0Dh[bx],ax
                  pop cx
                  add bx,10H
                  loop s
                  mov ax,4c00H
                  int 21H
 codesg ends
 end start
