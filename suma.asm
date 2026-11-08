
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

LEA dx, etiquetaNum1
MOV ah, 09h
INT 21h

;Leer primer digito
MOV ah,01h
INT 21h
SUB al, 30h
MOV bl, 10
MUL bl 
MOV decena, al

;Leer segundo digito  
MOV ah, 01h
INT 21h
SUB al, 30h
MOV unidad, al      

;Guardarlo en su Variable
MOV  al, decena
ADD al, unidad
Mov valorA, al

;Limpiar 
MOV ax,0
MOV bx,0

LEA dx, etiquetaNum2
Mov ah, 09h
INT 21h

MOV ah, 01h
INT 21h
SUB al, 30h
MOV bl, 10
MUL bl
MOV decena, al 

MOV ah, 01h
INT 21h
SUB al, 30h
MOV unidad, al

MOV al, decena
ADD al, unidad
MOV valorB, al

; Hacer la suma 
MOV al, valorA
ADD al, valorB
MOV resultado, al

LEA dx, etiquetaSuma
MOV ah, 09h
INT 21h

MOV al, resultado
MOV ah, 0h
MOV bl, 100
DIV bl
MOV decena, ah

CMP al, 0
JE menorACien  


ADD al, 30h
MOV dl, al
MOV ah, 02h
INT 21h
    
; Validacion para que cuando sea menor a cien no imprima 045
menorACien:

MOV al, decena
MOV ah, 0h
MOV bl, 10
DIV bl
MOV unidad, ah 


; Lo mismo para cuando sea suma de un solo digito
                                                                             s
CMP resultado, 100
JAE imprimirDecena

CMP al, 0
JE menorADiez


; Puto dolor de cabeza, no se ni pa que lo hice
imprimirDecena:

ADD al, 30h
MOV dl, al
MOV ah, 02h
INT 21h
       

menorADiez:

MOV dl, unidad
ADD dl, 30h
MOV ah, 02h
INT 21h




ret
valorA db 0 
valorB db 0
unidad db 0
decena db 0 
resultado db 0

etiquetaNum1 db 13,10, " Ingrese el primer numero $"
etiquetaNum2 db 13,10, " Ingrese el segundo numero $"
etiquetaSuma db 13,10, " El resultado es: $"


