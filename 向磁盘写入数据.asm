;注意格式！！！！
assume cs:segment

code segment
start:
      mov ax,0b800h
	  mov es,ax
	  mov bx,0  ;es；bx 指向将写入磁盘的数据
	 ;====================================== 
	  mov al,8   ;写入的扇区数
	  mov ch,0   ;磁道号，从0开始
	  mov cl,1    ;扇区号，从1开始
	  mov dl,0     ;驱动器号0；软驱A 1；软驱B 0
	  mov dh,0        ;磁头号（对软盘即面号�
	  mov ah,3     ;传递 int 13h写入数据的功能号
	   int 13h
	   
	   ;返回参数
	   ;操作成功;(ah)=0,(al)=写入的扇区数
	   ;操作失败;(ah)=出错代码
	   
return:
     mov ax,4c00h
     int 21h

code ends
end start	 