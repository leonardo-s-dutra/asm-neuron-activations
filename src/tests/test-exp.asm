section .data

x dq 5.0

section .text
    extern exp
    global _start

_start:
    movsd xmm0, qword [x]
    call exp

_end:
    mov rax, 60
    mov rdi, 0
    syscall
