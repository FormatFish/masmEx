assume cs:code
code segment
        start:        mov ax,0b800H               ;�Դ���ʼ��ַ
                        mov ds,ax
                        mov dx,0AC65H              ;��ĸE����ʽ
                        mov ds:[280H],dx            ;��λ������
                        XOR ax , ax
						mov ah ,1
						int 21h;��?
                q:        mov ax,4c00H
                        int 21H                
code ends
end start