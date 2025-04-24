
# Data Section:
reset:
	.fill 80
	.fill 114
	.fill 101
	.fill 115
	.fill 115
	.fill 32
	.fill 97
	.fill 110
	.fill 121
	.fill 32
	.fill 107
	.fill 101
	.fill 121
	.fill 32
	.fill 116
	.fill 111
	.fill 32
	.fill 114
	.fill 101
	.fill 115
	.fill 116
	.fill 97
	.fill 114
	.fill 116
	.fill 10
	.fill 0
quit:
	.fill 40
	.fill 113
	.fill 32
	.fill 116
	.fill 111
	.fill 32
	.fill 113
	.fill 117
	.fill 105
	.fill 116
	.fill 41
	.fill 10
	.fill 0
	.fill 0
	.fill 0
enter_digit:
	.fill 69
	.fill 110
	.fill 116
	.fill 101
	.fill 114
	.fill 32
	.fill 97
	.fill 32
	.fill 51
	.fill 32
	.fill 100
	.fill 105
	.fill 103
	.fill 105
	.fill 116
	.fill 32
	.fill 110
	.fill 117
	.fill 109
	.fill 98
	.fill 101
	.fill 114
	.fill 58
	.fill 0
	.fill 0
digits:
	.space 3

# Code Section:
next_collatz:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -9
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -2
	lw r3  r2  -1
	lw r4  r2  -2
	and r3  r3  r4 
	sw r3  r2  -3
	lw r3  r2  -3
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 next_collatz.else.6
	jalr r0  r3 
	lw r3  r2  -1
	lw r4  r2  -1
	add r3  r3  r4 
	sw r3  r2  -4
	lw r3  r2  -4
	lw r4  r2  -1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -7
	lw r3  r2  -7
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
	movi r3 next_collatz.end.9
	jalr r0  r3 
next_collatz.else.6:
	movi r3 1
	sw r3  r2  -8
	lw r3  r2  -1
	lw r4  r2  -8
	call right_shift
	sw r3  r2  -9
	lw r3  r2  -9
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
next_collatz.end.9:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
print_seq:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -50
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 67
	sw r3  r2  -5
	lw r3  r2  -5
	call putchar
	sw r3  r2  -6
	movi r3 111
	sw r3  r2  -7
	lw r3  r2  -7
	call putchar
	sw r3  r2  -8
	movi r3 108
	sw r3  r2  -9
	lw r3  r2  -9
	call putchar
	sw r3  r2  -10
	movi r3 108
	sw r3  r2  -11
	lw r3  r2  -11
	call putchar
	sw r3  r2  -12
	movi r3 97
	sw r3  r2  -13
	lw r3  r2  -13
	call putchar
	sw r3  r2  -14
	movi r3 116
	sw r3  r2  -15
	lw r3  r2  -15
	call putchar
	sw r3  r2  -16
	movi r3 122
	sw r3  r2  -17
	lw r3  r2  -17
	call putchar
	sw r3  r2  -18
	movi r3 58
	sw r3  r2  -19
	lw r3  r2  -19
	call putchar
	sw r3  r2  -20
	movi r3 10
	sw r3  r2  -21
	lw r3  r2  -21
	call putchar
	sw r3  r2  -22
	movi r3 10
	sw r3  r2  -23
	lw r3  r2  -23
	call putchar
	sw r3  r2  -24
print_seq.while.0.continue:
	movi r3 1
	sw r3  r2  -25
	movi r3 1
	sw r3  r2  -26
	lw r3  r2  -1
	lw r4  r2  -26
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 print_seq.end.31
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -25
print_seq.end.31:
	lw r3  r2  -25
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print_seq.while.0.break
	jalr r0  r3 
	lw r3  r2  -1
	call print_unsigned
	sw r3  r2  -27
	movi r3 44
	sw r3  r2  -28
	lw r3  r2  -28
	call putchar
	sw r3  r2  -29
	lw r3  r2  -1
	call next_collatz
	sw r3  r2  -30
	lw r3  r2  -30
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -31
	lw r3  r2  -1
	lw r4  r2  -2
	cmp r3  r4 
	ba 1
	jmp 3
	movi r3 print_seq.end.26
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -31
print_seq.end.26:
	lw r3  r2  -31
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print_seq.end.27
	jalr r0  r3 
	lw r3  r2  -1
	sw r3  r2  -2
print_seq.end.27:
	movi r3 1
	sw r3  r2  -32
	lw r3  r2  -4
	lw r4  r2  -32
	add r3  r3  r4 
	sw r3  r2  -4
	movi r3 print_seq.while.0.continue
	jalr r0  r3 
print_seq.while.0.break:
	lw r3  r2  -1
	call print_unsigned
	sw r3  r2  -33
	movi r3 10
	sw r3  r2  -34
	lw r3  r2  -34
	call putchar
	sw r3  r2  -35
	movi r3 10
	sw r3  r2  -36
	lw r3  r2  -36
	call putchar
	sw r3  r2  -37
	movi r3 77
	sw r3  r2  -38
	lw r3  r2  -38
	call putchar
	sw r3  r2  -39
	movi r3 97
	sw r3  r2  -40
	lw r3  r2  -40
	call putchar
	sw r3  r2  -41
	movi r3 120
	sw r3  r2  -42
	lw r3  r2  -42
	call putchar
	sw r3  r2  -43
	movi r3 58
	sw r3  r2  -44
	lw r3  r2  -44
	call putchar
	sw r3  r2  -45
	movi r3 32
	sw r3  r2  -46
	lw r3  r2  -46
	call putchar
	sw r3  r2  -47
	lw r3  r2  -2
	call print_unsigned
	sw r3  r2  -48
	movi r3 10
	sw r3  r2  -49
	lw r3  r2  -49
	call putchar
	sw r3  r2  -50
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
read_num:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -21
	movi r3 100
	sw r3  r2  -1
	movi r3 digits
	sw r3  r2  -2
	movi r3 0
	movi r4 1
	call smul
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r2  -3
	add r3  r3  r4 
	sw r3  r2  -4
	lw r3  r2  -4
	lw r4  r3  0
	sw r4  r2  -5
	lw r3  r2  -1
	lw r4  r2  -5
	call umul
	sw r3  r2  -6
	movi r3 10
	sw r3  r2  -7
	movi r3 digits
	sw r3  r2  -8
	movi r3 1
	movi r4 1
	call smul
	sw r3  r2  -9
	lw r3  r2  -8
	lw r4  r2  -9
	add r3  r3  r4 
	sw r3  r2  -10
	lw r3  r2  -10
	lw r4  r3  0
	sw r4  r2  -11
	lw r3  r2  -7
	lw r4  r2  -11
	call umul
	sw r3  r2  -12
	lw r3  r2  -6
	lw r4  r2  -12
	add r3  r3  r4 
	sw r3  r2  -13
	movi r3 digits
	sw r3  r2  -14
	movi r3 2
	movi r4 1
	call smul
	sw r3  r2  -15
	lw r3  r2  -14
	lw r4  r2  -15
	add r3  r3  r4 
	sw r3  r2  -16
	lw r3  r2  -16
	lw r4  r3  0
	sw r4  r2  -17
	lw r3  r2  -13
	lw r4  r2  -17
	add r3  r3  r4 
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -19
	lw r3  r2  -19
	sw r3  r2  -20
	lw r3  r2  -20
	sw r3  r2  -21
	lw r3  r2  -21
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
collatz_main:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -51
	call clear_screen
	sw r3  r2  -1
	movi r3 4080
	movi r4 819
	call write_text_tilemap_all
	sw r3  r2  -2
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 1
	sw r3  r2  -5
	lw r3  r2  -4
	lw r4  r2  -5
	sw r4  r3  0
	movi r3 enter_digit
	sw r3  r2  -6
	lw r3  r2  -6
	call print
	sw r3  r2  -7
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -4
collatz_main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.while.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
	movi r3 0
	sw r3  r2  -10
collatz_main.while.1.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.while.1.break
	jalr r0  r3 
	lw r3  r2  -4
	lw r4  r3  0
	sw r4  r2  -11
	lw r3  r2  -11
	sw r3  r2  -12
	lw r3  r2  -12
	sw r3  r2  -9
	movi r3 1
	sw r3  r2  -13
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 collatz_main.end.10
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
collatz_main.end.10:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.35
	jalr r0  r3 
	lw r3  r2  -9
	sw r3  r2  -14
	lw r3  r2  -14
	call putchar
	sw r3  r2  -15
	movi r3 1
	sw r3  r2  -16
	lw r3  r2  -9
	movi r4 113
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.14
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -16
collatz_main.end.14:
	lw r3  r2  -16
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.15
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
collatz_main.end.15:
	movi r3 1
	sw r3  r2  -17
	movi r3 1
	sw r3  r2  -18
	lw r3  r2  -9
	sw r3  r2  -19
	lw r3  r2  -19
	movi r4 ZERO_CHAR
	lw r4  r4  0
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 collatz_main.end.18
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -18
collatz_main.end.18:
	lw r3  r2  -18
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 collatz_main.end.25
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -20
	lw r3  r2  -9
	sw r3  r2  -21
	movi r3 9
	sw r3  r2  -22
	movi r3 ZERO_CHAR
	lw r3  r3  0
	lw r4  r2  -22
	add r3  r3  r4 
	sw r3  r2  -23
	lw r3  r2  -21
	lw r4  r2  -23
	cmp r3  r4 
	ba 1
	jmp 3
	movi r3 collatz_main.end.23
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -20
collatz_main.end.23:
	lw r3  r2  -20
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 collatz_main.end.25
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -17
collatz_main.end.25:
	lw r3  r2  -17
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.26
	jalr r0  r3 
	movi r3 collatz_main.end
	jalr r0  r3 
collatz_main.end.26:
	movi r3 digits
	sw r3  r2  -24
	lw r3  r2  -10
	movi r4 1
	call smul
	sw r3  r2  -25
	lw r3  r2  -24
	lw r4  r2  -25
	add r3  r3  r4 
	sw r3  r2  -26
	lw r3  r2  -9
	sw r3  r2  -27
	lw r3  r2  -27
	movi r4 ZERO_CHAR
	lw r4  r4  0
	sub r3  r3  r4 
	sw r3  r2  -28
	lw r3  r2  -26
	lw r4  r2  -28
	sw r4  r3  0
	lw r3  r2  -10
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -10
	movi r3 1
	sw r3  r2  -29
	lw r3  r2  -10
	movi r4 3
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.33
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
collatz_main.end.33:
	lw r3  r2  -29
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.34
	jalr r0  r3 
	movi r3 collatz_main.while.1.break
	jalr r0  r3 
collatz_main.end.34:
collatz_main.end.35:
	movi r3 collatz_main.while.1.continue
	jalr r0  r3 
collatz_main.while.1.break:
	call read_num
	sw r3  r2  -30
	lw r3  r2  -30
	sw r3  r2  -31
	movi r3 1
	sw r3  r2  -32
	movi r3 1
	sw r3  r2  -33
	lw r3  r2  -31
	lw r4  r2  -33
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 collatz_main.end.39
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -32
collatz_main.end.39:
	lw r3  r2  -32
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.40
	jalr r0  r3 
	movi r3 collatz_main.end
	jalr r0  r3 
collatz_main.end.40:
	movi r3 10
	sw r3  r2  -34
	lw r3  r2  -34
	call putchar
	sw r3  r2  -35
	movi r3 10
	sw r3  r2  -36
	lw r3  r2  -36
	call putchar
	sw r3  r2  -37
	lw r3  r2  -31
	call print_seq
	sw r3  r2  -38
	movi r3 10
	sw r3  r2  -39
	lw r3  r2  -39
	call putchar
	sw r3  r2  -40
	movi r3 reset
	sw r3  r2  -41
	lw r3  r2  -41
	call print
	sw r3  r2  -42
	movi r3 quit
	sw r3  r2  -43
	lw r3  r2  -43
	call print
	sw r3  r2  -44
collatz_main.while.2.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.while.2.break
	jalr r0  r3 
	lw r3  r2  -4
	lw r4  r3  0
	sw r4  r2  -45
	lw r3  r2  -45
	sw r3  r2  -46
	lw r3  r2  -46
	sw r3  r2  -9
	movi r3 1
	sw r3  r2  -47
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 collatz_main.end.55
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -47
collatz_main.end.55:
	lw r3  r2  -47
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.62
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -48
	lw r3  r2  -9
	movi r4 113
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.57
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -48
collatz_main.end.57:
	lw r3  r2  -48
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 collatz_main.end.58
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
collatz_main.end.58:
collatz_main.end:
	call clear_screen
	sw r3  r2  -49
	movi r3 enter_digit
	sw r3  r2  -50
	lw r3  r2  -50
	call print
	sw r3  r2  -51
	movi r3 collatz_main.while.2.break
	jalr r0  r3 
collatz_main.end.62:
	movi r3 collatz_main.while.2.continue
	jalr r0  r3 
collatz_main.while.2.break:
	movi r3 collatz_main.while.0.continue
	jalr r0  r3 
collatz_main.while.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
