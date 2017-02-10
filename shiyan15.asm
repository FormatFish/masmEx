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
     pop ds:[2]            ;将int 9原来的地址保存，防止破坏其他中断例程

	  cli             ;;设置tf=0，防止在设置地址有程序调用int 9
     mov word ptr es:[9*4],offset int9
     mov es:[9*4+2],cs                 ;改为自己所编译程序的地址

     mov ax,0b800h
     mov es,ax
      mov ah,'a'
s:   mov es:[160*12+40*2],ah
     call delay
     inc ah
     cmp ah,'z'                         ;在同一地址处输入‘a~z’
      jna s

     mov ax,0
     mov es,ax

     push ds:[0]
     pop es:[9*4]
     push ds:[2]
     pop es:[9*4+2]               ;将int 9原来的地址恢复

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
       jne s1         ;延迟战术=让cpu循环10000000次
       pop dx
       pop ax
      ret

   ;--------以下为新的9号中断例程-----------------
int9:  push ax      ;！！！！！！！！！注意调用子程序的习惯
      push bx
       push es

      in al,60h

      pushf
      pushf
      pop bx
      and bh,11111100b
       push bx
     popf
      call dword ptr ds:[0]    ;对int指令进行模拟

    cmp al,1              ;ESC扫描码为01
     jne int9ret             ;此处执行;按下esc键后改变颜色

     mov ax,0b800h
     mov es,ax
     inc byte ptr es:[160*12+40*2+1]    ;改变颜色

intret:pop es
      pop bx
       pop ax
      iret

code ends

end start	  