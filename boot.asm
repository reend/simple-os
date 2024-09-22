org 0x7C00

use16

start:
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ax, 0x03
    int 0x10

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

message db 'Booting...', 0

times 510-($-$$) db 0
dw 0xAA55
