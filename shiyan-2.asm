assume cs:code

stack segment
   dw 8 dup (0)
stack ends

code segment
start:mov ax,stack
      mov ss,ax
      mov sp,16
      mov ax,4240h
      mov dx,000fh
      mov cx,0ah
     call divdw

divdw:push ax
     push dx
      mov ax,dx
      div cx
     mov dl,al
     mov dh,ah
     mov ah,0 
	 mov dx,65536
     mul dx
;���⣺�Ĵ��������ã��𰸣�������
;X/N=int(H//N)*65536+[rem(H/N)*65536+L]/N,int()ȡ��   rem()ȡ����
divdw:     push ax    ;һ�������ax����������ֱ���
      mov ax,dx;��������Ҫ��
     mov dx,0;Ϊ�˲�Ӱ�����������λ
     div cx        ;H/N
	 
    mov bx,ax    ;ax��bx=int(h/n),dx=rem(h/n)
    pop ax
    div cx;l/n(16λ������Ĭ�ϱ�������32λ��dx+ax)
    mov cx,dx;ȡ����
    mov dx,bx;dxĬ��Ϊ�Ǹ�λ�Ĵ��������Բ���Ҫ*65536
     ret	