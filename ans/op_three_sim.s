
	.text

.global _start
_start:
	movia   sp, 0x04000000
	movi r4, 1   #
	movi r5, 2   # we will set input param
	movi r6, 3   #
	call op_three

	break

	.text

.text
    op_two_add:
      add     r2, r4, r5
      ret


    op_two_mul:
      mul r2, r4, r5
      ret

    op_two:
      # Prologue (save return address)
      subi    sp, sp, 4
      stw     ra, 0(sp)
    

      cmpeqi r10, r7, 0
      movi   r11, 1
    

      beq    r10, r11,  1f 
      br 2f

    1:
      call op_two_add
      br done
      
    
    2:  
    call op_two_mul
    br done

    done:
      # Epilogue (restore return address)
      ldw     ra, 0(sp)
      addi    sp, sp, 4
      ret


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
