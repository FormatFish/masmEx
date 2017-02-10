data segment 
x DW 10H
Y DW 20H
Z DW ?
data ends

code segment
	main proc far
	assume cs:code , DS:data
start :  push ds
			mov ax , 0 ;此处相当于一个函数，首先清零
			push ax
			mov ax , data
			mov ds , ax
			mov ax , x
			add ax , y
			mov z , ax
			ret
	main endp
code ends
	end start
	