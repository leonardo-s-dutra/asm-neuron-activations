section .data

one dq 1.0
no_of_terms equ 20

section .text
extern pow
extern factorial
global exp

exp:
    movsd xmm1, qword [one]
    movsd xmm4, xmm0
    mov r12, 1

exp_loop:
    cmp r12, no_of_terms
    je exp_end

    sub rsp, 16
    movdqu [rsp], xmm1

    movsd xmm0, xmm4
    
    mov rdi, r12
    call pow
    movsd xmm2, xmm0

    movdqu xmm1, [rsp]
    add rsp, 16

    mov rdi, r12
    call factorial
    cvtsi2sd xmm3, rax

    divsd xmm2, xmm3
    addsd xmm1, xmm2
    inc r12

    jmp exp_loop

exp_end:
    movsd xmm0, xmm1
    ret
