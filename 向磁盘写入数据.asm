;×¢Òâ¸ñÊ½£¡£¡£¡£¡
assume cs:segment

code segment
start:
      mov ax,0b800h
	  mov es,ax
	  mov bx,0  ;es£»bx Ö¸Ïò½«Ğ´Èë´ÅÅÌµÄÊı¾İ
	 ;====================================== 
	  mov al,8   ;Ğ´ÈëµÄÉÈÇøÊı
	  mov ch,0   ;´ÅµÀºÅ£¬´Ó0¿ªÊ¼
	  mov cl,1    ;ÉÈÇøºÅ£¬´Ó1¿ªÊ¼
	  mov dl,0     ;Çı¶¯Æ÷ºÅ0£»ÈíÇıA 1£»ÈíÇıB 0
	  mov dh,0        ;´ÅÍ·ºÅ£¨¶ÔÈíÅÌ¼´ÃæºÅ£
	  mov ah,3     ;´«µİ int 13hĞ´ÈëÊı¾İµÄ¹¦ÄÜºÅ
	   int 13h
	   
	   ;·µ»Ø²ÎÊı
	   ;²Ù×÷³É¹¦;(ah)=0,(al)=Ğ´ÈëµÄÉÈÇøÊı
	   ;²Ù×÷Ê§°Ü;(ah)=³ö´í´úÂë
	   
return:
     mov ax,4c00h
     int 21h

code ends
end start	 