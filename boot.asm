org 0x7C00

use16

start:
    ; Установим стек
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    ; Очистка экрана
    mov ax, 0x03
    int 0x10

    ; Вывод строки
    mov si, message
print_char:
    lodsb
    or al, al
    jz hang
    mov ah, 0x0E
    int 0x10
    jmp print_char

hang:
    jmp hang

message db 'Hello, world!', 0

times 510-($-$$) db 0
dw 0xAA55
