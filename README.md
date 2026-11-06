# Calculadora Aritmética de Dos Dígitos en Ensamblador 8086

Programa en lenguaje ensamblador x86 diseñado para ejecutarse en el emulador **emu8086**. Permite ingresar números de hasta dos dígitos (00 a 99) y ejecutar operaciones aritméticas básicas y avanzadas mediante un menú interactivo en consola.

---

## Características

- **Entorno de ejecución:** Emulador emu8086 (modo real de 16 bits).
- **Entrada de datos:** Lectura y conversión de cadenas ASCII de hasta dos dígitos a valores numéricos en memoria.
- **Validación básica:** Control para evitar la división entre cero.
- **Interacción por consola:** Uso de interrupciones de video y teclado de la BIOS (`INT 10h` e `INT 21h`).

---

## Operaciones Disponibles

| Opción | Operación | Instrucción / Lógica principal | Consideraciones |
| :---: | :--- | :--- | :--- |
| **1** | **Suma (+)** | `ADD AX, BX` | Soporta acarreo para resultados mayores a dos dígitos. |
| **2** | **Resta (-)** | `SUB AX, BX` | Manejo de signo si el sustraendo es mayor que el minuendo. |
| **3** | **Multiplicación (×)** | `MUL BL` / `MUL BX` | Resultado de hasta 16 bits almacenado en `AX`. |
| **4** | **División (÷)** | `DIV BL` | Retorna cociente (`AL`) y residuo (`AH`). Manejo de error para divisor `0`. |
| **5** | **Potencia ($A^B$)** | Bucle de multiplicaciones sucesivas (`LOOP`) | Base $A$ elevada al exponente $B$. Exponente 0 retorna 1. |
| **6** | **Raíz Cuadrada ($\lfloor\sqrt{A}\rfloor$)** | Algoritmo de aproximación entera por restas sucesivas | Aplica sobre el primer número ingresado. |
| **7** | **Salir** | Termina la ejecución y retorna el control (`INT 20h` o `INT 21h / AH=4Ch`). |

---

## Flujo del Programa

1. **Mensaje de presentación:** Muestra el encabezado institucional, nombre del proyecto y autor.
2. **Ingreso de datos:**
   - Solicita el **Primer Número** (rango: 0 a 99).
   - Solicita el **Segundo Número** (rango: 0 a 99; no requerido para la raíz cuadrada).
3. **Menú de selección:** Despliega las opciones en pantalla y espera que el usuario presione una tecla entre `'1'` y `'7'`.
4. **Ejecución y despliegue:** Realiza el cálculo en los registros correspondientes, convierte el resultado numérico a caracteres ASCII y lo imprime en pantalla.
5. **Reintento:** Opción de realizar otra operación o salir del programa.

---

## Estructura de Memoria y Registros

- **`AX` / `AL`:** Acumulador principal para operaciones aritméticas (`MUL`, `DIV`, `ADD`, `SUB`) y llamadas a `INT 21h`.
- **`BX` / `BL`:** Registro base; utilizado comúnmente para almacenar el segundo operando o actuar como divisor.
- **`CX` / `CL`:** Contador para bucles de iteración en la **potencia** y en la **conversión binario a ASCII**.
- **`DX`:** Almacena residuos en divisiones de 16 bits y punteros a cadenas (`DX = OFFSET variable`).

---

## Instrucciones de Compilación y Ejecución en emu8086

1. **Abrir el entorno:**
   - Inicie **emu8086 - Microprocessor Emulator**.
2. **Cargar el código fuente:**
   - Cree un archivo nuevo (`File > New`) seleccionando la plantilla `.COM` o `.EXE`.
   - Pegue el código fuente del proyecto (`calculadora.asm`).
3. **Compilar y emular:**
   - Haga clic en el botón **`Emulate`** (o presione `F5`).
   - Se abrirá la ventana de depuración y la pantalla de consola (**Virtual Drive / Console**).
4. **Ejecución:**
   - Presione **`Run`** para iniciar el flujo continuo.
   - Siga las instrucciones en la ventana de consola para ingresar los números y seleccionar la operación.

---

## Consideraciones Técnicas

- **Captura de dos dígitos:**  
  La lectura por teclado (`AH=01h / INT 21h`) lee código ASCII. Para formar un número de 2 dígitos ($D_1 D_2$):
  $$\text{Valor} = (D_1 - 30\text{h}) \times 10 + (D_2 - 30\text{h})$$
- **Impresión de resultados:**  
  Para imprimir valores mayores a 9, se debe descomponer el número mediante divisiones sucesivas entre 10, apilando los residuos en la pila (`PUSH`) y desapilándolos (`POP`) convertidos a ASCII (`+ 30h`).
