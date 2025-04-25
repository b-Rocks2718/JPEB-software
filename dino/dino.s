	movi r3 main
	jalr r0  r3 

# Data Section:
game_over:
	.fill 71
	.fill 97
	.fill 109
	.fill 101
	.fill 32
	.fill 79
	.fill 118
	.fill 101
	.fill 114
	.fill 10
	.fill 89
	.fill 111
	.fill 117
	.fill 114
	.fill 32
	.fill 83
	.fill 99
	.fill 111
	.fill 114
	.fill 101
	.fill 58
	.fill 32
	.fill 0
score:
	.space 1
frame2:
	.space 1
frame:
	.space 1
sun_y:
	.space 1
sun_x:
	.space 1
cloud_2_y:
	.space 1
cloud_2_x:
	.space 1
cloud_1_y:
	.space 1
cloud_1_x:
	.space 1
obstacle_2_y:
	.space 1
obstacle_2_x:
	.space 1
obstacle_1_y:
	.space 1
obstacle_1_x:
	.space 1
is_jumping:
	.space 1
dino_vy:
	.space 1
dino_y:
	.space 1
DINO_X:
	.fill 80
GROUND_Y:
	.fill 156
JUMP_VELOCITY:
	.fill 48
GRAVITY:
	.fill 2

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
	addi r1  r1  -18
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
	lw r3  r2  -11
	lw r4  r3  0
	sw r4  r2  -12
	movi r3 3903
	sw r3  r2  -13
	lw r3  r2  -12
	lw r4  r2  -13
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_dino.end.8
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_dino.end.8:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_dino.end.14
	jalr r0  r3 
	lw r3  r2  -3
	movi r4 32
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
	movi r3 61440
	sw r3  r2  -18
	lw r3  r2  -17
	lw r4  r2  -18
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
	addi r1  r1  -20
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -3
init_ground_tiles.for.0.start:
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -3
	movi r4 30
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_ground_tiles.end.21
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
init_ground_tiles.end.21:
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
	movi r4 128
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_ground_tiles.end.19
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
init_ground_tiles.end.19:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.for.1.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -3
	movi r4 22
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 init_ground_tiles.end.2
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_ground_tiles.end.2:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.17
	jalr r0  r3 
	lw r3  r2  -3
	movi r4 3
	call smul
	sw r3  r2  -8
	lw r3  r2  -5
	movi r4 7
	call smul
	sw r3  r2  -9
	lw r3  r2  -8
	lw r4  r2  -9
	add r3  r3  r4 
	sw r3  r2  -10
	lw r3  r2  -10
	lw r4  r2  -3
	add r3  r3  r4 
	sw r3  r2  -11
	lw r3  r2  -11
	lw r4  r2  -5
	xor r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	movi r4 31
	and r3  r3  r4 
	sw r3  r2  -13
	lw r3  r2  -13
	sw r3  r2  -14
	movi r3 1
	sw r3  r2  -15
	lw r3  r2  -14
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.10
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -15
init_ground_tiles.end.10:
	lw r3  r2  -15
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_ground_tiles.end.12
	jalr r0  r3 
	lw r3  r2  -14
	sw r3  r2  -16
	lw r3  r2  -14
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -14
init_ground_tiles.end.12:
	lw r3  r2  -5
	sw r3  r2  -17
	lw r3  r2  -3
	sw r3  r2  -18
	lw r3  r2  -14
	sw r3  r2  -19
	lw r3  r2  -17
	lw r4  r2  -18
	lw r5  r2  -19
	call draw_pixel
	sw r3  r2  -20
init_ground_tiles.end.17:
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
	addi r1  r1  -36
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
	movi r3 init_obstacles.end.19
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
init_obstacles.end.19:
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
	movi r3 init_obstacles.end.17
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_obstacles.end.17:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.1.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -8
	lw r3  r2  -4
	movi r4 32
	call smul
	sw r3  r2  -9
	lw r3  r2  -9
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -10
	lw r3  r2  -10
	movi r4 1
	call smul
	sw r3  r2  -11
	lw r3  r2  -2
	lw r4  r2  -11
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	lw r4  r3  0
	sw r4  r2  -13
	movi r3 3903
	sw r3  r2  -14
	lw r3  r2  -13
	lw r4  r2  -14
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
init_obstacles.end.9:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.15
	jalr r0  r3 
	lw r3  r2  -4
	movi r4 32
	call smul
	sw r3  r2  -15
	lw r3  r2  -15
	lw r4  r2  -6
	add r3  r3  r4 
	sw r3  r2  -16
	lw r3  r2  -16
	movi r4 1
	call smul
	sw r3  r2  -17
	lw r3  r2  -2
	lw r4  r2  -17
	add r3  r3  r4 
	sw r3  r2  -18
	movi r3 61440
	sw r3  r2  -19
	lw r3  r2  -18
	lw r4  r2  -19
	sw r4  r3  0
init_obstacles.end.15:
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
	sw r3  r2  -20
	lw r3  r2  -2
	lw r4  r2  -20
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -21
init_obstacles.for.2.start:
	movi r3 1
	sw r3  r2  -22
	lw r3  r2  -21
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.38
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -22
init_obstacles.end.38:
	lw r3  r2  -22
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.2.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
init_obstacles.for.3.start:
	movi r3 1
	sw r3  r2  -24
	lw r3  r2  -23
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_obstacles.end.36
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -24
init_obstacles.end.36:
	lw r3  r2  -24
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.for.3.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -25
	lw r3  r2  -21
	movi r4 32
	call smul
	sw r3  r2  -26
	lw r3  r2  -26
	lw r4  r2  -23
	add r3  r3  r4 
	sw r3  r2  -27
	lw r3  r2  -27
	movi r4 1
	call smul
	sw r3  r2  -28
	lw r3  r2  -2
	lw r4  r2  -28
	add r3  r3  r4 
	sw r3  r2  -29
	lw r3  r2  -29
	lw r4  r3  0
	sw r4  r2  -30
	movi r3 3903
	sw r3  r2  -31
	lw r3  r2  -30
	lw r4  r2  -31
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.28
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -25
init_obstacles.end.28:
	lw r3  r2  -25
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_obstacles.end.34
	jalr r0  r3 
	lw r3  r2  -21
	movi r4 32
	call smul
	sw r3  r2  -32
	lw r3  r2  -32
	lw r4  r2  -23
	add r3  r3  r4 
	sw r3  r2  -33
	lw r3  r2  -33
	movi r4 1
	call smul
	sw r3  r2  -34
	lw r3  r2  -2
	lw r4  r2  -34
	add r3  r3  r4 
	sw r3  r2  -35
	movi r3 61440
	sw r3  r2  -36
	lw r3  r2  -35
	lw r4  r2  -36
	sw r4  r3  0
init_obstacles.end.34:
init_obstacles.for.3.continue:
	lw r3  r2  -23
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -23
	movi r3 init_obstacles.for.3.start
	jalr r0  r3 
init_obstacles.for.3.break:
init_obstacles.for.2.continue:
	lw r3  r2  -21
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -21
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
init_sun:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -20
	movi r3 SPRITE_DATA_START
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 32
	movi r4 32
	call smul
	sw r3  r2  -3
	lw r3  r2  -3
	movi r4 3
	call smul
	sw r3  r2  -4
	lw r3  r2  -2
	lw r4  r2  -4
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -5
init_sun.for.0.start:
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sun.end.20
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
init_sun.end.20:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sun.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
init_sun.for.1.start:
	movi r3 1
	sw r3  r2  -8
	lw r3  r2  -7
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sun.end.18
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
init_sun.end.18:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sun.for.1.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -9
	lw r3  r2  -5
	movi r4 32
	call smul
	sw r3  r2  -10
	lw r3  r2  -10
	lw r4  r2  -7
	add r3  r3  r4 
	sw r3  r2  -11
	lw r3  r2  -11
	movi r4 1
	call smul
	sw r3  r2  -12
	lw r3  r2  -2
	lw r4  r2  -12
	add r3  r3  r4 
	sw r3  r2  -13
	lw r3  r2  -13
	lw r4  r3  0
	sw r4  r2  -14
	movi r3 3903
	sw r3  r2  -15
	lw r3  r2  -14
	lw r4  r2  -15
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sun.end.10
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
init_sun.end.10:
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sun.end.16
	jalr r0  r3 
	lw r3  r2  -5
	movi r4 32
	call smul
	sw r3  r2  -16
	lw r3  r2  -16
	lw r4  r2  -7
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
init_sun.end.16:
init_sun.for.1.continue:
	lw r3  r2  -7
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -7
	movi r3 init_sun.for.1.start
	jalr r0  r3 
init_sun.for.1.break:
init_sun.for.0.continue:
	lw r3  r2  -5
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 init_sun.for.0.start
	jalr r0  r3 
init_sun.for.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
init_sky:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -64
	movi r3 TILEMAP_START
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -3
init_sky.for.0.start:
	movi r3 1
	sw r3  r2  -4
	lw r3  r2  -3
	movi r4 8
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.15
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
init_sky.end.15:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
init_sky.for.1.start:
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	movi r4 8
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.13
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
init_sky.end.13:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.1.break
	jalr r0  r3 
	movi r3 8
	lw r4  r2  -3
	call smul
	sw r3  r2  -7
	lw r3  r2  -7
	lw r4  r2  -5
	add r3  r3  r4 
	sw r3  r2  -8
	lw r3  r2  -8
	movi r4 1
	call smul
	sw r3  r2  -9
	lw r3  r2  -2
	lw r4  r2  -9
	add r3  r3  r4 
	sw r3  r2  -10
	movi r3 3720
	sw r3  r2  -11
	lw r3  r2  -10
	lw r4  r2  -11
	sw r4  r3  0
	movi r3 8
	lw r4  r2  -3
	call smul
	sw r3  r2  -12
	movi r3 8128
	lw r4  r2  -12
	add r3  r3  r4 
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
	movi r3 3720
	sw r3  r2  -17
	lw r3  r2  -16
	lw r4  r2  -17
	sw r4  r3  0
init_sky.for.1.continue:
	lw r3  r2  -5
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 init_sky.for.1.start
	jalr r0  r3 
init_sky.for.1.break:
init_sky.for.0.continue:
	lw r3  r2  -3
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -3
	movi r3 init_sky.for.0.start
	jalr r0  r3 
init_sky.for.0.break:
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -19
init_sky.for.2.start:
	movi r3 1
	sw r3  r2  -20
	lw r3  r2  -19
	movi r4 30
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.27
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -20
init_sky.end.27:
	lw r3  r2  -20
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.2.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -21
init_sky.for.3.start:
	movi r3 1
	sw r3  r2  -22
	lw r3  r2  -21
	movi r4 128
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.25
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -22
init_sky.end.25:
	lw r3  r2  -22
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.3.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -23
	lw r3  r2  -19
	movi r4 22
	cmp r3  r4 
	ble 1
	jmp 3
	movi r3 init_sky.end.18
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
init_sky.end.18:
	lw r3  r2  -23
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.end.23
	jalr r0  r3 
	lw r3  r2  -21
	sw r3  r2  -24
	lw r3  r2  -19
	sw r3  r2  -25
	movi r3 127
	sw r3  r2  -26
	lw r3  r2  -24
	lw r4  r2  -25
	lw r5  r2  -26
	call draw_pixel
	sw r3  r2  -27
init_sky.end.23:
init_sky.for.3.continue:
	lw r3  r2  -21
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -21
	movi r3 init_sky.for.3.start
	jalr r0  r3 
init_sky.for.3.break:
init_sky.for.2.continue:
	lw r3  r2  -19
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -19
	movi r3 init_sky.for.2.start
	jalr r0  r3 
init_sky.for.2.break:
	movi r3 SPRITE_DATA_START
	lw r3  r3  0
	sw r3  r2  -28
	lw r3  r2  -28
	sw r3  r2  -2
	movi r3 32
	movi r4 32
	call smul
	sw r3  r2  -29
	lw r3  r2  -29
	movi r4 4
	call smul
	sw r3  r2  -30
	lw r3  r2  -2
	lw r4  r2  -30
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -31
init_sky.for.4.start:
	movi r3 1
	sw r3  r2  -32
	lw r3  r2  -31
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.48
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -32
init_sky.end.48:
	lw r3  r2  -32
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.4.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -33
init_sky.for.5.start:
	movi r3 1
	sw r3  r2  -34
	lw r3  r2  -33
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.46
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -34
init_sky.end.46:
	lw r3  r2  -34
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.5.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -35
	lw r3  r2  -31
	movi r4 32
	call smul
	sw r3  r2  -36
	lw r3  r2  -36
	lw r4  r2  -33
	add r3  r3  r4 
	sw r3  r2  -37
	lw r3  r2  -37
	movi r4 1
	call smul
	sw r3  r2  -38
	lw r3  r2  -2
	lw r4  r2  -38
	add r3  r3  r4 
	sw r3  r2  -39
	lw r3  r2  -39
	lw r4  r3  0
	sw r4  r2  -40
	movi r3 3903
	sw r3  r2  -41
	lw r3  r2  -40
	lw r4  r2  -41
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.end.38
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -35
init_sky.end.38:
	lw r3  r2  -35
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.end.44
	jalr r0  r3 
	lw r3  r2  -31
	movi r4 32
	call smul
	sw r3  r2  -42
	lw r3  r2  -42
	lw r4  r2  -33
	add r3  r3  r4 
	sw r3  r2  -43
	lw r3  r2  -43
	movi r4 1
	call smul
	sw r3  r2  -44
	lw r3  r2  -2
	lw r4  r2  -44
	add r3  r3  r4 
	sw r3  r2  -45
	movi r3 61440
	sw r3  r2  -46
	lw r3  r2  -45
	lw r4  r2  -46
	sw r4  r3  0
init_sky.end.44:
init_sky.for.5.continue:
	lw r3  r2  -33
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -33
	movi r3 init_sky.for.5.start
	jalr r0  r3 
init_sky.for.5.break:
init_sky.for.4.continue:
	lw r3  r2  -31
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -31
	movi r3 init_sky.for.4.start
	jalr r0  r3 
init_sky.for.4.break:
	movi r3 32
	movi r4 32
	call smul
	sw r3  r2  -47
	lw r3  r2  -2
	lw r4  r2  -47
	add r3  r3  r4 
	sw r3  r2  -2
	movi r3 0
	sw r3  r2  -48
init_sky.for.6.start:
	movi r3 1
	sw r3  r2  -49
	lw r3  r2  -48
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.67
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -49
init_sky.end.67:
	lw r3  r2  -49
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.6.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -50
init_sky.for.7.start:
	movi r3 1
	sw r3  r2  -51
	lw r3  r2  -50
	movi r4 32
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 init_sky.end.65
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -51
init_sky.end.65:
	lw r3  r2  -51
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.for.7.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -52
	lw r3  r2  -48
	movi r4 32
	call smul
	sw r3  r2  -53
	lw r3  r2  -53
	lw r4  r2  -50
	add r3  r3  r4 
	sw r3  r2  -54
	lw r3  r2  -54
	movi r4 1
	call smul
	sw r3  r2  -55
	lw r3  r2  -2
	lw r4  r2  -55
	add r3  r3  r4 
	sw r3  r2  -56
	lw r3  r2  -56
	lw r4  r3  0
	sw r4  r2  -57
	movi r3 3903
	sw r3  r2  -58
	lw r3  r2  -57
	lw r4  r2  -58
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.end.57
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -52
init_sky.end.57:
	lw r3  r2  -52
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 init_sky.end.63
	jalr r0  r3 
	lw r3  r2  -48
	movi r4 32
	call smul
	sw r3  r2  -59
	lw r3  r2  -59
	lw r4  r2  -50
	add r3  r3  r4 
	sw r3  r2  -60
	lw r3  r2  -60
	movi r4 1
	call smul
	sw r3  r2  -61
	lw r3  r2  -2
	lw r4  r2  -61
	add r3  r3  r4 
	sw r3  r2  -62
	movi r3 61440
	sw r3  r2  -63
	lw r3  r2  -62
	lw r4  r2  -63
	sw r4  r3  0
init_sky.end.63:
init_sky.for.7.continue:
	lw r3  r2  -50
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -50
	movi r3 init_sky.for.7.start
	jalr r0  r3 
init_sky.for.7.break:
init_sky.for.6.continue:
	lw r3  r2  -48
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -48
	movi r3 init_sky.for.6.start
	jalr r0  r3 
init_sky.for.6.break:
	call init_sun
	sw r3  r2  -64
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
	addi r1  r1  -49
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
	movi r3 400
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
	movi r3 cloud_1_x
	lw r3  r3  0
	movi r4 2
	sub r3  r3  r4 
	movi r4 cloud_1_x
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -17
	movi r3 cloud_1_x
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 move_obstacles.end.21
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -17
move_obstacles.end.21:
	lw r3  r2  -17
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 move_obstacles.end.36
	jalr r0  r3 
	movi r3 400
	sw r3  r2  -18
	movi r3 10
	sw r3  r2  -19
	movi r3 20
	sw r3  r2  -20
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -20
	call umod
	sw r3  r2  -21
	lw r3  r2  -19
	lw r4  r2  -21
	call umul
	sw r3  r2  -22
	lw r3  r2  -18
	lw r4  r2  -22
	add r3  r3  r4 
	sw r3  r2  -23
	lw r3  r2  -23
	sw r3  r2  -24
	lw r3  r2  -24
	movi r4 cloud_1_x
	sw r3  r4  0
	movi r3 40
	sw r3  r2  -25
	movi r3 2
	sw r3  r2  -26
	movi r3 20
	sw r3  r2  -27
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -27
	call umod
	sw r3  r2  -28
	lw r3  r2  -26
	lw r4  r2  -28
	call umul
	sw r3  r2  -29
	lw r3  r2  -25
	lw r4  r2  -29
	add r3  r3  r4 
	sw r3  r2  -30
	lw r3  r2  -30
	sw r3  r2  -31
	lw r3  r2  -31
	movi r4 cloud_1_y
	sw r3  r4  0
move_obstacles.end.36:
	movi r3 cloud_2_x
	lw r3  r3  0
	movi r4 1
	sub r3  r3  r4 
	movi r4 cloud_2_x
	sw r3  r4  0
	movi r3 1
	sw r3  r2  -32
	movi r3 cloud_2_x
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 move_obstacles.end.38
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -32
move_obstacles.end.38:
	lw r3  r2  -32
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 move_obstacles.end.51
	jalr r0  r3 
	movi r3 450
	sw r3  r2  -33
	movi r3 10
	sw r3  r2  -34
	movi r3 20
	sw r3  r2  -35
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -35
	call umod
	sw r3  r2  -36
	lw r3  r2  -34
	lw r4  r2  -36
	call umul
	sw r3  r2  -37
	lw r3  r2  -33
	lw r4  r2  -37
	add r3  r3  r4 
	sw r3  r2  -38
	lw r3  r2  -38
	sw r3  r2  -39
	lw r3  r2  -39
	movi r4 cloud_2_x
	sw r3  r4  0
	movi r3 2
	sw r3  r2  -40
	movi r3 20
	sw r3  r2  -41
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -41
	call umod
	sw r3  r2  -42
	lw r3  r2  -40
	lw r4  r2  -42
	call umul
	sw r3  r2  -43
	lw r3  r2  -43
	sw r3  r2  -44
	lw r3  r2  -44
	movi r4 cloud_2_y
	sw r3  r4  0
move_obstacles.end.51:
	movi r3 SCROLL_X
	lw r3  r3  0
	sw r3  r2  -45
	lw r3  r2  -45
	sw r3  r2  -46
	lw r3  r2  -46
	lw r4  r3  0
	sw r4  r2  -47
	movi r3 6
	sw r3  r2  -48
	lw r3  r2  -47
	lw r4  r2  -48
	sub r3  r3  r4 
	sw r3  r2  -49
	lw r3  r2  -46
	lw r4  r2  -49
	sw r4  r3  0
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
handle_collisions:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -14
	movi r3 0
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -2
	movi r3 DINO_X
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -3
	movi r3 obstacle_1_x
	lw r3  r3  0
	lw r4  r2  -3
	cmp r3  r4 
	ble 1
	jmp 3
	movi r3 handle_collisions.end.2
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -2
handle_collisions.end.2:
	lw r3  r2  -2
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.end.7
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -4
	movi r3 obstacle_1_x
	lw r3  r3  0
	movi r4 6
	add r3  r3  r4 
	sw r3  r2  -5
	lw r3  r2  -5
	movi r4 DINO_X
	lw r4  r4  0
	cmp r3  r4 
	bge 1
	jmp 3
	movi r3 handle_collisions.end.5
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -4
handle_collisions.end.5:
	lw r3  r2  -4
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.end.7
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -1
handle_collisions.end.7:
	lw r3  r2  -1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.end.13
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -6
	movi r3 obstacle_1_y
	lw r3  r3  0
	movi r4 10
	sub r3  r3  r4 
	sw r3  r2  -7
	lw r3  r2  -7
	movi r4 dino_y
	lw r4  r4  0
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 handle_collisions.end.10
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
handle_collisions.end.10:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.else.11
	jalr r0  r3 
	movi r3 1
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
	movi r3 handle_collisions.end.12
	jalr r0  r3 
handle_collisions.else.11:
	movi r3 score
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 score
	sw r3  r4  0
handle_collisions.end.12:
handle_collisions.end.13:
	movi r3 0
	sw r3  r2  -8
	movi r3 1
	sw r3  r2  -9
	movi r3 DINO_X
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -10
	movi r3 obstacle_2_x
	lw r3  r3  0
	lw r4  r2  -10
	cmp r3  r4 
	ble 1
	jmp 3
	movi r3 handle_collisions.end.16
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
handle_collisions.end.16:
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.end.21
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -11
	movi r3 obstacle_2_x
	lw r3  r3  0
	movi r4 10
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	movi r4 DINO_X
	lw r4  r4  0
	cmp r3  r4 
	bge 1
	jmp 3
	movi r3 handle_collisions.end.19
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -11
handle_collisions.end.19:
	lw r3  r2  -11
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.end.21
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -8
handle_collisions.end.21:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.end.27
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -13
	movi r3 obstacle_2_y
	lw r3  r3  0
	movi r4 5
	sub r3  r3  r4 
	sw r3  r2  -14
	lw r3  r2  -14
	movi r4 dino_y
	lw r4  r4  0
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 handle_collisions.end.24
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
handle_collisions.end.24:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 handle_collisions.else.25
	jalr r0  r3 
	movi r3 1
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
	movi r3 handle_collisions.end.26
	jalr r0  r3 
handle_collisions.else.25:
	movi r3 score
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 score
	sw r3  r4  0
handle_collisions.end.26:
handle_collisions.end.27:
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
update_positions:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -21
	movi r3 SPRITE_0_X
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 obstacle_1_x
	lw r3  r3  0
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r2  -3
	sw r4  r3  0
	movi r3 SPRITE_0_Y
	lw r3  r3  0
	sw r3  r2  -4
	lw r3  r2  -4
	sw r3  r2  -2
	movi r3 obstacle_1_y
	lw r3  r3  0
	sw r3  r2  -5
	lw r3  r2  -2
	lw r4  r2  -5
	sw r4  r3  0
	movi r3 SPRITE_1_X
	lw r3  r3  0
	sw r3  r2  -6
	lw r3  r2  -6
	sw r3  r2  -2
	movi r3 obstacle_2_x
	lw r3  r3  0
	sw r3  r2  -7
	lw r3  r2  -2
	lw r4  r2  -7
	sw r4  r3  0
	movi r3 SPRITE_1_Y
	lw r3  r3  0
	sw r3  r2  -8
	lw r3  r2  -8
	sw r3  r2  -2
	movi r3 obstacle_2_y
	lw r3  r3  0
	sw r3  r2  -9
	lw r3  r2  -2
	lw r4  r2  -9
	sw r4  r3  0
	movi r3 SPRITE_2_X
	lw r3  r3  0
	sw r3  r2  -10
	lw r3  r2  -10
	sw r3  r2  -2
	movi r3 DINO_X
	lw r3  r3  0
	sw r3  r2  -11
	lw r3  r2  -2
	lw r4  r2  -11
	sw r4  r3  0
	movi r3 SPRITE_2_Y
	lw r3  r3  0
	sw r3  r2  -12
	lw r3  r2  -12
	sw r3  r2  -2
	movi r3 dino_y
	lw r3  r3  0
	sw r3  r2  -13
	lw r3  r2  -2
	lw r4  r2  -13
	sw r4  r3  0
	movi r3 SPRITE_4_X
	lw r3  r3  0
	sw r3  r2  -14
	lw r3  r2  -14
	sw r3  r2  -2
	movi r3 cloud_1_x
	lw r3  r3  0
	sw r3  r2  -15
	lw r3  r2  -2
	lw r4  r2  -15
	sw r4  r3  0
	movi r3 SPRITE_4_Y
	lw r3  r3  0
	sw r3  r2  -16
	lw r3  r2  -16
	sw r3  r2  -2
	movi r3 cloud_1_y
	lw r3  r3  0
	sw r3  r2  -17
	lw r3  r2  -2
	lw r4  r2  -17
	sw r4  r3  0
	movi r3 SPRITE_5_X
	lw r3  r3  0
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -2
	movi r3 cloud_2_x
	lw r3  r3  0
	sw r3  r2  -19
	lw r3  r2  -2
	lw r4  r2  -19
	sw r4  r3  0
	movi r3 SPRITE_5_Y
	lw r3  r3  0
	sw r3  r2  -20
	lw r3  r2  -20
	sw r3  r2  -2
	movi r3 cloud_2_y
	lw r3  r3  0
	sw r3  r2  -21
	lw r3  r2  -2
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
	addi r1  r1  -59
	movi r3 0
	sw r3  r2  -1
	movi r3 3720
	sw r3  r2  -2
	lw r3  r2  -1
	lw r4  r2  -2
	call write_text_tilemap
	sw r3  r2  -3
	call init_dino
	sw r3  r2  -4
	call init_obstacles
	sw r3  r2  -5
	call init_ground_tiles
	sw r3  r2  -6
main.start:
	movi r3 100
	movi r4 dino_y
	sw r3  r4  0
	movi r3 0
	movi r4 dino_vy
	sw r3  r4  0
	movi r3 1
	movi r4 is_jumping
	sw r3  r4  0
	movi r3 300
	movi r4 obstacle_1_x
	sw r3  r4  0
	movi r3 152
	movi r4 obstacle_1_y
	sw r3  r4  0
	movi r3 600
	movi r4 obstacle_2_x
	sw r3  r4  0
	movi r3 152
	movi r4 obstacle_2_y
	sw r3  r4  0
	movi r3 250
	movi r4 cloud_1_x
	sw r3  r4  0
	movi r3 60
	movi r4 cloud_1_y
	sw r3  r4  0
	movi r3 150
	movi r4 cloud_2_x
	sw r3  r4  0
	movi r3 40
	movi r4 cloud_2_y
	sw r3  r4  0
	movi r3 260
	movi r4 sun_x
	sw r3  r4  0
	movi r3 30
	movi r4 sun_y
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -7
	lw r3  r2  -7
	movi r4 frame
	sw r3  r4  0
	call reset_cursor
	sw r3  r2  -8
	call init_sky
	sw r3  r2  -9
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -10
	lw r3  r2  -10
	sw r3  r2  -11
	movi r3 1
	sw r3  r2  -12
	lw r3  r2  -11
	lw r4  r2  -12
	sw r4  r3  0
	movi r3 SPRITE_3_X
	lw r3  r3  0
	sw r3  r2  -13
	lw r3  r2  -13
	sw r3  r2  -11
	movi r3 sun_x
	lw r3  r3  0
	sw r3  r2  -14
	lw r3  r2  -11
	lw r4  r2  -14
	sw r4  r3  0
	movi r3 SPRITE_3_Y
	lw r3  r3  0
	sw r3  r2  -15
	lw r3  r2  -15
	sw r3  r2  -11
	movi r3 sun_y
	lw r3  r3  0
	sw r3  r2  -16
	lw r3  r2  -11
	lw r4  r2  -16
	sw r4  r3  0
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -17
	lw r3  r2  -17
	sw r3  r2  -11
main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.0.break
	jalr r0  r3 
	call update_positions
	sw r3  r2  -18
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -19
	lw r3  r2  -19
	sw r3  r2  -11
	call getKey
	sw r3  r2  -20
	lw r3  r2  -20
	sw r3  r2  -21
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
	movi r3 main.end.22
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
main.end.22:
	lw r3  r2  -23
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.24
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -25
	lw r3  r2  -25
	# Function Epilogue
	sys EXIT
main.end.24:
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
	movi r3 main.end.27
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
main.end.27:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.31
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -29
	movi r3 is_jumping
	lw r3  r3  0
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.29
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -29
main.end.29:
	lw r3  r2  -29
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.31
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -26
main.end.31:
	lw r3  r2  -26
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.32
	jalr r0  r3 
	movi r3 13
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
main.end.32:
	call handle_physics
	sw r3  r2  -30
	call move_obstacles
	sw r3  r2  -31
	call handle_collisions
	sw r3  r2  -32
	lw r3  r2  -32
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.56
	jalr r0  r3 
	movi r3 SCROLL_X
	lw r3  r3  0
	sw r3  r2  -33
	lw r3  r2  -33
	sw r3  r2  -11
	movi r3 0
	sw r3  r2  -34
	lw r3  r2  -11
	lw r4  r2  -34
	sw r4  r3  0
	movi r3 game_over
	sw r3  r2  -35
	lw r3  r2  -35
	sw r3  r2  -36
	lw r3  r2  -36
	call print
	sw r3  r2  -37
	movi r3 score
	lw r3  r3  0
	sw r3  r2  -38
	lw r3  r2  -38
	call print_unsigned
	sw r3  r2  -39
main.while.1.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.1.break
	jalr r0  r3 
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -40
	lw r3  r2  -40
	sw r3  r2  -11
	call getKey
	sw r3  r2  -41
	lw r3  r2  -41
	sw r3  r2  -42
	lw r3  r2  -42
	sw r3  r2  -43
	movi r3 1
	sw r3  r2  -44
	movi r3 113
	sw r3  r2  -45
	lw r3  r2  -43
	lw r4  r2  -45
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.48
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -44
main.end.48:
	lw r3  r2  -44
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.50
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -46
	lw r3  r2  -46
	# Function Epilogue
	sys EXIT
main.end.50:
	movi r3 1
	sw r3  r2  -47
	movi r3 0
	sw r3  r2  -48
	lw r3  r2  -43
	lw r4  r2  -48
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.53
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -47
main.end.53:
	lw r3  r2  -47
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.54
	jalr r0  r3 
	movi r3 main.start
	jalr r0  r3 
main.end.54:
	movi r3 frame
	lw r3  r3  0
	sw r3  r2  -49
	movi r3 frame
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 frame
	sw r3  r4  0
	movi r3 main.while.1.continue
	jalr r0  r3 
main.while.1.break:
main.end.56:
	movi r3 1
	sw r3  r2  -50
	movi r3 10
	sw r3  r2  -51
	movi r3 frame
	lw r3  r3  0
	lw r4  r2  -51
	call umod
	sw r3  r2  -52
	lw r3  r2  -52
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.60
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -50
main.end.60:
	lw r3  r2  -50
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.62
	jalr r0  r3 
	call do_animations
	sw r3  r2  -53
main.end.62:
	movi r3 frame
	lw r3  r3  0
	sw r3  r2  -54
	movi r3 frame
	lw r3  r3  0
	movi r4 1
	add r3  r3  r4 
	movi r4 frame
	sw r3  r4  0
	movi r3 0
	sw r3  r2  -55
	lw r3  r2  -55
	sw r3  r2  -56
main.for.2.start:
	movi r3 1
	sw r3  r2  -57
	movi r3 40000
	sw r3  r2  -58
	lw r3  r2  -56
	lw r4  r2  -58
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 main.end.67
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -57
main.end.67:
	lw r3  r2  -57
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.for.2.break
	jalr r0  r3 
main.for.2.continue:
	movi r3 1
	sw r3  r2  -59
	lw r3  r2  -56
	lw r4  r2  -59
	add r3  r3  r4 
	sw r3  r2  -56
	movi r3 main.for.2.start
	jalr r0  r3 
main.for.2.break:
	movi r3 main.while.0.continue
	jalr r0  r3 
main.while.0.break:
	movi r3 0
	# Function Epilogue
	sys EXIT
