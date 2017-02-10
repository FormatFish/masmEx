assume cs:code
code segment
start:
	mov al , 38h
	mov bl , 49h
	add al , bl
   mov cl , al 
   das
	inc al 
	dec cl

	
   
	mov ax , 4c00h
	int 21h
code ends
end start