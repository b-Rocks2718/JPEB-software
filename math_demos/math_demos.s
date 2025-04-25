	movi r3 main
	jalr r0  r3 

# Data Section:
option3:
	.fill 32
	.fill 32
	.fill 67
	.fill 111
	.fill 110
	.fill 119
	.fill 97
	.fill 121
	.fill 39
	.fill 115
	.fill 32
	.fill 71
	.fill 97
	.fill 109
	.fill 101
	.fill 32
	.fill 111
	.fill 102
	.fill 32
	.fill 76
	.fill 105
	.fill 102
	.fill 101
	.fill 0
option2:
	.fill 32
	.fill 32
	.fill 77
	.fill 97
	.fill 110
	.fill 100
	.fill 101
	.fill 108
	.fill 98
	.fill 114
	.fill 111
	.fill 116
	.fill 32
	.fill 83
	.fill 101
	.fill 116
	.fill 10
	.fill 0
option1:
	.fill 32
	.fill 32
	.fill 67
	.fill 111
	.fill 108
	.fill 108
	.fill 97
	.fill 116
	.fill 122
	.fill 32
	.fill 83
	.fill 101
	.fill 113
	.fill 117
	.fill 101
	.fill 110
	.fill 99
	.fill 101
	.fill 115
	.fill 10
	.fill 0
math:
	.fill 77
	.fill 97
	.fill 116
	.fill 104
	.fill 32
	.fill 68
	.fill 101
	.fill 109
	.fill 111
	.fill 115
	.fill 33
	.fill 10
	.fill 10
	.fill 0

# Code Section:
update_selector:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -42
	sw r3  r2  -1
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	sw r3  r2  -2
	lw r3  r2  -2
	sw r3  r2  -3
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 update_selector.end.2
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
update_selector.end.2:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 update_selector.else.15
	jalr r0  r3 
	movi r3 64
	movi r4 2
	call smul
	sw r3  r2  -5
	lw r3  r2  -5
	movi r4 1
	call smul
	sw r3  r2  -6
	lw r3  r2  -3
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -7
	movi r3 62
	sw r3  r2  -8
	lw r3  r2  -7
	lw r4  r2  -8
	sw r4  r3  0
	movi r3 64
	movi r4 3
	call smul
	sw r3  r2  -9
	lw r3  r2  -9
	movi r4 1
	call smul
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -11
	movi r3 0
	sw r3  r2  -12
	lw r3  r2  -11
	lw r4  r2  -12
	sw r4  r3  0
	movi r3 64
	movi r4 4
	call smul
	sw r3  r2  -13
	lw r3  r2  -13
	movi r4 1
	call smul
	sw r3  r2  -14
	lw r3  r2  -3
	lw r4  r2  -14
	add r3  r3  r4 
	sw r3  r2  -15
	movi r3 0
	sw r3  r2  -16
	lw r3  r2  -15
	lw r4  r2  -16
	sw r4  r3  0
	movi r3 update_selector.end.47
	jalr r0  r3 
update_selector.else.15:
	movi r3 1
	sw r3  r2  -17
	lw r3  r2  -1
	movi r4 1
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 update_selector.end.17
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -17
update_selector.end.17:
	lw r3  r2  -17
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 update_selector.else.30
	jalr r0  r3 
	movi r3 64
	movi r4 2
	call smul
	sw r3  r2  -18
	lw r3  r2  -18
	movi r4 1
	call smul
	sw r3  r2  -19
	lw r3  r2  -3
	lw r4  r2  -19
	add r3  r3  r4 
	sw r3  r2  -20
	movi r3 0
	sw r3  r2  -21
	lw r3  r2  -20
	lw r4  r2  -21
	sw r4  r3  0
	movi r3 64
	movi r4 3
	call smul
	sw r3  r2  -22
	lw r3  r2  -22
	movi r4 1
	call smul
	sw r3  r2  -23
	lw r3  r2  -3
	lw r4  r2  -23
	add r3  r3  r4 
	sw r3  r2  -24
	movi r3 62
	sw r3  r2  -25
	lw r3  r2  -24
	lw r4  r2  -25
	sw r4  r3  0
	movi r3 64
	movi r4 4
	call smul
	sw r3  r2  -26
	lw r3  r2  -26
	movi r4 1
	call smul
	sw r3  r2  -27
	lw r3  r2  -3
	lw r4  r2  -27
	add r3  r3  r4 
	sw r3  r2  -28
	movi r3 0
	sw r3  r2  -29
	lw r3  r2  -28
	lw r4  r2  -29
	sw r4  r3  0
	movi r3 update_selector.end.46
	jalr r0  r3 
update_selector.else.30:
	movi r3 1
	sw r3  r2  -30
	lw r3  r2  -1
	movi r4 2
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 update_selector.end.32
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -30
update_selector.end.32:
	lw r3  r2  -30
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 update_selector.end.45
	jalr r0  r3 
	movi r3 64
	movi r4 2
	call smul
	sw r3  r2  -31
	lw r3  r2  -31
	movi r4 1
	call smul
	sw r3  r2  -32
	lw r3  r2  -3
	lw r4  r2  -32
	add r3  r3  r4 
	sw r3  r2  -33
	movi r3 0
	sw r3  r2  -34
	lw r3  r2  -33
	lw r4  r2  -34
	sw r4  r3  0
	movi r3 64
	movi r4 3
	call smul
	sw r3  r2  -35
	lw r3  r2  -35
	movi r4 1
	call smul
	sw r3  r2  -36
	lw r3  r2  -3
	lw r4  r2  -36
	add r3  r3  r4 
	sw r3  r2  -37
	movi r3 0
	sw r3  r2  -38
	lw r3  r2  -37
	lw r4  r2  -38
	sw r4  r3  0
	movi r3 64
	movi r4 4
	call smul
	sw r3  r2  -39
	lw r3  r2  -39
	movi r4 1
	call smul
	sw r3  r2  -40
	lw r3  r2  -3
	lw r4  r2  -40
	add r3  r3  r4 
	sw r3  r2  -41
	movi r3 62
	sw r3  r2  -42
	lw r3  r2  -41
	lw r4  r2  -42
	sw r4  r3  0
update_selector.end.45:
update_selector.end.46:
update_selector.end.47:
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
	addi r1  r1  -44
main.start:
	call clear
	sw r3  r2  -1
	movi r3 240
	movi r4 273
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
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -6
	lw r3  r2  -6
	sw r3  r2  -4
	movi r3 0
	sw r3  r2  -7
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -9
	movi r3 math
	sw r3  r2  -10
	lw r3  r2  -10
	call print
	sw r3  r2  -11
	movi r3 option1
	sw r3  r2  -12
	lw r3  r2  -12
	call print
	sw r3  r2  -13
	movi r3 option2
	sw r3  r2  -14
	lw r3  r2  -14
	call print
	sw r3  r2  -15
	movi r3 option3
	sw r3  r2  -16
	lw r3  r2  -16
	call print
	sw r3  r2  -17
	movi r3 0
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -19
main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.0.break
	jalr r0  r3 
	lw r3  r2  -7
	call update_selector
	sw r3  r2  -20
	call getKey
	sw r3  r2  -21
	lw r3  r2  -21
	sw r3  r2  -19
	movi r3 1
	sw r3  r2  -22
	movi r3 0
	sw r3  r2  -23
	lw r3  r2  -19
	lw r4  r2  -23
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.19
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -22
main.end.19:
	lw r3  r2  -22
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.21
	jalr r0  r3 
	lw r3  r2  -19
	call serialWrite
	sw r3  r2  -24
main.end.21:
	movi r3 1
	sw r3  r2  -25
	movi r3 115
	sw r3  r2  -26
	lw r3  r2  -19
	lw r4  r2  -26
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.24
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -25
main.end.24:
	lw r3  r2  -25
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.else.27
	jalr r0  r3 
	lw r3  r2  -7
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -27
	lw r3  r2  -27
	movi r4 3
	call smod
	sw r3  r2  -28
	lw r3  r2  -28
	sw r3  r2  -7
	movi r3 main.end.34
	jalr r0  r3 
main.else.27:
	movi r3 1
	sw r3  r2  -29
	movi r3 119
	sw r3  r2  -30
	lw r3  r2  -19
	lw r4  r2  -30
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.30
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
main.end.30:
	lw r3  r2  -29
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.33
	jalr r0  r3 
	lw r3  r2  -7
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -31
	lw r3  r2  -31
	movi r4 3
	call smod
	sw r3  r2  -32
	lw r3  r2  -32
	sw r3  r2  -7
main.end.33:
main.end.34:
	movi r3 1
	sw r3  r2  -33
	movi r3 1
	sw r3  r2  -34
	movi r3 13
	sw r3  r2  -35
	lw r3  r2  -19
	lw r4  r2  -35
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.37
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -34
main.end.37:
	lw r3  r2  -34
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.42
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -36
	movi r3 10
	sw r3  r2  -37
	lw r3  r2  -19
	lw r4  r2  -37
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.40
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -36
main.end.40:
	lw r3  r2  -36
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.42
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -33
main.end.42:
	lw r3  r2  -33
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.54
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -38
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.44
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -38
main.end.44:
	lw r3  r2  -38
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.else.46
	jalr r0  r3 
	call collatz_main
	sw r3  r2  -39
	movi r3 main.start
	jalr r0  r3 
	movi r3 main.end.53
	jalr r0  r3 
main.else.46:
	movi r3 1
	sw r3  r2  -40
	lw r3  r2  -7
	movi r4 1
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.48
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -40
main.end.48:
	lw r3  r2  -40
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.else.50
	jalr r0  r3 
	call mandelbrot_main
	sw r3  r2  -41
	movi r3 main.start
	jalr r0  r3 
	movi r3 main.end.52
	jalr r0  r3 
main.else.50:
	call life_main
	sw r3  r2  -42
	movi r3 main.start
	jalr r0  r3 
main.end.52:
main.end.53:
main.end.54:
	movi r3 1
	sw r3  r2  -43
	movi r3 113
	sw r3  r2  -44
	lw r3  r2  -19
	lw r4  r2  -44
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.57
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -43
main.end.57:
	lw r3  r2  -43
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.58
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	sys EXIT
main.end.58:
	movi r3 main.while.0.continue
	jalr r0  r3 
main.while.0.break:
	movi r3 0
	# Function Epilogue
	sys EXIT
