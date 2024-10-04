section .data

one dq 1.0
two dq 2.0

section .text
extern exp
global tanh

tanh:
    mulsd xmm0, qword [two]
    call exp

    movsd xmm2, xmm0
    movsd xmm3, xmm0

    subsd xmm2, qword [one]
    addsd xmm3, qword [one]
    divsd xmm2, xmm3

tanh_end:
    movsd xmm0, xmm2
    ret
