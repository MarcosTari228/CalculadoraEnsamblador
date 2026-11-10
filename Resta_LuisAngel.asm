
org 100h


; lectura del numero a

lea dx, etiquetaEntradaA
mov ah, 09h
int 21h

xor bx, bx
mov cx, 3

; leer los tres digitos de a
leerA:

mov ah, 01h
int 21h
sub al, 30h
xor ah, ah

push ax

; multiplicar el numero acumulado por 10
mov ax, bx
mov dx, 10
mul dx
mov bx, ax

; sumar el nuevo digito
pop ax
add bx, ax

loop leerA

mov ValorA, bx

; consumir el enter
mov ah, 01h
int 21h



; lectura del numero b


lea dx, etiquetaEntradaB
mov ah, 09h
int 21h

xor bx, bx
mov cx, 3

; leer los tres digitos de b
leerB:

mov ah, 01h
int 21h
sub al, 30h
xor ah, ah

push ax

; multiplicar el numero acumulado por 10
mov ax, bx
mov dx, 10
mul dx
mov bx, ax

; sumar el nuevo digito
pop ax
add bx, ax

loop leerB

mov ValorB, bx

; consumir el enter
mov ah, 01h
int 21h


; comparacion de los numeros


mov ax, ValorA
mov bx, ValorB

cmp ax, bx
jb error
jae realizarResta



; realizar la resta


realizarResta:

sub ax, bx
mov resultado, ax


lea dx, etiquetaResultado
mov ah, 09h
int 21h



; conversion del resultado a centenas, decenas y unidades


mov ax, resultado
mov bx, 100
xor dx, dx
div bx

; guardar centenas
mov si, ax

; guardar residuo
mov ax, dx

; obtener decenas y unidades
xor dx, dx
mov bx, 10
div bx

; guardar decenas y unidades
mov di, ax
mov bp, dx




cmp si, 0
je revisarDecenas

mov dx, si
add dl, 30h
mov ah, 02h
int 21h




revisarDecenas:

cmp si, 0
jne imprimirDecenas

cmp di, 0
je imprimirUnidades

imprimirDecenas:

mov dx, di
add dl, 30h
mov ah, 02h
int 21h


imprimirUnidades:

mov dx, bp
add dl, 30h
mov ah, 02h
int 21h

jmp fin




error:


lea dx, etiquetaError
resultado dw 0
mov ah, 09h
ValorA dw 0
ValorB dw 0
int 21h


jmp fin

etiquetaError db 13,10, "Error: El primer numero debe ser mayor o igual que el segundo.$"


;Resultados


etiquetaResultado db 13,10, "Resultado de la resta: $"

etiquetaEntradaB db 13,10, "Ingrese el Valor B (0-255): $"

etiquetaEntradaA db 13,10, "Ingrese el Valor A (0-255): $"
fin:

