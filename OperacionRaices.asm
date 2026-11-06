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
