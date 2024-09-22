org 0x7C00
use16

KERNEL_OFFSET equ 0x1000  ; Address where we'll load the kernel in the future

start:
    ; Set up the stack
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    ; Clear the screen
    mov ax, 0x03
    int 0x10

    ; Print welcome message
    mov si, HELLO_MSG
    call print_string

    ; Here we'll load the kernel in the future
    ; mov bx, KERNEL_OFFSET
    ; mov dh, 15  ; Read 15 sectors (7.5 KB)
    ; mov dl, [BOOT_DRIVE]
    ; call disk_load

    ; Infinite loop
    jmp $

; Function to print a string
print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_string
done:
    ret

; Data
HELLO_MSG db 'Hello from bootloader!', 0x0D, 0x0A, 'Ready for OS development!', 0
BOOT_DRIVE db 0

times 510-($-$$) db 0
dw 0xAA55