assume cs:code

code segment
start:	
		mov ax, cs
		mov ds, ax
		mov si, offset do0		;����ds:siָ��Դ��ַ
		mov ax, 0
		mov es, ax
		mov di, 200h			;����es:diָ��Ŀ�ĵ�ַ
		mov cx, offset do0end - offset do0		;����cxΪ���䳤��
		cld				        ;���ô��䷽��Ϊ��
		rep movsb
		
		mov ax, 0               ;�����ж�������
		mov es, ax
		mov word ptr es:[0*4], 200h
		mov word ptr es:[0*4+2], 0

      	mov ax,4c00h
      	int 21h

do0:    mov ax, cs
      	mov ds, ax
      	mov si, 202h			;����ds:siָ���ַ���

      	mov ax, 0b800h
      	mov es, ax
		mov di, 12*160+36*2		;����es:diָ���Դ�ռ���м�λ��

        mov cx, 21				;����cxΪ�ַ�������
	s:	mov al, [si]
      	mov es:[di], al
		mov al, 02h             ;������ɫ
		mov es:[di+1], al
        inc si
        add di,2        
      	loop s

      	mov ax, 4c00h
      	int 21h
do0end:	nop

code ends
end start
