.text

.global _start
_start:
	movia   sp, 0x04000000
	movi r4, 1   #
	movi r5, 2   # we will set input param
	movi r6, 3   #
	call sum_two

	break

.global sum_two
sum_two:
  add r2, r4, r5
  ret

.data

