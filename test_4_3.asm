ASSUME CS:CODE

CODE SEGMENT
START : PUSH DS
		SUB AX,AX
		PUSH AX
		MOV BH,30h; ͳ�����ֵĸ���
		MOV BL,30h; ͳ����ĸ�ĸ���
		MOV DH,30h; ͳ�������ַ��ĸ���
		MOV CX,10
AA1:    CMP CX,0
		JZ  STOP   ;�
		MOV AH,1
		INT 21H   ;
		
		CMP AL,20H
		JZ  STOP
		
		CMP AL,'0'
		JB  CC1
		CMP AL,'9'
		JA  CC3
		INC BH
		dec cx
		jmp AA1
		
CC3 :	cmp al , 'A'
		JB CC1
		cmp al , 'Z'
		JA CC2
		jmp fla
		
CC2 :   cmp al , 'a'
		JB CC1
		cmp al , 'z'
		JA CC1
fla:	inc bl
		dec cx
		jmp AA1

CC1:   INC DH
		DEC CX
		jmp AA1
		
STOP:   MOV DL,BH  ;����
		MOV AH,02
		INT 21H
	
	mov dl , bl
	int 21h  ; ��ĸ
	
	mov dl , dh
	int 21h  ; else
	
	mov ax ,4c00h
	int 21h

Code ends
End start
