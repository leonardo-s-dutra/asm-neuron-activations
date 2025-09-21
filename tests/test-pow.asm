section .data

base dq 3.0
exponent dq 4

section .text
    extern pow
    global _start

_start:
    movsd xmm0, qword [base]
    mov rdi, qword [exponent] 
    call pow

_end:
    mov rax, 60
    mov rdi, 0
    syscall
