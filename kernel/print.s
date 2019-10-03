[bits 32]

; VGA text mode video memory constant
VIDEO_MEM equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; Kernel-mode print (via. VGA text mode)
kprint:
    pusha
    mov edx, VIDEO_MEM

.body:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je .end

    mov [edx], ax
    add ebx, 1
    add edx, 2

    jmp .body

.end:
    popa
    ret
