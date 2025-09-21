section .data

x dq -3.0

section .text
extern relu
global _start

_start:
    movsd xmm0, qword [x]
    call relu

_end:
    mov rax, 60
    mov rdi, 0
    syscall
