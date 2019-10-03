[org 0x7c00]
    mov bp, 0x8000 ; far off stack so it doesn't interfere
    mov sp, bp

    mov bx, MESSAGE
    call print

    call switch_to_pm

    jmp $

%include "boot/print.s"
; %include "boot/print_hex.s"
; %include "boot/disk.s"
%include "kernel/gdt.s"
%include "kernel/print.s"
%include "kernel/protected.s"

[bits 32]
KMAIN:
    mov ebx, PROTMODE
    call kprint
    jmp $

MESSAGE db "Popcorn bootloader", 0
PROTMODE db "Entered Protected Mode", 0

; Magic number
times 510 - ($-$$) db 0
dw 0xaa55
