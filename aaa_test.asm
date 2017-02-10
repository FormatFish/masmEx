CODE SEGMENT
assume cs:CODE
START:
	mov ax ,'8'
	add al ,'9'
	AAA

	
	mov ax, 4c00h
	int 21h

CODE ENDS
END START