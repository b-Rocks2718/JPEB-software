
# Data Section:
line_index:
	.fill 0
cursor_index:
	.fill 0
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
	addi r1  r1  -34
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
	movi r3 1
	sw r3  r2  -11
	movi r3 10
	sw r3  r2  -12
	lw r3  r2  -1
	lw r4  r2  -12
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -11
putchar.end.9:
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 putchar.end.14
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -13
	movi r3 13
	sw r3  r2  -14
	lw r3  r2  -1
	lw r4  r2  -14
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.12
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
putchar.end.12:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 putchar.end.14
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -10
putchar.end.14:
	lw r3  r2  -10
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.18
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -15
	lw r3  r2  -15
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 line_index
	lw r3  r3  0
	sw r3  r2  -16
	movi r3 line_index
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 line_index
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -17
	lw r3  r2  -17
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
putchar.end.18:
	movi r3 1
	sw r3  r2  -18
	movi r3 cursor_index
	lw r3  r3  0
	lw r4  r2  -18
	and r3  r3  r4 
	sw r3  r2  -19
	lw r3  r2  -19
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.else.25
	jalr r0  r3 
	lw r3  r2  -9
	lw r4  r3  0
	sw r4  r2  -20
	movi r3 8
	sw r3  r2  -21
	lw r3  r2  -1
	lw r4  r2  -21
	call left_shift
	sw r3  r2  -22
	lw r3  r2  -20
	lw r4  r2  -22
	or r3  r3  r4 
	sw r3  r2  -23
	lw r3  r2  -9
	lw r4  r2  -23
	sw r4  r3  0
	movi r3 putchar.end.26
	jalr r0  r3 
putchar.else.25:
	lw r3  r2  -9
	lw r4  r2  -1
	sw r4  r3  0
putchar.end.26:
	movi r3 cursor_index
	lw r3  r3  0
	sw r3  r2  -24
	movi r3 cursor_index
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -25
	lw r3  r2  -25
	sw r3  r2  -9
	lw r3  r2  -9
	lw r4  r3  0
	sw r4  r2  -26
	lw r3  r2  -26
	sw r3  r2  -27
	lw r3  r2  -27
	sw r3  r2  -28
	movi r3 60
	lw r4  r2  -28
	call right_shift
	sw r3  r2  -29
	lw r3  r2  -29
	sw r3  r2  -30
	movi r3 1
	sw r3  r2  -31
	lw r3  r2  -30
	sw r3  r2  -32
	movi r3 cursor_index
	lw r3  r3  0
	lw r4  r2  -32
	cmp r3  r4 
	bae 1
	jmp 3
	movi r3 putchar.end.34
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -31
putchar.end.34:
	lw r3  r2  -31
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 putchar.end.37
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -33
	lw r3  r2  -33
	movi r4 cursor_index
	sw r3  r4  0
	movi r3 line_index
	lw r3  r3  0
	sw r3  r2  -34
	movi r3 line_index
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 line_index
	sw r3  r4  0
putchar.end.37:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
print_unsigned:
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
	movi r3 print_unsigned.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
print_unsigned.end.6:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print_unsigned.end.8
	jalr r0  r3 
	lw r3  r2  -1
	call print_unsigned
	sw r3  r2  -9
print_unsigned.end.8:
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
reset_cursor:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -2
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
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
clear:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -2
	call reset_cursor
	sw r3  r2  -1
	call clear_screen
	sw r3  r2  -2
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
print:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -7
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
print.for.0.start:
	movi r3 1
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r3  0
	sw r4  r2  -4
	movi r3 0
	sw r3  r2  -5
	lw r3  r2  -4
	lw r4  r2  -5
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 print.end.5
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -3
print.end.5:
	lw r3  r2  -3
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 print.for.0.break
	jalr r0  r3 
	lw r3  r2  -2
	lw r4  r3  0
	sw r4  r2  -6
	lw r3  r2  -6
	call putchar
	sw r3  r2  -7
print.for.0.continue:
	lw r3  r2  -2
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 print.for.0.start
	jalr r0  r3 
print.for.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
