assume cs:codesg
 
codesg segment 


 
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h 


 
        dw 0,0,0,0,0,0,0,0,0,0 


 
start:  mov ax, codesg ;或mov ax, cs 


 
        mov ss,ax 


 
        mov sp,16h   ; sp的值最小能设置多少？
 

 
        mov ax,0 


 
      mov ds,ax 


 
      mov bx,0 


 
      mov cx,8 


 
    s:  push [bx] 


       pop cs:[bx]   ;或 pop ss:[bx] 


 
        add bx,2  
 

 
        loop s 


 
       mov ax,4c00h 


 
       int 21h 

 
codesg ends 


 
end start