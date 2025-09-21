section .data

x dq -2.0

section .text
extern tanh
global _start

_start:
    movsd xmm0, qword [x]
    call tanh

_end:
    mov rax, 60
    mov rdi, 0
    syscall
