
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h    

org 100h

    ; Ingresar Valor A, el codigo solo muestra resultados menores a 999.Variable para el menu call multiplicacion.

    LEA dx, etiquetaEntradaA
    mov ah, 09h
    int 21h

    ; Lectura de Valor A (Centenas)
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, 64h
    mul bl
    mov ValorA, al

    ; Lectura de Valor A (Decenas)
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, 0Ah
    mul bl
    add ValorA, al

    ; Lectura de Valor A (Unidades)
    mov ah, 01h
    int 21h
    sub al, 30h
    add ValorA, al

    ; Ingresar Valor B ----------------------------------------------------

    LEA dx, etiquetaEntradaB
    mov ah, 09h
    int 21h

    ; Lectura de Valor B (Centenas)
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, 64h
    mul bl
    mov ValorB, al

    ; Lectura de Valor B (Decenas)
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, 0Ah
    mul bl
    add ValorB, al

    ; Lectura de Valor B (Unidades)
    mov ah, 01h
    int 21h
    sub al, 30h
    add ValorB, al

    ; Mostrar multiplicacion ----------------------------------------------------

    LEA dx, etiquetaListaMult
    mov ah, 09h
    int 21h

    ; Llamar a la subrutina de multiplicacion
    call multiplicacion

    ; Finalizar programa
    mov ax, 4C00h
    int 21h


; MULTIPLICACION -----------------

multiplicacion:

    ; Guardar registros
    push bx
    push cx
    push dx

    ; Cargar valores A y B
    mov al, ValorA
    mov bl, ValorB

    ; Multiplicar A * B
    mul bl

    ; Comprobar si el resultado supera 999
    cmp ax, 999
    ja desbordamiento

    ; Obtener centenas
    mov bl, 100
    div bl
    add al, 30h
    mov ch, al

    ; Obtener decenas y unidades
    mov al, ah
    mov ah, 0
    mov bl, 10
    div bl

    ; Guardar decenas
    add al, 30h
    mov cl, al

    ; Guardar unidades
    add ah, 30h
    mov dh, ah

    ; Mostrar centenas
    mov dl, ch
    mov ah, 02h
    int 21h

    ; Mostrar decenas
    mov dl, cl
    mov ah, 02h
    int 21h

    ; Mostrar unidades
    mov dl, dh
    mov ah, 02h
    int 21h

    jmp finMultiplicacion

desbordamiento:

    LEA dx, etiquetaDesbordamiento
    mov ah, 09h
    int 21h

finMultiplicacion:

    ; Recuperar registros
    pop dx
    pop cx
    pop bx

    ret



etiquetaEntradaA db 10,13, "Ingrese el Valor A (0-255): $"
etiquetaEntradaB db 10,13, "Ingrese el Valor B (0-255): $"

etiquetaListaMult db 10,13, "3. Multiplicacion (A*B) = $"

etiquetaDesbordamiento db 10,13, "Error: resultado mayor a 999.$"


ValorA db 0
ValorB db 0


; add your code here

ret




