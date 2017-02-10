ASSUME CS:CODE

CODE SEGMENT
START : PUSH DS
		SUB AX,AX
		PUSH AX
		MOV BH,30h; 统计数字的个数
		MOV BL,30h; 统计字母的个数
		MOV DH,30h; 统计其它字符的个数
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
		
STOP:   MOV DL,BH  ;数字
		MOV AH,02
		INT 21H
	
	mov dl , bl
	int 21h  ; 字母
	
	mov dl , dh
	int 21h  ; else
	
	mov ax ,4c00h
	int 21h

Code ends
End start
