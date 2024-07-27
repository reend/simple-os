org 0x7C00

start:
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ah, 0x00
    mov al, 0x03
    int 0x10

    mov ah, 0x0E
    mov al, 'H'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, ','
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 'w'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'd'
    int 0x10
    mov al, '!'
    int 0x10

hang:
    jmp hang

times 510-($-$$) db 0
dw 0xAA55 
