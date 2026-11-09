org 100h

; Cadena "Ingrese el Numero A: " ----------------------------------------------------
lea dx, etiquetaEntradaA
mov ah, 09h
int 21h

; Lectura de Valor A (Centenas)
mov ah, 1
int 21h
sub al, 30h
mov bl, 64h
mul bl
mov ValorA, al

; Lectura de Valor A (Decenas)
mov ah, 1
int 21h
sub al, 30h
mov bl, 0Ah
mul bl
add ValorA, al

; Lectura de Valor A (Unidades)
mov ah, 1
int 21h
sub al, 30h
add ValorA, al

; Cadena "Ingrese el Numero B: " ----------------------------------------------------
lea dx, etiquetaEntradaB
mov ah, 09h
int 21h

; Lectura de Valor A (Centenas)
mov ah, 1
int 21h
sub al, 30h
mov bl, 64h
mul bl
mov ValorB, al

; Lectura de Valor A (Decenas)
mov ah, 1
int 21h
sub al, 30h
mov bl, 0Ah
mul bl
add ValorB, al

; Lectura de Valor A (Unidades)
mov ah, 1
int 21h
sub al, 30h
add ValorB, al

; Cadena "1. Suma" ----------------------------------------------------
lea dx, etiquetaListaSuma
mov ah, 09h
int 21h

; Cadena "2. Resta" ----------------------------------------------------
lea dx, etiquetaListaRest
mov ah, 09h
int 21h

; Cadena "3. Multiplicacion" ----------------------------------------------------
lea dx, etiquetaListaMult
mov ah, 09h
int 21h

; Cadena "4. Division" ----------------------------------------------------
lea dx, etiquetaListaDivi
mov ah, 09h
int 21h


  
  
  
; I=N=I=C=I=O= =D=E= =S=E=C=C=I=O=N= =R=E=S=E=R=V=A=D=A= 
; =P=A=R=A= =L=A=S= =O=P=E=R=A=C=I=O=N=E=S= =D=E= =L=A=S= =R=A=I=C=E=S=

; Espero y les gusten los numeros magicos

;	n	n^2	hex
;	0	0	0
;	1	1	1
;	2	4	4
;	3	9	9
;	4	16	10
;	5	25	19
;	6	36	24
;	7	49	31
;	8	64	40
;	9	81	51
;	10	100	64
;	11	121	79
;	12	144	90
;	13	169	A9
;	14	196	C4
;	15	225	E1

; Cadena "5. Raices" ----------------------------------------------------

; Raiz de A
lea dx, etiquetaListARaiz
mov ah, 09h
int 21h

; Inicializar contador en 0 
MOV BL, 0

CMP ValorA, 01h
JB imprimirRaizA

MOV BL, 1
CMP ValorA, 04h
JB imprimirRaizA

MOV BL, 2
CMP ValorA, 09h
JB imprimirRaizA

MOV BL, 3
CMP ValorA, 10h
JB imprimirRaizA

MOV BL, 4
CMP ValorA, 19h
JB imprimirRaizA

MOV BL, 5
CMP ValorA, 24h
JB imprimirRaizA

MOV BL, 6
CMP ValorA, 31h
JB imprimirRaizA

MOV BL, 7
CMP ValorA, 40h
JB imprimirRaizA

MOV BL, 8
CMP ValorA, 51h
JB imprimirRaizA

MOV BL, 9
CMP ValorA, 64h
JB imprimirRaizA

MOV BL, 10
CMP ValorA, 79h
JB imprimirRaizA

MOV BL, 11
CMP ValorA, 90h
JB imprimirRaizA

MOV BL, 12
CMP ValorA, 0A9h
JB imprimirRaizA

MOV BL, 13
CMP ValorA, 0C4h
JB imprimirRaizA

MOV BL, 14
CMP ValorA, 0E1h
JB imprimirRaizA

MOV BL, 15

imprimirRaizA:
; Verificar si el numero es mayor a 10
CMP BL, 0AH 
JB imprimirUnDigitoA

; Si es mayor, imprime un '1' y calcula la decena
MOV DL, '1'
MOV AH, 02H
INT 21H
SUB BL, 0AH

; Imprimir la unidad normalmente
imprimirUnDigitoA:
MOV DL, BL
ADD DL, 30H
MOV AH, 02H
INT 21H


; Raiz de B
lea dx, etiquetBListaRaiz
mov ah, 09h
int 21h

; Inicializar contador en 0 
MOV BL, 0

CMP ValorB, 01h
JB imprimirRaizB

MOV BL, 1
CMP ValorB, 04h
JB imprimirRaizB

MOV BL, 2
CMP ValorB, 09h
JB imprimirRaizB

MOV BL, 3
CMP ValorB, 10h
JB imprimirRaizB

MOV BL, 4
CMP ValorB, 19h
JB imprimirRaizB

MOV BL, 5
CMP ValorB, 24h
JB imprimirRaizB

MOV BL, 6
CMP ValorB, 31h
JB imprimirRaizB

MOV BL, 7
CMP ValorB, 40h
JB imprimirRaizB

MOV BL, 8
CMP ValorB, 51h
JB imprimirRaizB

MOV BL, 9
CMP ValorB, 64h
JB imprimirRaizB

MOV BL, 10
CMP ValorB, 79h
JB imprimirRaizB

MOV BL, 11
CMP ValorB, 90h
JB imprimirRaizB

MOV BL, 12
CMP ValorB, 0A9h
JB imprimirRaizB

MOV BL, 13
CMP ValorB, 0C4h
JB imprimirRaizB

MOV BL, 14
CMP ValorB, 0E1h
JB imprimirRaizB

MOV BL, 15

imprimirRaizB:
; Verificar si el numero es mayor a 10
CMP BL, 0AH 
JB imprimirUnDigitoB

; Si es mayor, imprime un '1' y calcula la decena
MOV DL, '1'
MOV AH, 02H
INT 21H
SUB BL, 0AH

; Imprimir la unidad normalmente
imprimirUnDigitoB:
MOV DL, BL
ADD DL, 30H
MOV AH, 02H
INT 21H
              
; =F=I=N= =D=E= =L=A= =S=E=C=C=I=O=N= =R=E=S=E=R=V=A=D=A= =P=A=R=A= 
; =L=A=S= =O=P=E=R=A=C=I=O=N=E=S= =D=E= =L=A=S= =R=A=I=C=E=S=


; Cadena "7. Factoriales" ----------------------------------------------------
lea dx, etiquetaListaFact
mov ah, 09h
int 21h

ret

etiquetaEntradaA db 10,13, "Ingrese el Valor A (0-255): $"
etiquetaEntradaB db 10,13, "Ingrese el Valor B (0-255): $"
etiquetaListaSuma db 10,13, "1. Suma            (A+B)     = $"
etiquetaListaRest db 10,13, "2. Resta           (A-B)     = $"
etiquetaListaMult db 10,13, "3. Multiplicacion  (A*B)     = $"
etiquetaListaDivi db 10,13, "4. Division        (A/B)     = $"
etiquetAListaRaiz db 10,13, "5. Raices          (A^(1/2)) = $"
etiquetBListaRaiz db 10,13, "6. Raices          (B^(1/2)) = $"
etiquetAListaFact db 10,13, "7. Factoriales     (A!)      = $"
etiquetBListaFact db 10,13, "8. Factoriales     (B!)      = $"

ValorA db 0
ValorB db 0
