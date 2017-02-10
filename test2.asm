data segment 
x DW 10H
Y DW 20H
Z DW ?
data ends

code segment
main proc far
assume cs:code , DS:data
start:  push ds
		mov ax , 0
		push ax
		mov ax , data
		mov ds , ax
		mov ax , X
		add ax , Y
		mov Z , ax
		ret
main endp
code ends
end start