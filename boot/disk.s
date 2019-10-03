disk_load:
    pusha
    push dx

    mov ah, 0x02
    mov al, dh   ; number of sectors to read
    mov cl, 0x02 ; sector to read
                 ; 0x01 is the boot sector, 0x02 is first usable
    mov ch, 0x00
    mov dh, 0x00

    ; [es:bx] = pointer to data buffer
    int 0x13
    jc .disk_error

    pop dx
    cmp al, dh
    jne .sectors_error
    
    popa
    ret

.disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    jmp $

.sectors_error:
    mov bx, SECTORS_ERROR
    call print
    call print_nl
    jmp $

DISK_ERROR db 'Disk Error!', 0
SECTORS_ERROR db 'Sectors Error!', 0
