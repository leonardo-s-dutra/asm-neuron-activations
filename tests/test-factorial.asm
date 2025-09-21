section .data

x dq 5

section .text
    extern factorial
    global _start

_start:
    mov rdi, qword [x]
    call factorial

_end:
    mov rax, 60
    mov rdi, 0
    syscall
