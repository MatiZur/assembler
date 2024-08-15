; Ejercicio 1 - Ingresar valores
;         Matias Zurita         
;           15/8/2024
.model small                              
.stack 64
; Inicialización de variables             
;   y cadenas de mensajes           
.data
    num1 db 0; Variable de entrada
    num2 db 0; Variable de entrada
    resta db 0; Variable para el resultado de la resta
    mensaje1 db 10, 13, 'Ingrese el primer valor: ', '$'
    mensaje2 db 10, 13, 'Ingrese el segundo valor: ', '$'  
    mensajes db 10, 13, 'La resta da: ', '$'           
.code         
    inicio:
        mov AX, @DATA
        mov DS, AX  
    ; Imprimir mensaje 1
        mov AH, 9       ; Carga de la función (lo que hace, dirección del texto a imprimir)
        lea DX, mensaje1; Obtiene la dirección de memoria del mensaje 1 que queremos imprimir
        int 21H         ; Llama a la interrupción 21H 
    ; Leer la entrada num1             
        mov AH, 1   ; Servicio de entrada para ingresar un número
        int 21H     ; Llama a la interrupción 21H
        sub AL, 30H ; El caracter 0 está en la posición 48 en ASCII, o 30H
        mov num1, AL; Mover la entrada hacia num1
    ; Imprimir mensaje 2
        mov AH, 9       ; Carga de la función (lo que hace, dirección del texto a imprimir)
        lea DX, mensaje2; Obtiene la dirección de memoria del mensaje 2 que queremos imprimir
        int 21H         ; Llama a la interrupción 21H 
    ; Leer la entrada num2             
        mov AH, 1   ; Servicio de entrada para ingresar un número
        int 21H     ; Llama a la interrupción 21H
        sub AL, 30H ; El caracter 0 está en la posición 48 en ASCII, o 30H
        mov num2, AL; Mover la entrada hacia num2
    ; Resta
        mov AL, num1
        sub AL, num2
        mov resta, AL
    ; Resultado
        mov AH, 9
        lea DX, mensajes
        int 21H
        mov DL, resta
        add DL, 30H
        mov AH, 2
        int 21H
        mov AH, 4CH
        int 21H