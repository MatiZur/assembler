; Ejercicio 8 - Salto condicional
; Nombre y apellido: Matias Zurita
; Fecha: 22/08/2024           
.model small
.stack
.data
    num1 db 8
    num2 db 4
    msg1 db 'Los numeros son iguales', '$'
    msg2 db 'El numero 1 es mayor', '$'
    msg3 db 'El numero 2 es mayor', '$'               
.code
    main:
        mov AX, @DATA
        mov DS, AX
    ; Comparación
        mov AL, num1
        cmp AL, num2
        jc mayor2
        jz igual
        jnz mayor1
    ; Imprimir en pantalla
        mov AH, 09H
        lea DX, msg1
        int 21H
    .exit
; Salto condicional
    igual:
        mov AH, 09H
        lea DX, msg1
        int 21H
    .exit
    mayor1:
        mov AH, 09H
        lea DX, msg2
        int 21H
    .exit
    mayor2:
        mov AH, 09H
        lea DX, msg3
        int 21H
    .exit
END