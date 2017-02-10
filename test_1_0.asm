DATA   SEGMENT
X  DW 10H
Y  DW 20H
Z  DW  ?
DATA    ENDS
CODE    SEGMENT
MAIN    PROC  FAR
         ASSUME  CS:CODE, DS:DATA
START:   PUSH  DS
         MOV  AX, 0
         PUSH  AX
         MOV  AX,  DATA
         MOV  DS,  AX
         MOV  AX,  X
         ADD   AX,  Y
         MOV   Z,   AX
         RET
 MAIN   ENDP
 CODE   ENDS
         END  START