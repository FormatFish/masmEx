assume cs:code
code segment
 start: mov di,160*12+2*30   
        mov al,0

        out 70h,al

        in al,71h

 

        mov ah,al

        mov cl,4

        shr ah,cl

        and al,00001111b

 

        add ah,30h

        add al,30h

 

        mov byte ptr es:[di],ah

        mov byte ptr es:[di+2],al
        mov ax,4c00h
        int 21h
 code ends
 end start