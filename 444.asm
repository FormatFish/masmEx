assume cs:code
code segment
 start: mov ax,0b800h
        mov es,ax
 
        mov di,0ah*0ch+0ch   
        mov al,0

        out 70h,al

        in al,71h

 

        mov ah,al

        mov cl,4

        shr ah,cl

        and al,00001111b

 

        add ah,30h

        add al,30h

 
         mov bl,2
        mov es:[di],ah
        mov es:[di+1],bl
        mov es:[di+2],al
        mov es:[di+3],bl
		mov ax,4c00h
        int 21h
 code ends
 end start
      
;我直接复制了一下答案的。
