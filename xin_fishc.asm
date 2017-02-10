assume cs:Z

Z segment
Q:mov ax , 0B800h
  mov ds , ax 
  mov bx , 0
  mov cx , 9999
  mov al  , 45
ZQ: mov [bx]   , al
	loop ZQ
	
	mov ax , 4c00h
	int 21h
Z ends
end Q