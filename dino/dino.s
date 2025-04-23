	movi r3 main
	jalr r0  r3 

# Data Section:
frame:
	.fill 0
obstacle_2_y:
	.fill 152
obstacle_2_x:
	.fill 600
obstacle_1_y:
	.fill 152
obstacle_1_x:
	.fill 300
is_jumping:
	.fill 1
dino_vy:
	.fill 0
dino_y:
	.fill 100
DINO_X:
	.fill 80
GROUND_Y:
	.fill 152
JUMP_VELOCITY:
	.fill 48
GRAVITY:
	.fill 3

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
init_dino:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -17
	movi r3 SPRITE_DATA_START
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -3
init_dino.for.0.start:
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -3
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_dino.end.18
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
init_dino.end.18:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_dino.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
init_dino.for.1.start:
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_dino.end.16
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
init_dino.end.16:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_dino.for.1.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -5
	movi r4 16
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_dino.end.2
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_dino.end.2:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_dino.else.8
	jalr r0  r3 
	lw r3  r2  -3
	movi r4 32
	call smul
	sw r3  r2  -8
	lw r3  r2  -8
	lw r4  r2  -5
	add r3  r3  r4 
	sw r3  r2  -9
	lw r3  r2  -9
	movi r4 1
	call smul
	sw r3  r2  -10
	lw r3  r2  -2
	lw r4  r2  -10
	add r3  r3  r4 
	sw r3  r2  -11
	movi r3 240
	sw r3  r2  -12
	lw r3  r2  -11
	lw r4  r2  -12
	sw r4  r3  0
	movi r3 init_dino.end.14
	jalr r0  r3 
init_dino.else.8:
	lw r3  r2  -3
	movi r4 32
	call smul
	sw r3  r2  -13
	lw r3  r2  -13
	lw r4  r2  -5
	add r3  r3  r4 
	sw r3  r2  -14
	lw r3  r2  -14
	movi r4 1
	call smul
	sw r3  r2  -15
	lw r3  r2  -2
	lw r4  r2  -15
	add r3  r3  r4 
	sw r3  r2  -16
	movi r3 61440
	sw r3  r2  -17
	lw r3  r2  -16
	lw r4  r2  -17
	sw r4  r3  0
init_dino.end.14:
init_dino.for.1.continue:
	lw r3  r2  -5
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 init_dino.for.1.start
	jalr r0  r3 
init_dino.for.1.break:
init_dino.for.0.continue:
	lw r3  r2  -3
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -3
	movi r3 init_dino.for.0.start
	jalr r0  r3 
init_dino.for.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
init_ground_tiles:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -33
	movi r3 TILEMAP_START
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	lw r3  r2  -2
	movi r4 64
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -3
init_ground_tiles.for.0.start:
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -3
	movi r4 8
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_ground_tiles.end.30
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
init_ground_tiles.end.30:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
init_ground_tiles.for.1.start:
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	movi r4 8
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_ground_tiles.end.28
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
init_ground_tiles.end.28:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.for.1.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -7
	movi r3 1
	sw r3  r2  -8
	movi r3 1
	sw r3  r2  -9
	movi r3 1
	sw r3  r2  -10
	lw r3  r2  -3
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.2
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -10
init_ground_tiles.end.2:
	lw r3  r2  -10
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 init_ground_tiles.end.6
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -11
	lw r3  r2  -3
	movi r4 7
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.4
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -11
init_ground_tiles.end.4:
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 init_ground_tiles.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
init_ground_tiles.end.6:
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 init_ground_tiles.end.10
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -12
	lw r3  r2  -5
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.8
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -12
init_ground_tiles.end.8:
	lw r3  r2  -12
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 init_ground_tiles.end.10
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
init_ground_tiles.end.10:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 init_ground_tiles.end.14
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -13
	lw r3  r2  -5
	movi r4 7
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.12
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
init_ground_tiles.end.12:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 init_ground_tiles.end.14
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_ground_tiles.end.14:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.else.20
	jalr r0  r3 
	movi r3 8
	lw r4  r2  -3
	call smul
	sw r3  r2  -14
	lw r3  r2  -14
	lw r4  r2  -5
	add r3  r3  r4 
	sw r3  r2  -15
	lw r3  r2  -15
	movi r4 1
	call smul
	sw r3  r2  -16
	lw r3  r2  -2
	lw r4  r2  -16
	add r3  r3  r4 
	sw r3  r2  -17
	movi r3 417
	sw r3  r2  -18
	lw r3  r2  -17
	lw r4  r2  -18
	sw r4  r3  0
	movi r3 init_ground_tiles.end.26
	jalr r0  r3 
init_ground_tiles.else.20:
	movi r3 8
	lw r4  r2  -3
	call smul
	sw r3  r2  -19
	lw r3  r2  -19
	lw r4  r2  -5
	add r3  r3  r4 
	sw r3  r2  -20
	lw r3  r2  -20
	movi r4 1
	call smul
	sw r3  r2  -21
	lw r3  r2  -2
	lw r4  r2  -21
	add r3  r3  r4 
	sw r3  r2  -22
	movi r3 1445
	sw r3  r2  -23
	lw r3  r2  -22
	lw r4  r2  -23
	sw r4  r3  0
init_ground_tiles.end.26:
init_ground_tiles.for.1.continue:
	lw r3  r2  -5
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 init_ground_tiles.for.1.start
	jalr r0  r3 
init_ground_tiles.for.1.break:
init_ground_tiles.for.0.continue:
	lw r3  r2  -3
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -3
	movi r3 init_ground_tiles.for.0.start
	jalr r0  r3 
init_ground_tiles.for.0.break:
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	sw r3  r2  -24
	lw r3  r2  -24
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -25
init_ground_tiles.for.2.start:
	movi r3 1
	sw r3  r2  -26
	lw r3  r2  -25
	movi r4 30
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_ground_tiles.end.43
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -26
init_ground_tiles.end.43:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.for.2.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
init_ground_tiles.for.3.start:
	movi r3 1
	sw r3  r2  -28
	lw r3  r2  -27
	movi r4 128
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_ground_tiles.end.41
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -28
init_ground_tiles.end.41:
	lw r3  r2  -28
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.for.3.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -29
	lw r3  r2  -25
	movi r4 22
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 init_ground_tiles.end.33
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
init_ground_tiles.end.33:
	lw r3  r2  -29
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.else.38
	jalr r0  r3 
	lw r3  r2  -27
	sw r3  r2  -30
	lw r3  r2  -25
	sw r3  r2  -31
	movi r3 1
	sw r3  r2  -32
	lw r3  r2  -30
	lw r4  r2  -31
	lw r5  r2  -32
	call draw_pixel
	sw r3  r2  -33
	movi r3 init_ground_tiles.end.39
	jalr r0  r3 
init_ground_tiles.else.38:
init_ground_tiles.end.39:
init_ground_tiles.for.3.continue:
	lw r3  r2  -27
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -27
	movi r3 init_ground_tiles.for.3.start
	jalr r0  r3 
init_ground_tiles.for.3.break:
init_ground_tiles.for.2.continue:
	lw r3  r2  -25
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -25
	movi r3 init_ground_tiles.for.2.start
	jalr r0  r3 
init_ground_tiles.for.2.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
init_obstacles:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -38
	movi r3 SPRITE_DATA_START
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 32
	movi r4 32
	call smul
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r2  -3
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -4
init_obstacles.for.0.start:
	movi r3 1
	sw r3  r2  -5
	lw r3  r2  -4
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.23
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
init_obstacles.end.23:
	lw r3  r2  -5
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
init_obstacles.for.1.start:
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -6
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.21
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_obstacles.end.21:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.1.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
	movi r3 1
	sw r3  r2  -9
	lw r3  r2  -6
	movi r4 6
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.3
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
init_obstacles.end.3:
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.7
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -10
	lw r3  r2  -4
	movi r4 8
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 init_obstacles.end.5
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -10
init_obstacles.end.5:
	lw r3  r2  -10
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.7
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -8
init_obstacles.end.7:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.else.13
	jalr r0  r3 
	lw r3  r2  -4
	movi r4 32
	call smul
	sw r3  r2  -11
	lw r3  r2  -11
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	movi r4 1
	call smul
	sw r3  r2  -13
	lw r3  r2  -2
	lw r4  r2  -13
	add r3  r3  r4 
	sw r3  r2  -14
	movi r3 15
	sw r3  r2  -15
	lw r3  r2  -14
	lw r4  r2  -15
	sw r4  r3  0
	movi r3 init_obstacles.end.19
	jalr r0  r3 
init_obstacles.else.13:
	lw r3  r2  -4
	movi r4 32
	call smul
	sw r3  r2  -16
	lw r3  r2  -16
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -17
	lw r3  r2  -17
	movi r4 1
	call smul
	sw r3  r2  -18
	lw r3  r2  -2
	lw r4  r2  -18
	add r3  r3  r4 
	sw r3  r2  -19
	movi r3 61440
	sw r3  r2  -20
	lw r3  r2  -19
	lw r4  r2  -20
	sw r4  r3  0
init_obstacles.end.19:
init_obstacles.for.1.continue:
	lw r3  r2  -6
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -6
	movi r3 init_obstacles.for.1.start
	jalr r0  r3 
init_obstacles.for.1.break:
init_obstacles.for.0.continue:
	lw r3  r2  -4
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -4
	movi r3 init_obstacles.for.0.start
	jalr r0  r3 
init_obstacles.for.0.break:
	movi r3 32
	movi r4 32
	call smul
	sw r3  r2  -21
	lw r3  r2  -2
	lw r4  r2  -21
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -22
init_obstacles.for.2.start:
	movi r3 1
	sw r3  r2  -23
	lw r3  r2  -22
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.46
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
init_obstacles.end.46:
	lw r3  r2  -23
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.2.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -24
init_obstacles.for.3.start:
	movi r3 1
	sw r3  r2  -25
	lw r3  r2  -24
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.44
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -25
init_obstacles.end.44:
	lw r3  r2  -25
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.3.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	lw r3  r2  -24
	movi r4 12
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.26
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
init_obstacles.end.26:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.30
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -28
	lw r3  r2  -22
	movi r4 12
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 init_obstacles.end.28
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -28
init_obstacles.end.28:
	lw r3  r2  -28
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.30
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -26
init_obstacles.end.30:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.else.36
	jalr r0  r3 
	lw r3  r2  -22
	movi r4 32
	call smul
	sw r3  r2  -29
	lw r3  r2  -29
	lw r4  r2  -24
	add r3  r3  r4 
	sw r3  r2  -30
	lw r3  r2  -30
	movi r4 1
	call smul
	sw r3  r2  -31
	lw r3  r2  -2
	lw r4  r2  -31
	add r3  r3  r4 
	sw r3  r2  -32
	movi r3 15
	sw r3  r2  -33
	lw r3  r2  -32
	lw r4  r2  -33
	sw r4  r3  0
	movi r3 init_obstacles.end.42
	jalr r0  r3 
init_obstacles.else.36:
	lw r3  r2  -22
	movi r4 32
	call smul
	sw r3  r2  -34
	lw r3  r2  -34
	lw r4  r2  -24
	add r3  r3  r4 
	sw r3  r2  -35
	lw r3  r2  -35
	movi r4 1
	call smul
	sw r3  r2  -36
	lw r3  r2  -2
	lw r4  r2  -36
	add r3  r3  r4 
	sw r3  r2  -37
	movi r3 61440
	sw r3  r2  -38
	lw r3  r2  -37
	lw r4  r2  -38
	sw r4  r3  0
init_obstacles.end.42:
init_obstacles.for.3.continue:
	lw r3  r2  -24
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -24
	movi r3 init_obstacles.for.3.start
	jalr r0  r3 
init_obstacles.for.3.break:
init_obstacles.for.2.continue:
	lw r3  r2  -22
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -22
	movi r3 init_obstacles.for.2.start
	jalr r0  r3 
init_obstacles.for.2.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
handle_physics:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -1
	movi r3 dino_y
	lw r3  r3  0
	movi r4 dino_vy
	lw r4  r4  0
	sub r3  r3  r4 
	movi r4 dino_y
	sw r3  r4  0
	movi r3 is_jumping
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_physics.else.0
	jalr r0  r3 
	movi r3 dino_vy
	lw r3  r3  0
	movi r4 GRAVITY
	lw r4  r4  0
	sub r3  r3  r4 
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 handle_physics.end.1
	jalr r0  r3 
handle_physics.else.0:
	movi r3 0
	movi r4 dino_vy
	sw r3  r4  0
handle_physics.end.1:
	movi r3 1
	sw r3  r2  -1
	movi r3 dino_y
	lw r3  r3  0
	movi r4 GROUND_Y
	lw r4  r4  0
	cmp r3  r4 
	bge 1
	jmp 3
	movi r3 handle_physics.end.3
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -1
handle_physics.end.3:
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_physics.end.4
	jalr r0  r3 
	movi r3 GROUND_Y
	lw r3  r3  0
	movi r4 dino_y
	sw r3  r4  0
	movi r3 0
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 0
	movi r4 is_jumping
	sw r3  r4  0
handle_physics.end.4:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
move_obstacles:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -21
	movi r3 obstacle_1_x
	lw r3  r3  0
	movi r4 6
	sub r3  r3  r4 
	movi r4 obstacle_1_x
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -1
	movi r3 obstacle_1_x
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 move_obstacles.end.1
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -1
move_obstacles.end.1:
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 move_obstacles.end.9
	jalr r0  r3 
	movi r3 500
	sw r3  r2  -2
	movi r3 10
	sw r3  r2  -3
	movi r3 20
	sw r3  r2  -4
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -4
	call umod
	sw r3  r2  -5
	lw r3  r2  -3
	lw r4  r2  -5
	call umul
	sw r3  r2  -6
	lw r3  r2  -2
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -7
	lw r3  r2  -7
	sw r3  r2  -8
	lw r3  r2  -8
	movi r4 obstacle_1_x
	sw r3  r4  0
move_obstacles.end.9:
	movi r3 obstacle_2_x
	lw r3  r3  0
	movi r4 6
	sub r3  r3  r4 
	movi r4 obstacle_2_x
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -9
	movi r3 obstacle_2_x
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 move_obstacles.end.11
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
move_obstacles.end.11:
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 move_obstacles.end.19
	jalr r0  r3 
	movi r3 500
	sw r3  r2  -10
	movi r3 10
	sw r3  r2  -11
	movi r3 20
	sw r3  r2  -12
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -12
	call umod
	sw r3  r2  -13
	lw r3  r2  -11
	lw r4  r2  -13
	call umul
	sw r3  r2  -14
	lw r3  r2  -10
	lw r4  r2  -14
	add r3  r3  r4 
	sw r3  r2  -15
	lw r3  r2  -15
	sw r3  r2  -16
	lw r3  r2  -16
	movi r4 obstacle_2_x
	sw r3  r4  0
move_obstacles.end.19:
	movi r3 SCROLL_X
	lw r3  r3  0
	sw r3  r2  -17
	lw r3  r2  -17
	sw r3  r2  -18
	lw r3  r2  -18
	lw r4  r3  0
	sw r4  r2  -19
	movi r3 6
	sw r3  r2  -20
	lw r3  r2  -19
	lw r4  r2  -20
	sub r3  r3  r4 
	sw r3  r2  -21
	lw r3  r2  -18
	lw r4  r2  -21
	sw r4  r3  0
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
	addi r1  r1  -41
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
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -6
	lw r4  r2  -7
	sw r4  r3  0
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -6
	call init_dino
	sw r3  r2  -9
	call init_obstacles
	sw r3  r2  -10
	call init_ground_tiles
	sw r3  r2  -11
main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.0.break
	jalr r0  r3 
	movi r3 SPRITE_0_X
	lw r3  r3  0
	sw r3  r2  -12
	lw r3  r2  -12
	sw r3  r2  -6
	movi r3 DINO_X
	lw r3  r3  0
	sw r3  r2  -13
	lw r3  r2  -6
	lw r4  r2  -13
	sw r4  r3  0
	movi r3 SPRITE_0_Y
	lw r3  r3  0
	sw r3  r2  -14
	lw r3  r2  -14
	sw r3  r2  -6
	movi r3 dino_y
	lw r3  r3  0
	sw r3  r2  -15
	lw r3  r2  -6
	lw r4  r2  -15
	sw r4  r3  0
	movi r3 SPRITE_1_X
	lw r3  r3  0
	sw r3  r2  -16
	lw r3  r2  -16
	sw r3  r2  -6
	movi r3 obstacle_1_x
	lw r3  r3  0
	sw r3  r2  -17
	lw r3  r2  -6
	lw r4  r2  -17
	sw r4  r3  0
	movi r3 SPRITE_1_Y
	lw r3  r3  0
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -6
	movi r3 obstacle_1_y
	lw r3  r3  0
	sw r3  r2  -19
	lw r3  r2  -6
	lw r4  r2  -19
	sw r4  r3  0
	movi r3 SPRITE_2_X
	lw r3  r3  0
	sw r3  r2  -20
	lw r3  r2  -20
	sw r3  r2  -6
	movi r3 obstacle_2_x
	lw r3  r3  0
	sw r3  r2  -21
	lw r3  r2  -6
	lw r4  r2  -21
	sw r4  r3  0
	movi r3 SPRITE_2_Y
	lw r3  r3  0
	sw r3  r2  -22
	lw r3  r2  -22
	sw r3  r2  -6
	movi r3 obstacle_2_y
	lw r3  r3  0
	sw r3  r2  -23
	lw r3  r2  -6
	lw r4  r2  -23
	sw r4  r3  0
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -24
	lw r3  r2  -24
	sw r3  r2  -6
	lw r3  r2  -6
	lw r4  r3  0
	sw r4  r2  -25
	lw r3  r2  -25
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	movi r3 113
	sw r3  r2  -28
	lw r3  r2  -26
	lw r4  r2  -28
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.26
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
main.end.26:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.28
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
	lw r3  r2  -29
	# Function Epilogue
	sys EXIT
main.end.28:
	movi r3 0
	sw r3  r2  -30
	movi r3 1
	sw r3  r2  -31
	movi r3 32
	sw r3  r2  -32
	lw r3  r2  -26
	lw r4  r2  -32
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.31
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -31
main.end.31:
	lw r3  r2  -31
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.35
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -33
	movi r3 is_jumping
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.33
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -33
main.end.33:
	lw r3  r2  -33
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.35
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -30
main.end.35:
	lw r3  r2  -30
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.36
	jalr r0  r3 
	movi r3 15
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 dino_y
	lw r3  r3  0
	movi r4 3
	sub r3  r3  r4 
	movi r4 dino_y
	sw r3  r4  0
	movi r3 1
	movi r4 is_jumping
	sw r3  r4  0
main.end.36:
	call handle_physics
	sw r3  r2  -34
	call move_obstacles
	sw r3  r2  -35
	movi r3 frame
	lw r3  r3  0
	sw r3  r2  -36
	movi r3 frame
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 frame
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -37
	lw r3  r2  -37
	sw r3  r2  -38
main.for.1.start:
	movi r3 1
	sw r3  r2  -39
	movi r3 50000
	sw r3  r2  -40
	lw r3  r2  -38
	lw r4  r2  -40
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 main.end.43
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -39
main.end.43:
	lw r3  r2  -39
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.for.1.break
	jalr r0  r3 
main.for.1.continue:
	movi r3 1
	sw r3  r2  -41
	lw r3  r2  -38
	lw r4  r2  -41
	add r3  r3  r4 
	sw r3  r2  -38
	movi r3 main.for.1.start
	jalr r0  r3 
main.for.1.break:
	movi r3 main.while.0.continue
	jalr r0  r3 
main.while.0.break:
	movi r3 0
	# Function Epilogue
	sys EXIT
