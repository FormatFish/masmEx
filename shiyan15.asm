assume cs:code

stack segment
  db 128 dup (0)
stack ends

data segment
  dw 0,0
data ends

code segment
start:mov ax,stack
      mov ss,ax
      mov sp,128

     mov ax,data
     mov ds,ax

     mov ax,0
     mov es,ax

	        
     push es:[9*4]
     pop ds:[0]
     push es:[9*4+2]
     pop ds:[2]            ;��int 9ԭ���ĵ�ַ���棬��ֹ�ƻ������ж�����

	  cli             ;;����tf=0����ֹ�����õ�ַ�г������int 9
     mov word ptr es:[9*4],offset int9
     mov es:[9*4+2],cs                 ;��Ϊ�Լ����������ĵ�ַ

     mov ax,0b800h
     mov es,ax
      mov ah,'a'
s:   mov es:[160*12+40*2],ah
     call delay
     inc ah
     cmp ah,'z'                         ;��ͬһ��ַ�����롮a~z��
      jna s

     mov ax,0
     mov es,ax

     push ds:[0]
     pop es:[9*4]
     push ds:[2]
     pop es:[9*4+2]               ;��int 9ԭ���ĵ�ַ�ָ�

     mov ax,4c00h
     int 21h

delay: push ax
       push dx
       mov dx,1000h
       mov ax,0
s1:    sub ax,1
       sbb dx,0
        cmp ax,0
       jne s1
       cmp dx,0
       jne s1         ;�ӳ�ս��=��cpuѭ��10000000��
       pop dx
       pop ax
      ret

   ;--------����Ϊ�µ�9���ж�����-----------------
int9:  push ax      ;������������������ע������ӳ����ϰ��
      push bx
       push es

      in al,60h

      pushf
      pushf
      pop bx
      and bh,11111100b
       push bx
     popf
      call dword ptr ds:[0]    ;��intָ�����ģ��

    cmp al,1              ;ESCɨ����Ϊ01
     jne int9ret             ;�˴�ִ��;����esc����ı���ɫ

     mov ax,0b800h
     mov es,ax
     inc byte ptr es:[160*12+40*2+1]    ;�ı���ɫ

intret:pop es
      pop bx
       pop ax
      iret

code ends

end start	  