assume cs:code
code segment
        start:        mov ax,0b800H               ;显存起始地址
                        mov ds,ax
                        mov dx,0AC65H              ;字母E及样式
                        mov ds:[280H],dx            ;定位第四行
                        XOR ax , ax
						mov ah ,1
						int 21h;输?
                q:        mov ax,4c00H
                        int 21H                
code ends
end start