assume cs:code,ds:data,ss:stack

data segment
    db "welcome to masm!" ;¶¨ÒåÒªÏÔÊ¾µÄ×Ö·û´®16¸ö×Ö½Ú
	db 02h,24h,71h ;¶¨ÒåÈýÖÖÑÕÉ«ÊôÐÔ
data ends
	
stack segment
    dw 8 dup(0)
stack ends

code segment
start:mov ax,data
      mov ds,ax
      
      mov ax,stack
      mov ss,ax
      mov sp,10h

     xor bx,bx ;bxÇåÁã£¬ÓÃÀ´Ë÷ÒýÑÕÉ«
     mov ax,0b872h;ºËã³öÆÁÄ»µÚ12ÐÐÖÐ¼äµÄÏÔ´æµÄ¶ÎÆðÊ¼Î»ÖÃ·ÅÈëaxÖÐ

     mov cx,3;s3Ñ­»·¿ØÖÆÐÐÊý£¬ÍâÑ­»·Îª3´Î£¬ÒòÎªÒªÏÔÊ¾3¸ö×Ö·û´®
s3:  push cx ;Èý¸ö½øÕ»²Ù×÷ÎªÍâÑ­»·s3±£´æÏà¹Ø¼Ä´æÆ÷µÄÖµ£¬ÒÔ·ÀÖ¹ËûÃÇÔÚÄÚÑ­»·ÖÐ±»ÆÆ»µ
     push ax
	 push bx
	 
	 mov es,ax  ;´ËÊ±esÎªÆÁÄ»µÚ12ÐÐÖÐ¼äµÄÏÔ´æµÄ¶ÎÆðÊ¼Î»ÖÃ
	 mov si,0;siÓÃÀ´Ë÷Òý´úÂëÁÐµÄ×Ö·û
	 mov di,0;ÓÃÀ´¶¨Î»Ä¿±êÁÐ
	 
	 mov cx,10h;s1Ñ­»·¿ØÖÆ´æ·ÅµÄ×Ö·û£¬ÄÚÑ­»·Îª10h´Î£¬ÒòÎªÒ»¸ö×Ö·û´®ÓÐ10h×Ö½Ú
s1:  mov al,ds:[si]
	 mov es:[di],al
	 inc si
	 add di,2
	 loop s1;´ËÑ­»·ÊµÏÖÅ¼µØÖ·ÖÐ´æ·Å×Ö·û
	 
	 mov di,1;diµÄÖµÉèÎª1£¬´Ó¶øÎªÔÚÏÔ´æµØÖ·ÖÐ´æ·Å×Ö·ûµÄÑÕÉ«ÊôÐÔ×ö×¼±¸
	 pop bx
	 mov al,ds:10h[bx];È¡ÑÕÉ«ÊôÐÔ
	 inc bx
	
	 mov cx,10h;µÚ¶þ¸öÄÚÑ­»·Îª10h´Î
	 s2:mov es:[di],al
	 add di,2
	 loop s2;´ËÑ­»·ÊµÏÖÆæµØÖ·ÖÐ´æ·Å×Ö·ûµÄÑÕÉ«ÊôÐÔ
	 ;ÒÔÏÂ4 ¾äÎªÏÂÒ»ÌËÑ­»·×ö×¼±¸
	 pop ax
	 add ax,0ah;½«ÏÔ´æµÄ¶ÎÆðÊ¼µØÖ·ÉèÎªµ±Ç°ÐÐµÄÏÂÒ»ÐÐ
	             ;[ÔÚ¶ÎµØÖ·ÖÐ¼Ó0ah£¬Ïàµ±ÓÚÔÚÆ«ÒÆµØÖ·ÖÐ¼ÓÁË0ah¡¿
	 pop cx
	 loop s3
	 
	 mov ax,4c00h
	 int 21h
code ends

end start	 
	 