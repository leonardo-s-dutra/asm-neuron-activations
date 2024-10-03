section .text
global factorial

factorial:
    cmp rdi, 1
    jg factorial_compute

    mov rax, 1
    jmp factorial_end

factorial_compute:
    mov rax, 1
    mov rcx, 2

factorial_loop:
    cmp rcx, rdi
    jg factorial_end

    imul rax, rcx
    inc rcx
    jmp factorial_loop

factorial_end:
    ret
