
# Data Section:
obstacle_y:
	.fill 12800
obstacle_x:
	.fill 80
is_jumping:
	.fill 0
dino_vy:
	.fill 0
dino_y:
	.fill 12800
DINO_X:
	.fill 10
GROUND_Y:
	.fill 12800
JUMP_VELOCITY:
	.fill 48
GRAVITY:
	.fill -2
SCREEN_HEIGHT_TILES:
	.fill 64
SCREEN_WIDTH_TILES:
	.fill 128
FRAME_BUFFER_SIZE:
	.fill 8192
FRAME_BUFFER_TOP:
	.fill 57344

# Code Section:
draw_box:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -16
	sw r3  r2  -1
	sw r4  r2  -2
	sw r5  r2  -3
	sw r6  r2  -4
	lw r3  r2  2
	sw r3  r2  -5
	movi r3 0
	sw r3  r2  -6
	lw r3  r2  -6
	sw r3  r2  -7
draw_box.for.0.start:
	movi r3 1
	sw r3  r2  -8
	lw r3  r2  -7
	lw r4  r2  -3
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 draw_box.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
draw_box.end.9:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 draw_box.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
	lw r3  r2  -9
	sw r3  r2  -10
draw_box.for.1.start:
	movi r3 1
	sw r3  r2  -11
	lw r3  r2  -10
	lw r4  r2  -4
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 draw_box.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -11
draw_box.end.6:
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 draw_box.for.1.break
	jalr r0  r3 
	lw r3  r2  -1
	lw r4  r2  -7
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -2
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -13
	lw r3  r2  -12
	lw r4  r2  -13
	lw r5  r2  -5
	call draw_pixel
	sw r3  r2  -14
draw_box.for.1.continue:
	movi r3 1
	sw r3  r2  -15
	lw r3  r2  -10
	lw r4  r2  -15
	add r3  r3  r4 
	sw r3  r2  -10
	movi r3 draw_box.for.1.start
	jalr r0  r3 
draw_box.for.1.break:
draw_box.for.0.continue:
	movi r3 1
	sw r3  r2  -16
	lw r3  r2  -7
	lw r4  r2  -16
	add r3  r3  r4 
	sw r3  r2  -7
	movi r3 draw_box.for.0.start
	jalr r0  r3 
draw_box.for.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
clear_box:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -6
	sw r3  r2  -1
	sw r4  r2  -2
	sw r5  r2  -3
	sw r6  r2  -4
	movi r3 0
	sw r3  r2  -5
	lw r3  r2  -5
	push r3 
	lw r3  r2  -1
	lw r4  r2  -2
	lw r5  r2  -3
	lw r6  r2  -4
	call draw_box
	addi r1  r1  1
	sw r3  r2  -6
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
draw_dino:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -6
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 2
	sw r3  r2  -3
	movi r3 3
	sw r3  r2  -4
	movi r3 240
	sw r3  r2  -5
	lw r3  r2  -5
	push r3 
	lw r3  r2  -1
	lw r4  r2  -2
	lw r5  r2  -3
	lw r6  r2  -4
	call draw_box
	addi r1  r1  1
	sw r3  r2  -6
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
draw_obstacle:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -6
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 2
	sw r3  r2  -3
	movi r3 2
	sw r3  r2  -4
	movi r3 3840
	sw r3  r2  -5
	lw r3  r2  -5
	push r3 
	lw r3  r2  -1
	lw r4  r2  -2
	lw r5  r2  -3
	lw r6  r2  -4
	call draw_box
	addi r1  r1  1
	sw r3  r2  -6
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
dino_main:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	movi r3 -72
	add r1  r1  r3 
	movi r3 240
	sw r3  r2  -1
	movi r3 0
	sw r3  r2  -2
	lw r3  r2  -1
	lw r4  r2  -2
	call write_text_tilemap
	sw r3  r2  -3
	call clear_screen
	sw r3  r2  -4
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -5
	lw r3  r2  -5
	sw r3  r2  -6
	movi r3 0
	sw r3  r2  -7
	lw r3  r2  -6
	lw r4  r2  -7
	sw r4  r3  0
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -6
	movi r3 0
	sw r3  r2  -9
	lw r3  r2  -9
	sw r3  r2  -10
dino_main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.while.0.break
	jalr r0  r3 
	movi r3 8
	sw r3  r2  -11
	movi r3 dino_y
	lw r3  r3  0
	lw r4  r2  -11
	call right_shift
	sw r3  r2  -12
	movi r3 2
	sw r3  r2  -13
	movi r3 3
	sw r3  r2  -14
	movi r3 DINO_X
	lw r3  r3  0
	lw r4  r2  -12
	lw r5  r2  -13
	lw r6  r2  -14
	call clear_box
	sw r3  r2  -15
	movi r3 8
	sw r3  r2  -16
	movi r3 obstacle_y
	lw r3  r3  0
	lw r4  r2  -16
	call right_shift
	sw r3  r2  -17
	movi r3 2
	sw r3  r2  -18
	movi r3 2
	sw r3  r2  -19
	movi r3 obstacle_x
	lw r3  r3  0
	lw r4  r2  -17
	lw r5  r2  -18
	lw r6  r2  -19
	call clear_box
	sw r3  r2  -20
	lw r3  r2  -6
	lw r4  r3  0
	sw r4  r2  -21
	lw r3  r2  -21
	sw r3  r2  -22
	movi r3 1
	sw r3  r2  -23
	movi r3 113
	sw r3  r2  -24
	lw r3  r2  -22
	lw r4  r2  -24
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.21
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
dino_main.end.21:
	lw r3  r2  -23
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.23
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -25
	lw r3  r2  -25
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
dino_main.end.23:
	movi r3 0
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	movi r3 32
	sw r3  r2  -28
	lw r3  r2  -22
	lw r4  r2  -28
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.26
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
dino_main.end.26:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.30
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -29
	movi r3 is_jumping
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.28
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
dino_main.end.28:
	lw r3  r2  -29
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.30
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -26
dino_main.end.30:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.32
	jalr r0  r3 
	movi r3 JUMP_VELOCITY
	lw r3  r3  0
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -30
	lw r3  r2  -30
	movi r4 is_jumping
	sw r3  r4  0
dino_main.end.32:
	movi r3 dino_y
	lw r3  r3  0
	movi r4 dino_vy
	lw r4  r4  0
	add r3  r3  r4 
	movi r4 dino_y
	sw r3  r4  0
	movi r3 dino_vy
	lw r3  r3  0
	movi r4 GRAVITY
	lw r4  r4  0
	add r3  r3  r4 
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -31
	movi r3 dino_y
	lw r3  r3  0
	movi r4 GROUND_Y
	lw r4  r4  0
	cmp r3  r4 
	bae 1
	jmp 3
	movi r3 dino_main.end.34
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -31
dino_main.end.34:
	lw r3  r2  -31
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.37
	jalr r0  r3 
	movi r3 GROUND_Y
	lw r3  r3  0
	movi r4 dino_y
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -32
	lw r3  r2  -32
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -33
	lw r3  r2  -33
	movi r4 is_jumping
	sw r3  r4  0
dino_main.end.37:
	movi r3 1
	sw r3  r2  -34
	movi r3 obstacle_x
	lw r3  r3  0
	lw r4  r2  -34
	sub r3  r3  r4 
	movi r4 obstacle_x
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -35
	movi r3 0
	sw r3  r2  -36
	movi r3 obstacle_x
	lw r3  r3  0
	lw r4  r2  -36
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 dino_main.end.41
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -35
dino_main.end.41:
	lw r3  r2  -35
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.46
	jalr r0  r3 
	movi r3 80
	sw r3  r2  -37
	movi r3 20
	sw r3  r2  -38
	lw r3  r2  -10
	lw r4  r2  -38
	call umod
	sw r3  r2  -39
	lw r3  r2  -37
	lw r4  r2  -39
	add r3  r3  r4 
	sw r3  r2  -40
	lw r3  r2  -40
	movi r4 obstacle_x
	sw r3  r4  0
dino_main.end.46:
	movi r3 8
	sw r3  r2  -41
	movi r3 dino_y
	lw r3  r3  0
	lw r4  r2  -41
	call right_shift
	sw r3  r2  -42
	movi r3 DINO_X
	lw r3  r3  0
	lw r4  r2  -42
	call draw_dino
	sw r3  r2  -43
	movi r3 8
	sw r3  r2  -44
	movi r3 obstacle_y
	lw r3  r3  0
	lw r4  r2  -44
	call right_shift
	sw r3  r2  -45
	movi r3 obstacle_x
	lw r3  r3  0
	lw r4  r2  -45
	call draw_obstacle
	sw r3  r2  -46
	movi r3 0
	sw r3  r2  -47
	movi r3 1
	sw r3  r2  -48
	movi r3 1
	sw r3  r2  -49
	movi r3 DINO_X
	lw r3  r3  0
	lw r4  r2  -49
	add r3  r3  r4 
	sw r3  r2  -50
	movi r3 obstacle_x
	lw r3  r3  0
	lw r4  r2  -50
	cmp r3  r4 
	bbe 1
	jmp 3
	movi r3 dino_main.end.56
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -48
dino_main.end.56:
	lw r3  r2  -48
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.62
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -51
	movi r3 1
	sw r3  r2  -52
	movi r3 obstacle_x
	lw r3  r3  0
	lw r4  r2  -52
	add r3  r3  r4 
	sw r3  r2  -53
	lw r3  r2  -53
	movi r4 DINO_X
	lw r4  r4  0
	cmp r3  r4 
	bae 1
	jmp 3
	movi r3 dino_main.end.60
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -51
dino_main.end.60:
	lw r3  r2  -51
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.62
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -47
dino_main.end.62:
	lw r3  r2  -47
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.76
	jalr r0  r3 
	movi r3 8
	sw r3  r2  -54
	movi r3 dino_y
	lw r3  r3  0
	lw r4  r2  -54
	call right_shift
	sw r3  r2  -55
	lw r3  r2  -55
	sw r3  r2  -56
	movi r3 8
	sw r3  r2  -57
	movi r3 obstacle_y
	lw r3  r3  0
	lw r4  r2  -57
	call right_shift
	sw r3  r2  -58
	lw r3  r2  -58
	sw r3  r2  -59
	movi r3 1
	sw r3  r2  -60
	movi r3 3
	sw r3  r2  -61
	lw r3  r2  -56
	lw r4  r2  -61
	add r3  r3  r4 
	sw r3  r2  -62
	lw r3  r2  -62
	lw r4  r2  -59
	cmp r3  r4 
	ba 1
	jmp 3
	movi r3 dino_main.end.70
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -60
dino_main.end.70:
	lw r3  r2  -60
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.end.75
	jalr r0  r3 
	movi r3 3840
	sw r3  r2  -63
	movi r3 0
	sw r3  r2  -64
	lw r3  r2  -63
	lw r4  r2  -64
	call write_text_tilemap
	sw r3  r2  -65
	movi r3 1
	sw r3  r2  -66
	lw r3  r2  -66
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
dino_main.end.75:
dino_main.end.76:
	lw r3  r2  -10
	sw r3  r2  -67
	lw r3  r2  -10
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -10
	movi r3 0
	sw r3  r2  -68
	lw r3  r2  -68
	sw r3  r2  -69
dino_main.for.1.start:
	movi r3 1
	sw r3  r2  -70
	movi r3 5000
	sw r3  r2  -71
	lw r3  r2  -69
	lw r4  r2  -71
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 dino_main.end.81
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -70
dino_main.end.81:
	lw r3  r2  -70
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 dino_main.for.1.break
	jalr r0  r3 
dino_main.for.1.continue:
	movi r3 1
	sw r3  r2  -72
	lw r3  r2  -69
	lw r4  r2  -72
	add r3  r3  r4 
	sw r3  r2  -69
	movi r3 dino_main.for.1.start
	jalr r0  r3 
dino_main.for.1.break:
	movi r3 dino_main.while.0.continue
	jalr r0  r3 
dino_main.while.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
