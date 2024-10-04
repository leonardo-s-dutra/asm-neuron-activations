section .data

zero dq 0.0

section .text
global relu

relu:
    ucomisd xmm0, qword [zero]
    jae relu_end

    movsd xmm0, qword [zero]

relu_end:
    ret
