	movi r3 main
	jalr r0  r3 

# Data Section:
digits:
	.space 3
line_index:
	.fill 0
cursor_index:
	.fill 0
INPUT_STREAM:
	.fill 65535
RESOLUTION_REG:
	.fill 65532
FRAMEBUFFER_START:
	.fill 57344
ZERO_CHAR:
	.fill 48

# Code Section:
putchar:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -25
	sw r3  r2  -1
	movi r3 64
	sw r3  r2  -2
	lw r3  r2  -2
	movi r4 line_index
	lw r4  r4  0
	call umul
	sw r3  r2  -3
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	lw r4  r2  -3
	add r3  r3  r4 
	sw r3  r2  -4
	movi r3 2
	sw r3  r2  -5
	movi r3 cursor_index
	lw r3  r3  0
	lw r4  r2  -5
	call udiv
	sw r3  r2  -6
	lw r3  r2  -4
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -7
	lw r3  r2  -7
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -9
	movi r3 1
	sw r3  r2  -10
	movi r3 10
	sw r3  r2  -11
	lw r3  r2  -1
	lw r4  r2  -11
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -10
putchar.end.9:
	lw r3  r2  -10
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.13
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -12
	lw r3  r2  -12
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 line_index
	lw r3  r3  0
	sw r3  r2  -13
	movi r3 line_index
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 line_index
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -14
	lw r3  r2  -14
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
putchar.end.13:
	movi r3 1
	sw r3  r2  -15
	movi r3 cursor_index
	lw r3  r3  0
	lw r4  r2  -15
	and r3  r3  r4 
	sw r3  r2  -16
	lw r3  r2  -16
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.else.20
	jalr r0  r3 
	lw r3  r2  -9
	lw r4  r3  0
	sw r4  r2  -17
	movi r3 8
	sw r3  r2  -18
	lw r3  r2  -1
	lw r4  r2  -18
	call left_shift
	sw r3  r2  -19
	lw r3  r2  -17
	lw r4  r2  -19
	or r3  r3  r4 
	sw r3  r2  -20
	lw r3  r2  -9
	lw r4  r2  -20
	sw r4  r3  0
	movi r3 putchar.end.21
	jalr r0  r3 
putchar.else.20:
	lw r3  r2  -9
	lw r4  r2  -1
	sw r4  r3  0
putchar.end.21:
	movi r3 cursor_index
	lw r3  r3  0
	sw r3  r2  -21
	movi r3 cursor_index
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -22
	movi r3 40
	sw r3  r2  -23
	movi r3 cursor_index
	lw r3  r3  0
	lw r4  r2  -23
	cmp r3  r4 
	bae 1
	jmp 3
	movi r3 putchar.end.25
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -22
putchar.end.25:
	lw r3  r2  -22
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.28
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -24
	lw r3  r2  -24
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 line_index
	lw r3  r3  0
	sw r3  r2  -25
	movi r3 line_index
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 line_index
	sw r3  r4  0
putchar.end.28:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
print_unisgned:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -11
	sw r3  r2  -1
	movi r3 10
	sw r3  r2  -2
	lw r3  r2  -1
	lw r4  r2  -2
	call umod
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 10
	sw r3  r2  -5
	lw r3  r2  -1
	lw r4  r2  -5
	call udiv
	sw r3  r2  -6
	lw r3  r2  -6
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -7
	movi r3 0
	sw r3  r2  -8
	lw r3  r2  -1
	lw r4  r2  -8
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 print_unisgned.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
print_unisgned.end.6:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print_unisgned.end.8
	jalr r0  r3 
	lw r3  r2  -1
	call print_unisgned
	sw r3  r2  -9
print_unisgned.end.8:
	movi r3 ZERO_CHAR
	lw r3  r3  0
	lw r4  r2  -4
	add r3  r3  r4 
	sw r3  r2  -10
	lw r3  r2  -10
	call putchar
	sw r3  r2  -11
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
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
	addi r1  r1  -46
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
print_seq.while.0.continue:
	movi r3 1
	sw r3  r2  -23
	movi r3 1
	sw r3  r2  -24
	lw r3  r2  -1
	lw r4  r2  -24
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 print_seq.end.29
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
print_seq.end.29:
	lw r3  r2  -23
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print_seq.while.0.break
	jalr r0  r3 
	lw r3  r2  -1
	call print_unisgned
	sw r3  r2  -25
	movi r3 44
	sw r3  r2  -26
	lw r3  r2  -26
	call putchar
	sw r3  r2  -27
	lw r3  r2  -1
	call next_collatz
	sw r3  r2  -28
	lw r3  r2  -28
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -29
	lw r3  r2  -1
	lw r4  r2  -2
	cmp r3  r4 
	ba 1
	jmp 3
	movi r3 print_seq.end.24
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
print_seq.end.24:
	lw r3  r2  -29
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print_seq.end.25
	jalr r0  r3 
	lw r3  r2  -1
	sw r3  r2  -2
print_seq.end.25:
	movi r3 1
	sw r3  r2  -30
	lw r3  r2  -4
	lw r4  r2  -30
	add r3  r3  r4 
	sw r3  r2  -4
	movi r3 print_seq.while.0.continue
	jalr r0  r3 
print_seq.while.0.break:
	lw r3  r2  -1
	call print_unisgned
	sw r3  r2  -31
	movi r3 10
	sw r3  r2  -32
	lw r3  r2  -32
	call putchar
	sw r3  r2  -33
	movi r3 10
	sw r3  r2  -34
	lw r3  r2  -34
	call putchar
	sw r3  r2  -35
	movi r3 77
	sw r3  r2  -36
	lw r3  r2  -36
	call putchar
	sw r3  r2  -37
	movi r3 97
	sw r3  r2  -38
	lw r3  r2  -38
	call putchar
	sw r3  r2  -39
	movi r3 120
	sw r3  r2  -40
	lw r3  r2  -40
	call putchar
	sw r3  r2  -41
	movi r3 58
	sw r3  r2  -42
	lw r3  r2  -42
	call putchar
	sw r3  r2  -43
	movi r3 32
	sw r3  r2  -44
	lw r3  r2  -44
	call putchar
	sw r3  r2  -45
	lw r3  r2  -2
	call print_unisgned
	sw r3  r2  -46
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
	movi r3 2
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
	movi r3 0
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
clear_screen:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -9
	movi r3 0
	sw r3  r2  -1
	lw r3  r2  -1
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -2
	lw r3  r2  -2
	movi r4 line_index
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -3
clear_screen.for.0.start:
	movi r3 1
	sw r3  r2  -4
	movi r3 60
	movi r4 80
	call smul
	sw r3  r2  -5
	lw r3  r2  -3
	lw r4  r2  -5
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 clear_screen.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
clear_screen.end.6:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 clear_screen.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
	lw r3  r2  -6
	call putchar
	sw r3  r2  -7
clear_screen.for.0.continue:
	lw r3  r2  -3
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -3
	movi r3 clear_screen.for.0.start
	jalr r0  r3 
clear_screen.for.0.break:
	movi r3 0
	sw r3  r2  -8
	lw r3  r2  -8
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -9
	lw r3  r2  -9
	movi r4 line_index
	sw r3  r4  0
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
main:
	movi r1 40959
	movi r2 40959
	addi r1  r1  -27
	call write_tilemap
	sw r3  r2  -1
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -2
	lw r3  r2  -2
	sw r3  r2  -3
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -3
	lw r4  r2  -4
	sw r4  r3  0
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -5
	lw r3  r2  -5
	sw r3  r2  -3
main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
	movi r3 0
	sw r3  r2  -7
main.while.1.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.1.break
	jalr r0  r3 
	lw r3  r2  -3
	lw r4  r3  0
	sw r4  r2  -8
	lw r3  r2  -8
	sw r3  r2  -9
	lw r3  r2  -9
	sw r3  r2  -6
	movi r3 1
	sw r3  r2  -10
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.7
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -10
main.end.7:
	lw r3  r2  -10
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.18
	jalr r0  r3 
	lw r3  r2  -6
	sw r3  r2  -11
	lw r3  r2  -11
	call putchar
	sw r3  r2  -12
	movi r3 digits
	sw r3  r2  -13
	lw r3  r2  -7
	movi r4 1
	call smul
	sw r3  r2  -14
	lw r3  r2  -13
	lw r4  r2  -14
	add r3  r3  r4 
	sw r3  r2  -15
	lw r3  r2  -6
	sw r3  r2  -16
	lw r3  r2  -16
	movi r4 ZERO_CHAR
	lw r4  r4  0
	sub r3  r3  r4 
	sw r3  r2  -17
	lw r3  r2  -15
	lw r4  r2  -17
	sw r4  r3  0
	lw r3  r2  -7
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -7
	movi r3 1
	sw r3  r2  -18
	lw r3  r2  -7
	movi r4 3
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.16
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -18
main.end.16:
	lw r3  r2  -18
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.17
	jalr r0  r3 
	movi r3 main.while.1.break
	jalr r0  r3 
main.end.17:
main.end.18:
	movi r3 main.while.1.continue
	jalr r0  r3 
main.while.1.break:
	call read_num
	sw r3  r2  -19
	lw r3  r2  -19
	sw r3  r2  -20
	movi r3 10
	sw r3  r2  -21
	lw r3  r2  -21
	call putchar
	sw r3  r2  -22
	lw r3  r2  -20
	call print_seq
	sw r3  r2  -23
main.while.2.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.2.break
	jalr r0  r3 
	lw r3  r2  -3
	lw r4  r3  0
	sw r4  r2  -24
	lw r3  r2  -24
	sw r3  r2  -25
	lw r3  r2  -25
	sw r3  r2  -6
	movi r3 1
	sw r3  r2  -26
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.26
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -26
main.end.26:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.28
	jalr r0  r3 
	call clear_screen
	sw r3  r2  -27
	movi r3 main.while.2.break
	jalr r0  r3 
main.end.28:
	movi r3 main.while.2.continue
	jalr r0  r3 
main.while.2.break:
	movi r3 main.while.0.continue
	jalr r0  r3 
main.while.0.break:
	movi r3 0
	# Function Epilogue
	sys EXIT
