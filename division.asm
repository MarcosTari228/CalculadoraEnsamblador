org 100h
;primer numero
LEA dx, etiqueta1
mov ah, 09h
int 21h

call leerNumero
mov numero1, al

;segundo numero
LEA dx, etiqueta2
mov ah, 09h
int 21h

call leerNumero
mov numero2, al


;validar que numero2 no sea cero
mov al, numero2
cmp al, 0
je errorCero


;comparar numero1 con numero2
mov al, numero1
mov bl, numero2

CMP al, bl

; Si numero1 <= numero2
JBE errorDivision


;realizar division
mov ax, 0
mov al, numero1

mov bl, numero2

; AX / BL
; AL = cociente
; AH = residuo

div bl

mov resultado, al

;mostrar resultado
LEA dx, etiquetaResultado
mov ah, 09h
int 21h

mov al, resultado
call imprimirNumero

jmp fin


;error numero1 <=numero2
errorDivision:

LEA dx, etiquetaError
mov ah, 09h
int 21h

jmp fin

;no se puede dividir entre cero
errorCero:

LEA dx, etiquetaCero
mov ah, 09h
int 21h

jmp fin

;leer numero
leerNumero PROC

    mov bx, 0

leerDigito:

    mov ah, 01h
    int 21h

    ; Comprobar si es ENTER
    cmp al, 13
    je terminarNumero

    ; Convertir ASCII a numero
    sub al, 30h

    ; Guardar el digito
    mov dl, al

    ; BX = BX * 10
    mov ax, bx
    mov bl, 10
    mul bl

    ; Agregar el nuevo digito
    add al, dl

    ; Guardar resultado en BX
    mov bx, ax

    jmp leerDigito


terminarNumero:

    mov ax, bx

    ret

leerNumero ENDP

imprimirNumero PROC

    mov ah, 0

    ; Si el resultado es 0
    cmp ax, 0
    jne convertirNumero

    mov dl, '0'
    mov ah, 02h
    int 21h

    ret
convertirNumero:

    mov bx, 10
    mov cx, 0

dividirNumero:
    mov dx, 0
    div bx

    push dx
    inc cx

    cmp ax, 0
    jne dividirNumero


mostrarNumero:

    pop dx

    add dl, 30h

    mov ah, 02h
    int 21h

    loop mostrarNumero

    ret

imprimirNumero ENDP

;fin
fin:
ret
;etiquetas
etiqueta1 db 10,13, "Ingrese el primer numero: $"

etiqueta2 db 10,13, "Ingrese el segundo numero: $"

etiquetaResultado db 10,13, "El resultado es: $"

etiquetaError db 10,13, "Error: el primer numero debe ser mayor que el segundo.$"

etiquetaCero db 10,13, "Error: no se puede dividir entre cero.$"

;variables
numero1 db 0
numero2 db 0
resultado db 0
