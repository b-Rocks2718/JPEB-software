
# Data Section:
next_erase.12:
	.fill 1
erase.11:
	.fill 1
cur_y.10:
	.fill 1
cur_x.9:
	.fill 5
FRAMEBUFFER_BUFFER:
	.fill 24576

# Code Section:
setup_loop:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -62
setup_loop.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.while.0.break
	jalr r0  r3 
	call waitKey
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	lw r3  r2  -2
	sw r3  r2  -3
	movi r3 0
	sw r3  r2  -4
	movi r3 1
	sw r3  r2  -5
	lw r3  r2  -3
	movi r4 113
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.3
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
setup_loop.end.3:
	lw r3  r2  -5
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.4
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
	movi r3 setup_loop.end.42
	jalr r0  r3 
setup_loop.else.4:
	movi r3 0
	sw r3  r2  -6
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -3
	movi r4 119
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
setup_loop.end.6:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.10
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -8
	movi r3 cur_y.10
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 setup_loop.end.8
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
setup_loop.end.8:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.10
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -6
setup_loop.end.10:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.22
	jalr r0  r3 
	movi r3 erase.11
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.15
	jalr r0  r3 
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -9
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -10
	movi r3 0
	sw r3  r2  -11
	lw r3  r2  -9
	lw r4  r2  -10
	lw r5  r2  -11
	call draw_pixel
	sw r3  r2  -12
	movi r3 setup_loop.end.20
	jalr r0  r3 
setup_loop.else.15:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -13
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -14
	movi r3 1
	sw r3  r2  -15
	lw r3  r2  -13
	lw r4  r2  -14
	lw r5  r2  -15
	call draw_pixel
	sw r3  r2  -16
setup_loop.end.20:
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -17
	movi r3 cur_y.10
	lw r3  r3  0
	movi r4 1
	sub r3  r3  r4 
	movi r4 cur_y.10
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -4
	movi r3 setup_loop.end.41
	jalr r0  r3 
setup_loop.else.22:
	movi r3 0
	sw r3  r2  -18
	movi r3 1
	sw r3  r2  -19
	lw r3  r2  -3
	movi r4 115
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.24
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -19
setup_loop.end.24:
	lw r3  r2  -19
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.28
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -20
	movi r3 cur_y.10
	lw r3  r3  0
	movi r4 59
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 setup_loop.end.26
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -20
setup_loop.end.26:
	lw r3  r2  -20
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.28
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -18
setup_loop.end.28:
	lw r3  r2  -18
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.40
	jalr r0  r3 
	movi r3 erase.11
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.33
	jalr r0  r3 
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -21
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -22
	movi r3 0
	sw r3  r2  -23
	lw r3  r2  -21
	lw r4  r2  -22
	lw r5  r2  -23
	call draw_pixel
	sw r3  r2  -24
	movi r3 setup_loop.end.38
	jalr r0  r3 
setup_loop.else.33:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -25
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	lw r3  r2  -25
	lw r4  r2  -26
	lw r5  r2  -27
	call draw_pixel
	sw r3  r2  -28
setup_loop.end.38:
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -29
	movi r3 cur_y.10
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 cur_y.10
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -4
setup_loop.end.40:
setup_loop.end.41:
setup_loop.end.42:
	movi r3 0
	sw r3  r2  -30
	movi r3 1
	sw r3  r2  -31
	lw r3  r2  -3
	movi r4 97
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.44
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -31
setup_loop.end.44:
	lw r3  r2  -31
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.48
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -32
	movi r3 cur_x.9
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 setup_loop.end.46
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -32
setup_loop.end.46:
	lw r3  r2  -32
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.48
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -30
setup_loop.end.48:
	lw r3  r2  -30
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.60
	jalr r0  r3 
	movi r3 erase.11
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.53
	jalr r0  r3 
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -33
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -34
	movi r3 0
	sw r3  r2  -35
	lw r3  r2  -33
	lw r4  r2  -34
	lw r5  r2  -35
	call draw_pixel
	sw r3  r2  -36
	movi r3 setup_loop.end.58
	jalr r0  r3 
setup_loop.else.53:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -37
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -38
	movi r3 1
	sw r3  r2  -39
	lw r3  r2  -37
	lw r4  r2  -38
	lw r5  r2  -39
	call draw_pixel
	sw r3  r2  -40
setup_loop.end.58:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -41
	movi r3 cur_x.9
	lw r3  r3  0
	movi r4 1
	sub r3  r3  r4 
	movi r4 cur_x.9
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -4
	movi r3 setup_loop.end.93
	jalr r0  r3 
setup_loop.else.60:
	movi r3 0
	sw r3  r2  -42
	movi r3 1
	sw r3  r2  -43
	lw r3  r2  -3
	movi r4 100
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.62
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -43
setup_loop.end.62:
	lw r3  r2  -43
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.66
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -44
	movi r3 cur_x.9
	lw r3  r3  0
	movi r4 79
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 setup_loop.end.64
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -44
setup_loop.end.64:
	lw r3  r2  -44
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.66
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -42
setup_loop.end.66:
	lw r3  r2  -42
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.78
	jalr r0  r3 
	movi r3 erase.11
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.71
	jalr r0  r3 
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -45
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -46
	movi r3 0
	sw r3  r2  -47
	lw r3  r2  -45
	lw r4  r2  -46
	lw r5  r2  -47
	call draw_pixel
	sw r3  r2  -48
	movi r3 setup_loop.end.76
	jalr r0  r3 
setup_loop.else.71:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -49
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -50
	movi r3 1
	sw r3  r2  -51
	lw r3  r2  -49
	lw r4  r2  -50
	lw r5  r2  -51
	call draw_pixel
	sw r3  r2  -52
setup_loop.end.76:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -53
	movi r3 cur_x.9
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 cur_x.9
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -4
	movi r3 setup_loop.end.92
	jalr r0  r3 
setup_loop.else.78:
	movi r3 1
	sw r3  r2  -54
	lw r3  r2  -3
	movi r4 32
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.80
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -54
setup_loop.end.80:
	lw r3  r2  -54
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.else.83
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -55
	movi r3 erase.11
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.82
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -55
setup_loop.end.82:
	lw r3  r2  -55
	movi r4 erase.11
	sw r3  r4  0
	movi r3 setup_loop.end.91
	jalr r0  r3 
setup_loop.else.83:
	movi r3 1
	sw r3  r2  -56
	movi r3 1
	sw r3  r2  -57
	lw r3  r2  -3
	movi r4 13
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.85
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -57
setup_loop.end.85:
	lw r3  r2  -57
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 setup_loop.end.89
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -58
	lw r3  r2  -3
	movi r4 10
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.87
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -58
setup_loop.end.87:
	lw r3  r2  -58
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 setup_loop.end.89
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -56
setup_loop.end.89:
	lw r3  r2  -56
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 setup_loop.end.90
	jalr r0  r3 
	movi r3 setup_loop.while.0.break
	jalr r0  r3 
setup_loop.end.90:
setup_loop.end.91:
setup_loop.end.92:
setup_loop.end.93:
	movi r3 cur_x.9
	lw r3  r3  0
	sw r3  r2  -59
	movi r3 cur_y.10
	lw r3  r3  0
	sw r3  r2  -60
	movi r3 2
	sw r3  r2  -61
	lw r3  r2  -59
	lw r4  r2  -60
	lw r5  r2  -61
	call draw_pixel
	sw r3  r2  -62
	movi r3 setup_loop.while.0.continue
	jalr r0  r3 
setup_loop.while.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
draw_pixel_buffered:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -43
	sw r3  r2  -1
	sw r4  r2  -2
	sw r5  r2  -3
	movi r3 FRAMEBUFFER_BUFFER
	lw r3  r3  0
	sw r3  r2  -4
	lw r3  r2  -4
	sw r3  r2  -5
	movi r3 2
	sw r3  r2  -6
	lw r3  r2  -1
	lw r4  r2  -6
	call udiv
	sw r3  r2  -7
	lw r3  r2  -7
	movi r4 1
	call umul
	sw r3  r2  -8
	lw r3  r2  -5
	lw r4  r2  -8
	add r3  r3  r4 
	sw r3  r2  -9
	movi r3 64
	sw r3  r2  -10
	lw r3  r2  -10
	lw r4  r2  -2
	call umul
	sw r3  r2  -11
	lw r3  r2  -11
	movi r4 1
	call umul
	sw r3  r2  -12
	lw r3  r2  -9
	lw r4  r2  -12
	add r3  r3  r4 
	sw r3  r2  -13
	lw r3  r2  -13
	lw r4  r3  0
	sw r4  r2  -14
	lw r3  r2  -14
	sw r3  r2  -15
	movi r3 1
	sw r3  r2  -16
	lw r3  r2  -1
	lw r4  r2  -16
	and r3  r3  r4 
	sw r3  r2  -17
	lw r3  r2  -17
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 draw_pixel_buffered.else.25
	jalr r0  r3 
	movi r3 2
	sw r3  r2  -18
	lw r3  r2  -1
	lw r4  r2  -18
	call udiv
	sw r3  r2  -19
	lw r3  r2  -19
	movi r4 1
	call umul
	sw r3  r2  -20
	lw r3  r2  -5
	lw r4  r2  -20
	add r3  r3  r4 
	sw r3  r2  -21
	movi r3 64
	sw r3  r2  -22
	lw r3  r2  -22
	lw r4  r2  -2
	call umul
	sw r3  r2  -23
	lw r3  r2  -23
	movi r4 1
	call umul
	sw r3  r2  -24
	lw r3  r2  -21
	lw r4  r2  -24
	add r3  r3  r4 
	sw r3  r2  -25
	movi r3 8
	sw r3  r2  -26
	lw r3  r2  -3
	lw r4  r2  -26
	call left_shift
	sw r3  r2  -27
	movi r3 255
	sw r3  r2  -28
	lw r3  r2  -15
	lw r4  r2  -28
	and r3  r3  r4 
	sw r3  r2  -29
	lw r3  r2  -27
	lw r4  r2  -29
	or r3  r3  r4 
	sw r3  r2  -30
	lw r3  r2  -25
	lw r4  r2  -30
	sw r4  r3  0
	movi r3 draw_pixel_buffered.end.39
	jalr r0  r3 
draw_pixel_buffered.else.25:
	movi r3 2
	sw r3  r2  -31
	lw r3  r2  -1
	lw r4  r2  -31
	call udiv
	sw r3  r2  -32
	lw r3  r2  -32
	movi r4 1
	call umul
	sw r3  r2  -33
	lw r3  r2  -5
	lw r4  r2  -33
	add r3  r3  r4 
	sw r3  r2  -34
	movi r3 64
	sw r3  r2  -35
	lw r3  r2  -35
	lw r4  r2  -2
	call umul
	sw r3  r2  -36
	lw r3  r2  -36
	movi r4 1
	call umul
	sw r3  r2  -37
	lw r3  r2  -34
	lw r4  r2  -37
	add r3  r3  r4 
	sw r3  r2  -38
	movi r3 255
	sw r3  r2  -39
	lw r3  r2  -3
	lw r4  r2  -39
	and r3  r3  r4 
	sw r3  r2  -40
	movi r3 65280
	sw r3  r2  -41
	lw r3  r2  -15
	lw r4  r2  -41
	and r3  r3  r4 
	sw r3  r2  -42
	lw r3  r2  -40
	lw r4  r2  -42
	or r3  r3  r4 
	sw r3  r2  -43
	lw r3  r2  -38
	lw r4  r2  -43
	sw r4  r3  0
draw_pixel_buffered.end.39:
	movi r3 0
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
read_pixel_buffered:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -43
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 FRAMEBUFFER_BUFFER
	lw r3  r3  0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 2
	sw r3  r2  -5
	lw r3  r2  -1
	lw r4  r2  -5
	call udiv
	sw r3  r2  -6
	lw r3  r2  -6
	movi r4 1
	call umul
	sw r3  r2  -7
	lw r3  r2  -4
	lw r4  r2  -7
	add r3  r3  r4 
	sw r3  r2  -8
	movi r3 64
	sw r3  r2  -9
	lw r3  r2  -9
	lw r4  r2  -2
	call umul
	sw r3  r2  -10
	lw r3  r2  -10
	movi r4 1
	call umul
	sw r3  r2  -11
	lw r3  r2  -8
	lw r4  r2  -11
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	lw r4  r3  0
	sw r4  r2  -13
	lw r3  r2  -13
	sw r3  r2  -14
	movi r3 1
	sw r3  r2  -15
	lw r3  r2  -1
	lw r4  r2  -15
	and r3  r3  r4 
	sw r3  r2  -16
	lw r3  r2  -16
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 read_pixel_buffered.else.24
	jalr r0  r3 
	movi r3 2
	sw r3  r2  -17
	lw r3  r2  -1
	lw r4  r2  -17
	call udiv
	sw r3  r2  -18
	lw r3  r2  -18
	movi r4 1
	call umul
	sw r3  r2  -19
	lw r3  r2  -4
	lw r4  r2  -19
	add r3  r3  r4 
	sw r3  r2  -20
	movi r3 64
	sw r3  r2  -21
	lw r3  r2  -21
	lw r4  r2  -2
	call umul
	sw r3  r2  -22
	lw r3  r2  -22
	movi r4 1
	call umul
	sw r3  r2  -23
	lw r3  r2  -20
	lw r4  r2  -23
	add r3  r3  r4 
	sw r3  r2  -24
	lw r3  r2  -24
	lw r4  r3  0
	sw r4  r2  -25
	lw r3  r2  -25
	sw r3  r2  -26
	lw r3  r2  -26
	sw r3  r2  -27
	lw r3  r2  -27
	movi r4 8
	call right_shift
	sw r3  r2  -28
	lw r3  r2  -28
	sw r3  r2  -29
	lw r3  r2  -29
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
	movi r3 read_pixel_buffered.end.37
	jalr r0  r3 
read_pixel_buffered.else.24:
	movi r3 2
	sw r3  r2  -30
	lw r3  r2  -1
	lw r4  r2  -30
	call udiv
	sw r3  r2  -31
	lw r3  r2  -31
	movi r4 1
	call umul
	sw r3  r2  -32
	lw r3  r2  -4
	lw r4  r2  -32
	add r3  r3  r4 
	sw r3  r2  -33
	movi r3 64
	sw r3  r2  -34
	lw r3  r2  -34
	lw r4  r2  -2
	call umul
	sw r3  r2  -35
	lw r3  r2  -35
	movi r4 1
	call umul
	sw r3  r2  -36
	lw r3  r2  -33
	lw r4  r2  -36
	add r3  r3  r4 
	sw r3  r2  -37
	lw r3  r2  -37
	lw r4  r3  0
	sw r4  r2  -38
	lw r3  r2  -38
	sw r3  r2  -39
	lw r3  r2  -39
	sw r3  r2  -40
	lw r3  r2  -40
	movi r4 255
	and r3  r3  r4 
	sw r3  r2  -41
	lw r3  r2  -41
	sw r3  r2  -42
	lw r3  r2  -42
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
read_pixel_buffered.end.37:
	movi r3 0
	sw r3  r2  -43
	lw r3  r2  -43
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
count_neighbors:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -64
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 0
	sw r3  r2  -3
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -2
	movi r4 29
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 count_neighbors.end.1
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
count_neighbors.end.1:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.7
	jalr r0  r3 
	lw r3  r2  -1
	sw r3  r2  -5
	lw r3  r2  -2
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -6
	lw r3  r2  -6
	sw r3  r2  -7
	lw r3  r2  -5
	lw r4  r2  -7
	call read_pixel
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -9
	lw r3  r2  -9
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.7:
	movi r3 0
	sw r3  r2  -11
	movi r3 1
	sw r3  r2  -12
	lw r3  r2  -2
	movi r4 29
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 count_neighbors.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -12
count_neighbors.end.9:
	lw r3  r2  -12
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.13
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -13
	lw r3  r2  -1
	movi r4 39
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 count_neighbors.end.11
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
count_neighbors.end.11:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.13
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -11
count_neighbors.end.13:
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.20
	jalr r0  r3 
	lw r3  r2  -1
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -14
	lw r3  r2  -14
	sw r3  r2  -15
	lw r3  r2  -2
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -16
	lw r3  r2  -16
	sw r3  r2  -17
	lw r3  r2  -15
	lw r4  r2  -17
	call read_pixel
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -19
	lw r3  r2  -19
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.20:
	movi r3 1
	sw r3  r2  -20
	lw r3  r2  -1
	movi r4 39
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 count_neighbors.end.22
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -20
count_neighbors.end.22:
	lw r3  r2  -20
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.28
	jalr r0  r3 
	lw r3  r2  -1
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -21
	lw r3  r2  -21
	sw r3  r2  -22
	lw r3  r2  -2
	sw r3  r2  -23
	lw r3  r2  -22
	lw r4  r2  -23
	call read_pixel
	sw r3  r2  -24
	lw r3  r2  -24
	sw r3  r2  -25
	lw r3  r2  -25
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.28:
	movi r3 0
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	lw r3  r2  -1
	movi r4 39
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 count_neighbors.end.30
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
count_neighbors.end.30:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.34
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -28
	lw r3  r2  -2
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 count_neighbors.end.32
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -28
count_neighbors.end.32:
	lw r3  r2  -28
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.34
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -26
count_neighbors.end.34:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.41
	jalr r0  r3 
	lw r3  r2  -1
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -29
	lw r3  r2  -29
	sw r3  r2  -30
	lw r3  r2  -2
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -31
	lw r3  r2  -31
	sw r3  r2  -32
	lw r3  r2  -30
	lw r4  r2  -32
	call read_pixel
	sw r3  r2  -33
	lw r3  r2  -33
	sw r3  r2  -34
	lw r3  r2  -34
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.41:
	movi r3 1
	sw r3  r2  -35
	lw r3  r2  -2
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 count_neighbors.end.43
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -35
count_neighbors.end.43:
	lw r3  r2  -35
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.49
	jalr r0  r3 
	lw r3  r2  -1
	sw r3  r2  -36
	lw r3  r2  -2
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -37
	lw r3  r2  -37
	sw r3  r2  -38
	lw r3  r2  -36
	lw r4  r2  -38
	call read_pixel
	sw r3  r2  -39
	lw r3  r2  -39
	sw r3  r2  -40
	lw r3  r2  -40
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.49:
	movi r3 0
	sw r3  r2  -41
	movi r3 1
	sw r3  r2  -42
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 count_neighbors.end.51
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -42
count_neighbors.end.51:
	lw r3  r2  -42
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.55
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -43
	lw r3  r2  -2
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 count_neighbors.end.53
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -43
count_neighbors.end.53:
	lw r3  r2  -43
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.55
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -41
count_neighbors.end.55:
	lw r3  r2  -41
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.62
	jalr r0  r3 
	lw r3  r2  -1
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -44
	lw r3  r2  -44
	sw r3  r2  -45
	lw r3  r2  -2
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -46
	lw r3  r2  -46
	sw r3  r2  -47
	lw r3  r2  -45
	lw r4  r2  -47
	call read_pixel
	sw r3  r2  -48
	lw r3  r2  -48
	sw r3  r2  -49
	lw r3  r2  -49
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.62:
	movi r3 1
	sw r3  r2  -50
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 count_neighbors.end.64
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -50
count_neighbors.end.64:
	lw r3  r2  -50
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.70
	jalr r0  r3 
	lw r3  r2  -1
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -51
	lw r3  r2  -51
	sw r3  r2  -52
	lw r3  r2  -2
	sw r3  r2  -53
	lw r3  r2  -52
	lw r4  r2  -53
	call read_pixel
	sw r3  r2  -54
	lw r3  r2  -54
	sw r3  r2  -55
	lw r3  r2  -55
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.70:
	movi r3 0
	sw r3  r2  -56
	movi r3 1
	sw r3  r2  -57
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 count_neighbors.end.72
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -57
count_neighbors.end.72:
	lw r3  r2  -57
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.76
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -58
	lw r3  r2  -2
	movi r4 29
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 count_neighbors.end.74
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -58
count_neighbors.end.74:
	lw r3  r2  -58
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.76
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -56
count_neighbors.end.76:
	lw r3  r2  -56
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 count_neighbors.end.83
	jalr r0  r3 
	lw r3  r2  -1
	movi r4 1
	sub r3  r3  r4 
	sw r3  r2  -59
	lw r3  r2  -59
	sw r3  r2  -60
	lw r3  r2  -2
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -61
	lw r3  r2  -61
	sw r3  r2  -62
	lw r3  r2  -60
	lw r4  r2  -62
	call read_pixel
	sw r3  r2  -63
	lw r3  r2  -63
	sw r3  r2  -64
	lw r3  r2  -64
	sw r3  r2  -10
	lw r3  r2  -3
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -3
count_neighbors.end.83:
	lw r3  r2  -3
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
life_main:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -62
	call clear_screen
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -2
	movi r3 3276
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r2  -3
	call write_solid_tile
	sw r3  r2  -4
	movi r3 2
	sw r3  r2  -5
	movi r3 4095
	sw r3  r2  -6
	lw r3  r2  -5
	lw r4  r2  -6
	call write_solid_tile
	sw r3  r2  -7
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -9
	movi r3 1
	sw r3  r2  -10
	lw r3  r2  -9
	lw r4  r2  -10
	sw r4  r3  0
	movi r3 0
	sw r3  r2  -11
	call setup_loop
	sw r3  r2  -12
life_main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.while.0.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -13
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.11
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
life_main.end.11:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.63
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -14
life_main.for.1.start:
	movi r3 1
	sw r3  r2  -15
	lw r3  r2  -14
	movi r4 30
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 life_main.end.50
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -15
life_main.end.50:
	lw r3  r2  -15
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.for.1.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -16
life_main.for.2.start:
	movi r3 1
	sw r3  r2  -17
	lw r3  r2  -16
	movi r4 40
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 life_main.end.48
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -17
life_main.end.48:
	lw r3  r2  -17
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.for.2.break
	jalr r0  r3 
	lw r3  r2  -16
	lw r4  r2  -14
	call count_neighbors
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -19
	lw r3  r2  -16
	sw r3  r2  -20
	lw r3  r2  -14
	sw r3  r2  -21
	lw r3  r2  -20
	lw r4  r2  -21
	call read_pixel
	sw r3  r2  -22
	lw r3  r2  -22
	sw r3  r2  -23
	lw r3  r2  -23
	sw r3  r2  -24
	movi r3 0
	sw r3  r2  -25
	lw r3  r2  -24
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.24
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	lw r3  r2  -19
	movi r4 2
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.18
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
life_main.end.18:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 life_main.end.22
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -28
	lw r3  r2  -19
	movi r4 3
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.20
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -28
life_main.end.20:
	lw r3  r2  -28
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 life_main.end.22
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -26
life_main.end.22:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.24
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -25
life_main.end.24:
	lw r3  r2  -25
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.else.29
	jalr r0  r3 
	lw r3  r2  -16
	sw r3  r2  -29
	lw r3  r2  -14
	sw r3  r2  -30
	movi r3 1
	sw r3  r2  -31
	lw r3  r2  -29
	lw r4  r2  -30
	lw r5  r2  -31
	call draw_pixel_buffered
	sw r3  r2  -32
	movi r3 life_main.end.46
	jalr r0  r3 
life_main.else.29:
	movi r3 0
	sw r3  r2  -33
	movi r3 1
	sw r3  r2  -34
	lw r3  r2  -24
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.31
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -34
life_main.end.31:
	lw r3  r2  -34
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.35
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -35
	lw r3  r2  -19
	movi r4 3
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.33
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -35
life_main.end.33:
	lw r3  r2  -35
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.35
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -33
life_main.end.35:
	lw r3  r2  -33
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.else.40
	jalr r0  r3 
	lw r3  r2  -16
	sw r3  r2  -36
	lw r3  r2  -14
	sw r3  r2  -37
	movi r3 1
	sw r3  r2  -38
	lw r3  r2  -36
	lw r4  r2  -37
	lw r5  r2  -38
	call draw_pixel_buffered
	sw r3  r2  -39
	movi r3 life_main.end.45
	jalr r0  r3 
life_main.else.40:
	lw r3  r2  -16
	sw r3  r2  -40
	lw r3  r2  -14
	sw r3  r2  -41
	movi r3 0
	sw r3  r2  -42
	lw r3  r2  -40
	lw r4  r2  -41
	lw r5  r2  -42
	call draw_pixel_buffered
	sw r3  r2  -43
life_main.end.45:
life_main.end.46:
life_main.for.2.continue:
	lw r3  r2  -16
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -16
	movi r3 life_main.for.2.start
	jalr r0  r3 
life_main.for.2.break:
life_main.for.1.continue:
	lw r3  r2  -14
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -14
	movi r3 life_main.for.1.start
	jalr r0  r3 
life_main.for.1.break:
	movi r3 0
	sw r3  r2  -44
life_main.for.3.start:
	movi r3 1
	sw r3  r2  -45
	lw r3  r2  -44
	movi r4 30
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 life_main.end.62
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -45
life_main.end.62:
	lw r3  r2  -45
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.for.3.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -46
life_main.for.4.start:
	movi r3 1
	sw r3  r2  -47
	lw r3  r2  -46
	movi r4 40
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 life_main.end.60
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -47
life_main.end.60:
	lw r3  r2  -47
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.for.4.break
	jalr r0  r3 
	lw r3  r2  -46
	sw r3  r2  -48
	lw r3  r2  -44
	sw r3  r2  -49
	lw r3  r2  -48
	lw r4  r2  -49
	call read_pixel_buffered
	sw r3  r2  -50
	lw r3  r2  -50
	sw r3  r2  -51
	lw r3  r2  -51
	sw r3  r2  -52
	lw r3  r2  -46
	sw r3  r2  -53
	lw r3  r2  -44
	sw r3  r2  -54
	lw r3  r2  -52
	sw r3  r2  -55
	lw r3  r2  -53
	lw r4  r2  -54
	lw r5  r2  -55
	call draw_pixel
	sw r3  r2  -56
life_main.for.4.continue:
	lw r3  r2  -46
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -46
	movi r3 life_main.for.4.start
	jalr r0  r3 
life_main.for.4.break:
life_main.for.3.continue:
	lw r3  r2  -44
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -44
	movi r3 life_main.for.3.start
	jalr r0  r3 
life_main.for.3.break:
life_main.end.63:
	call getKey
	sw r3  r2  -57
	lw r3  r2  -57
	sw r3  r2  -58
	lw r3  r2  -58
	sw r3  r2  -59
	movi r3 1
	sw r3  r2  -60
	lw r3  r2  -59
	movi r4 32
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.67
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -60
life_main.end.67:
	lw r3  r2  -60
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.else.70
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -61
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.69
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -61
life_main.end.69:
	lw r3  r2  -61
	sw r3  r2  -11
	movi r3 life_main.end.74
	jalr r0  r3 
life_main.else.70:
	movi r3 1
	sw r3  r2  -62
	lw r3  r2  -59
	movi r4 113
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.72
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -62
life_main.end.72:
	lw r3  r2  -62
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 life_main.end.73
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
life_main.end.73:
life_main.end.74:
	movi r3 life_main.while.0.continue
	jalr r0  r3 
life_main.while.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
