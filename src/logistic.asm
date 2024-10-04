section .data
    positive_one dq 1.0
    negative_one dq -1.0

section .text
extern exp
global logistic

logistic:
    mulsd xmm0, qword [negative_one]
    call exp

    movsd xmm1, qword [positive_one]
    addsd xmm1, xmm0

    movsd xmm2, qword [positive_one]
    divsd xmm2, xmm1

logistic_end:
    movsd xmm0, xmm2
    ret
