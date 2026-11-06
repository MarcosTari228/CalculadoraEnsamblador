org 100h

; Cadena "Ingrese el Numero A: " ----------------------------------------------------
LEA dx, etiquetaEntradaA
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
LEA dx, etiquetaEntradaB
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
LEA dx, etiquetaListaSuma
mov ah, 09h
int 21h

; Cadena "2. Resta" ----------------------------------------------------       
LEA dx, etiquetaListaRest
mov ah, 09h
int 21h

; Cadena "3. Multiplicacion" ----------------------------------------------------       
LEA dx, etiquetaListaMult
mov ah, 09h
int 21h

; Cadena "4. Division" ----------------------------------------------------       
LEA dx, etiquetaListaDivi
mov ah, 09h
int 21h

; Cadena "5. Raices" ----------------------------------------------------       
LEA dx, etiquetaListaRaiz
mov ah, 09h
int 21h
                         
; Cadena "6. Factoriales" ----------------------------------------------------        
LEA dx, etiquetaListaFact
mov ah, 09h
int 21h

ret



etiquetaEntradaA db 10,13, "Ingrese el Valor A (0-255): $"
etiquetaEntradaB db 10,13, "Ingrese el Valor B (0-255) $"
etiquetaListaSuma db 10,13, "1. Suma            (A+B)     = $"
etiquetaListaRest db 10,13, "2. Resta           (A-B)     = $"
etiquetaListaMult db 10,13, "3. Multiplicación  (A*B)     = $"
etiquetaListaDivi db 10,13, "4. División        (A/B)     = $"
etiquetaListaRaiz db 10,13, "5. Raices          (A^(1/2)) = $"
etiquetaListaFact db 10,13, "6. Factoriales     (A!)      = $"
ValorA db 0
ValorB db 0

; Suma
VSuma db 0
VSumaC db 0
VSumaD db 0
VSumaU db 0

; Resta
VRest db 0
VRestC db 0
VRestD db 0
VRestU db 0

; Multiplicacion
VMult db 0
VMultC db 0
VMultD db 0
VMultU db 0

; Division
VDivi db 0
VDiviC db 0
VDiviD db 0
VDiviU db 0

; Raiz
VRaiz db 0
VRaizC db 0
VRaizD db 0
VRaizU db 0

; Factorial
VFact db 0
VFactC db 0
VFactD db 0
VFactU db 0
