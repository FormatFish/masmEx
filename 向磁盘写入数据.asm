;ע���ʽ��������
assume cs:segment

code segment
start:
      mov ax,0b800h
	  mov es,ax
	  mov bx,0  ;es��bx ָ��д����̵�����
	 ;====================================== 
	  mov al,8   ;д���������
	  mov ch,0   ;�ŵ��ţ���0��ʼ
	  mov cl,1    ;�����ţ���1��ʼ
	  mov dl,0     ;��������0������A 1������B 0
	  mov dh,0        ;��ͷ�ţ������̼���ţ
	  mov ah,3     ;���� int 13hд�����ݵĹ��ܺ�
	   int 13h
	   
	   ;���ز���
	   ;�����ɹ�;(ah)=0,(al)=д���������
	   ;����ʧ��;(ah)=�������
	   
return:
     mov ax,4c00h
     int 21h

code ends
end start	 