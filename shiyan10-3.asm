assume cs:code,ds:data

data segment
        db 10 dup (0)
data ends

code segment

start:
        mov ax,12666
		
        mov bx,data       ;ds:si指向字符串的首地址
        mov ds,bx
        mov si,0

        call dtoc         ;dtoc子程序实现将word型整数转化为ASCIIma字符串并存储

        mov dh,8          ;初始化打印的位置
        mov dl,3
        mov cl,0cah

        call show_str     ;开始打印字符串

        mov ax,4c00h
        int 21h

dtoc:  ;数值显示的子程序定义
        push dx
        push cx
        push ax
        push si
        push bx           ;为了不改变主程序的初值

        mov bx,0          ;bx在子程序中用来存放位数，用栈来临时存放修改后的字符
		
s1:     mov cx,10d        ;d表示十进制,cx准备被除
        mov dx,0

        div cx            ;除以十
        mov cx,ax         ;得到的商赋值给cx

        jcxz s2           ;当商为0则跳到s2

        add dx,30h        ;将余数加上30h得到相应的ASCII码
        push dx
        inc bx

        jmp short s1

s2:     add dx,30h       ;当商为0的时候，余数为个位
        push dx
        inc bx           ;再进行一次栈操作(补充当"商为零而余数不为零"时的情况)

        mov cx,bx        ;总共有bx位进栈了，所以循环次数为bx
        mov si,0

s3:     pop ax           ;s3实现将栈中的数据依次出栈放到指定内存中

        mov [si],al
        inc si

        loop s3

okay:   pop bx
        pop si
        pop ax
        pop cx
        pop dx

        ret   ;数值显示的子程序定义结束

 

show_str:  ;显示字符串的子程序已经在第一题中说明，在此不再赘述。

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

