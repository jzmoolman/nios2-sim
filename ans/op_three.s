op_three:
    # Prologue (save return address)
    subi    sp, sp, 4
    stw     ra, 0(sp)

    # ---- First call: op_two(a, b) ----
    call    op_two        # r2 = a + b

    # Prepare second call arguments
    mov     r4, r2        # first argument = result
    mov     r5, r6        # second argument = c

    # ---- Second call: op_two(result, c) ----
    call    op_two        # r2 = result + c

    # Epilogue (restore return address)
    ldw     ra, 0(sp)
    addi    sp, sp, 4

    ret
    

