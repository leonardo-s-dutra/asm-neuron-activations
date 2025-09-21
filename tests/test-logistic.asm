section .data

x dq 3.0

section .text
extern logistic
global _start

_start:
    movsd xmm0, qword [x]
    call logistic

_end:
    mov rax, 60
    mov rdi, 0
    syscall
