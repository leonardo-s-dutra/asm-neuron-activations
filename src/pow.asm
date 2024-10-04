section .data

one dq 1.0

section .text
global pow

pow:
    movsd xmm1, qword [one]

    cmp rdi, 0
    je pow_end

    cmp rdi, 0
    jl compute_negative_exponent

compute_positive_exponent:
pow_loop:
    mulsd xmm1, xmm0
    dec rdi
    cmp rdi, 0
    jg pow_loop

    jmp pow_end

compute_negative_exponent:
    movsd xmm2, qword [one]
    divsd xmm2, xmm0
    movsd xmm0, xmm2
    neg rdi

    jmp pow_loop

pow_end:
    movsd xmm0, xmm1
    ret
