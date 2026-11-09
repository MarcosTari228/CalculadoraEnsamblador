
org 100h

LEA dx, etiquetaEntradaA
mov ah, 09h
int 21h

mov ah, 1
int 21h
sub al, 30h
mov bl, 64h
mul bl
mov ValorA, al

mov ah, 1
int 21h
sub al, 30h
mov bl, 0Ah
mul bl
add ValorA, al

mov ah, 1
int 21h
sub al, 30h
add ValorA, al

LEA dx, etiquetaEntradaB
mov ah, 09h
int 21h

mov ah, 1
int 21h
sub al, 30h
mov bl, 64h
mul bl
mov ValorB, al

mov ah, 1
int 21h
sub al, 30h
mov bl, 0Ah
mul bl
add ValorB, al

mov ah, 1
int 21h
sub al, 30h
add ValorB, al

LEA dx, etiquetaListaSuma
mov ah, 09h
int 21h

LEA dx, etiquetaListaRest
mov ah, 09h
int 21h

LEA dx, etiquetaListaMult
mov ah, 09h
int 21h

LEA dx, etiquetaListaDivi
mov ah, 09h
int 21h

LEA dx, etiquetaListaRaiz
mov ah, 09h
int 21h

LEA dx, etiquetaListaAPot
mov ah, 09h
int 21h

call PotenciaA

LEA dx, etiquetaListaBPot
mov ah, 09h
int 21h

call PotenciaB

ret

PotenciaA:

mov al, ValorA
cmp al, 10h
ja ErrorPotencia

mov al, ValorB
cmp al, 10h
ja ErrorPotencia

mov ax, 1
mov cl, ValorB
cmp cl, 0
je FinPotenciaA

mov bl, ValorA
mov bh, 0
mov ch, 0
mov cl, ValorB

CicloPotenciaA:

mul bx
loop CicloPotenciaA

FinPotenciaA:

call ImprimirNumero
ret

PotenciaB:

mov al, ValorB
cmp al, 10h
ja ErrorPotencia

mov al, ValorA
cmp al, 10h
ja ErrorPotencia

mov ax, 1
mov cl, ValorA
cmp cl, 0
je FinPotenciaB

mov bl, ValorB
mov bh, 0
mov ch, 0
mov cl, ValorA

CicloPotenciaB:

mul bx
loop CicloPotenciaB

FinPotenciaB:

call ImprimirNumero
ret

ErrorPotencia:

LEA dx, mensajeErrorPotencia
mov ah, 09h
int 21h
ret

ImprimirNumero:

mov bx, 10
mov cx, 0

DividirNumero:

mov dx, 0
div bx
push dx
inc cx
cmp ax, 0
jne DividirNumero

ImprimirDigitos:

pop dx
add dl, 30h
mov ah, 02h
int 21h
loop ImprimirDigitos 

mov ah, 02h
mov dl, 13
int 21h
mov dl, 10
int 21h

ret

etiquetaEntradaA db 10,13, "Ingrese el Valor A (0-255): $"
etiquetaEntradaB db 10,13, "Ingrese el Valor B (0-255): $"

etiquetaListaSuma db 10,13, "1. Suma            (A+B)     = $"
etiquetaListaRest db 10,13, "2. Resta           (A-B)     = $"
etiquetaListaMult db 10,13, "3. Multiplicacion  (A*B)     = $"
etiquetaListaDivi db 10,13, "4. Division        (A/B)     = $"
etiquetaListARaiz db 10,13, "5. Raices          (A^(1/2)) = $"
etiquetaListBRaiz db 10,13, "6. Raices          (B^(1/2)) = $"
etiquetaListaAPot db 10,13, "7. Potencia        (A^B)     = $"
etiquetaListaBPot db 10,13, "8. Potencia        (B^A)     = $"

mensajeErrorPotencia db 10,13, "Error: El numero no puede ser mayor a 16.$"

ValorA db 0
ValorB db 0