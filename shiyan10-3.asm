assume cs:code,ds:data

data segment
        db 10 dup (0)
data ends

code segment

start:
        mov ax,12666
		
        mov bx,data       ;ds:siָ���ַ������׵�ַ
        mov ds,bx
        mov si,0

        call dtoc         ;dtoc�ӳ���ʵ�ֽ�word������ת��ΪASCIIma�ַ������洢

        mov dh,8          ;��ʼ����ӡ��λ��
        mov dl,3
        mov cl,0cah

        call show_str     ;��ʼ��ӡ�ַ���

        mov ax,4c00h
        int 21h

dtoc:  ;��ֵ��ʾ���ӳ�����
        push dx
        push cx
        push ax
        push si
        push bx           ;Ϊ�˲��ı�������ĳ�ֵ

        mov bx,0          ;bx���ӳ������������λ������ջ����ʱ����޸ĺ���ַ�
		
s1:     mov cx,10d        ;d��ʾʮ����,cx׼������
        mov dx,0

        div cx            ;����ʮ
        mov cx,ax         ;�õ����̸�ֵ��cx

        jcxz s2           ;����Ϊ0������s2

        add dx,30h        ;����������30h�õ���Ӧ��ASCII��
        push dx
        inc bx

        jmp short s1

s2:     add dx,30h       ;����Ϊ0��ʱ������Ϊ��λ
        push dx
        inc bx           ;�ٽ���һ��ջ����(���䵱"��Ϊ���������Ϊ��"ʱ�����)

        mov cx,bx        ;�ܹ���bxλ��ջ�ˣ�����ѭ������Ϊbx
        mov si,0

s3:     pop ax           ;s3ʵ�ֽ�ջ�е��������γ�ջ�ŵ�ָ���ڴ���

        mov [si],al
        inc si

        loop s3

okay:   pop bx
        pop si
        pop ax
        pop cx
        pop dx

        ret   ;��ֵ��ʾ���ӳ��������

 

show_str:  ;��ʾ�ַ������ӳ����Ѿ��ڵ�һ����˵�����ڴ˲���׸����

        push bx
        push cx
        push si

        mov al,0A0h
        dec dh
        mul dh
		
        mov bx,ax
        mov al,2
        mul dl
		
        sub ax,2
        add bx,ax

        mov ax,0B800h
        mov es,ax

        mov di,0
        mov al,cl
        mov ch,0

s:      mov cl,ds:[si]

        jcxz ok

        mov es:[bx+di],cl
        mov es:[bx+di+1],al
		
        inc si
        add di,2

        jmp short s

ok:     pop si
        pop cx
        pop bx
		
        ret

code ends

end start

