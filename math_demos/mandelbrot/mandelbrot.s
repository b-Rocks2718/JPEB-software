
# Data Section:
colors:
	.fill 0
	.fill 15
	.fill 79
	.fill 143
	.fill 207
	.fill 255
	.fill 252
	.fill 248
	.fill 244
	.fill 240
	.fill 0
	.fill 1264
	.fill 2288
	.fill 3312
	.fill 4080
	.fill 4032
	.fill 3968
	.fill 3904
	.fill 3840
	.fill 3844
	.fill 3848
	.fill 3852
	.fill 3855
	.fill 3087
	.fill 2063
	.fill 1039
FIXED_ONE:
	.fill 256

# Code Section:
mul_complex:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -14
	sw r3  r2  -1
	sw r4  r2  -2
	sw r5  r2  -3
	sw r6  r2  -4
	lw r3  r2  2
	sw r3  r2  -5
	lw r3  r2  3
	sw r3  r2  -6
	lw r3  r2  -1
	lw r4  r2  -3
	call mul_fixed
	sw r3  r2  -7
	lw r3  r2  -2
	lw r4  r2  -4
	call mul_fixed
	sw r3  r2  -8
	lw r3  r2  -7
	lw r4  r2  -8
	sub r3  r3  r4 
	sw r3  r2  -9
	lw r3  r2  -9
	sw r3  r2  -10
	lw r3  r2  -1
	lw r4  r2  -4
	call mul_fixed
	sw r3  r2  -11
	lw r3  r2  -2
	lw r4  r2  -3
	call mul_fixed
	sw r3  r2  -12
	lw r3  r2  -11
	lw r4  r2  -12
	add r3  r3  r4 
	sw r3  r2  -13
	lw r3  r2  -13
	sw r3  r2  -14
	lw r3  r2  -5
	lw r4  r2  -10
	sw r4  r3  0
	lw r3  r2  -6
	lw r4  r2  -14
	sw r4  r3  0
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
norm:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -6
	sw r3  r2  -1
	sw r4  r2  -2
	lw r3  r2  -1
	lw r4  r2  -1
	call mul_fixed
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r2  -2
	call mul_fixed
	sw r3  r2  -4
	lw r3  r2  -3
	lw r4  r2  -4
	add r3  r3  r4 
	sw r3  r2  -5
	lw r3  r2  -5
	sw r3  r2  -6
	lw r3  r2  -6
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
mandelbrot_count:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -20
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 0
	sw r3  r2  -3
	movi r3 0
	sw r3  r2  -4
	movi r3 0
	sw r3  r2  -5
mandelbrot_count.for.0.start:
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	movi r4 100
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 mandelbrot_count.end.12
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
mandelbrot_count.end.12:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.for.0.break
	jalr r0  r3 
	addi r3  r2  -8
	sw r3  r2  -7
	addi r3  r2  -10
	sw r3  r2  -9
	lw r3  r2  -9
	push r3 
	lw r3  r2  -7
	push r3 
	lw r3  r2  -3
	lw r4  r2  -4
	lw r5  r2  -3
	lw r6  r2  -4
	call mul_complex
	addi r1  r1  2
	sw r3  r2  -11
	lw r3  r2  -8
	lw r4  r2  -1
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	sw r3  r2  -3
	lw r3  r2  -10
	lw r4  r2  -2
	add r3  r3  r4 
	sw r3  r2  -13
	lw r3  r2  -13
	sw r3  r2  -4
	lw r3  r2  -3
	lw r4  r2  -4
	call norm
	sw r3  r2  -14
	lw r3  r2  -14
	sw r3  r2  -15
	lw r3  r2  -15
	sw r3  r2  -16
	movi r3 1
	sw r3  r2  -17
	movi r3 4
	movi r4 FIXED_ONE
	lw r4  r4  0
	call smul
	sw r3  r2  -18
	lw r3  r2  -16
	lw r4  r2  -18
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 mandelbrot_count.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -17
mandelbrot_count.end.9:
	lw r3  r2  -17
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.end.10
	jalr r0  r3 
	movi r3 mandelbrot_count.for.0.break
	jalr r0  r3 
mandelbrot_count.end.10:
mandelbrot_count.for.0.continue:
	lw r3  r2  -5
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 mandelbrot_count.for.0.start
	jalr r0  r3 
mandelbrot_count.for.0.break:
	movi r3 1
	sw r3  r2  -19
	lw r3  r2  -5
	movi r4 100
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.end.14
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -19
mandelbrot_count.end.14:
	lw r3  r2  -19
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.end.16
	jalr r0  r3 
	movi r3 1
	sub r3  r0  r3 
	sw r3  r2  -20
	lw r3  r2  -20
	sw r3  r2  -5
mandelbrot_count.end.16:
	lw r3  r2  -5
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
display_mandelbrot:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -32
	sw r3  r2  -1
	sw r4  r2  -2
	sw r5  r2  -3
	movi r3 0
	sw r3  r2  -4
display_mandelbrot.for.0.start:
	movi r3 1
	sw r3  r2  -5
	lw r3  r2  -4
	movi r4 60
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 display_mandelbrot.end.32
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -5
display_mandelbrot.end.32:
	lw r3  r2  -5
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 display_mandelbrot.for.0.break
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
display_mandelbrot.for.1.start:
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -6
	movi r4 80
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 display_mandelbrot.end.30
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
display_mandelbrot.end.30:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 display_mandelbrot.for.1.break
	jalr r0  r3 
	lw r3  r2  -6
	sw r3  r2  -8
	lw r3  r2  -3
	lw r4  r2  -8
	call umul
	sw r3  r2  -9
	lw r3  r2  -1
	lw r4  r2  -9
	add r3  r3  r4 
	sw r3  r2  -10
	lw r3  r2  -10
	sw r3  r2  -11
	lw r3  r2  -11
	sw r3  r2  -12
	lw r3  r2  -4
	sw r3  r2  -13
	lw r3  r2  -3
	lw r4  r2  -13
	call umul
	sw r3  r2  -14
	lw r3  r2  -2
	lw r4  r2  -14
	sub r3  r3  r4 
	sw r3  r2  -15
	lw r3  r2  -15
	sw r3  r2  -16
	lw r3  r2  -16
	sw r3  r2  -17
	lw r3  r2  -12
	lw r4  r2  -17
	call mandelbrot_count
	sw r3  r2  -18
	lw r3  r2  -18
	sw r3  r2  -19
	movi r3 1
	sw r3  r2  -20
	lw r3  r2  -19
	movi r4 0
	cmp r3  r4 
	bge 1
	jmp 3
	movi r3 display_mandelbrot.end.10
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -20
display_mandelbrot.end.10:
	lw r3  r2  -20
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 display_mandelbrot.else.23
	jalr r0  r3 
	lw r3  r2  -19
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -21
	lw r3  r2  -21
	sw r3  r2  -19
	movi r3 1
	sw r3  r2  -22
	lw r3  r2  -19
	movi r4 10
	cmp r3  r4 
	bge 1
	jmp 3
	movi r3 display_mandelbrot.end.13
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -22
display_mandelbrot.end.13:
	lw r3  r2  -22
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 display_mandelbrot.end.15
	jalr r0  r3 
	lw r3  r2  -19
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -23
	lw r3  r2  -23
	sw r3  r2  -19
display_mandelbrot.end.15:
	movi r3 1
	sw r3  r2  -24
	lw r3  r2  -19
	movi r4 25
	cmp r3  r4 
	bg 1
	jmp 3
	movi r3 display_mandelbrot.end.17
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -24
display_mandelbrot.end.17:
	lw r3  r2  -24
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 display_mandelbrot.end.18
	jalr r0  r3 
	movi r3 25
	sw r3  r2  -19
display_mandelbrot.end.18:
	lw r3  r2  -6
	sw r3  r2  -25
	lw r3  r2  -4
	sw r3  r2  -26
	lw r3  r2  -19
	sw r3  r2  -27
	lw r3  r2  -25
	lw r4  r2  -26
	lw r5  r2  -27
	call draw_pixel
	sw r3  r2  -28
	movi r3 display_mandelbrot.end.28
	jalr r0  r3 
display_mandelbrot.else.23:
	lw r3  r2  -6
	sw r3  r2  -29
	lw r3  r2  -4
	sw r3  r2  -30
	movi r3 0
	sw r3  r2  -31
	lw r3  r2  -29
	lw r4  r2  -30
	lw r5  r2  -31
	call draw_pixel
	sw r3  r2  -32
display_mandelbrot.end.28:
display_mandelbrot.for.1.continue:
	lw r3  r2  -6
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -6
	movi r3 display_mandelbrot.for.1.start
	jalr r0  r3 
display_mandelbrot.for.1.break:
display_mandelbrot.for.0.continue:
	lw r3  r2  -4
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -4
	movi r3 display_mandelbrot.for.0.start
	jalr r0  r3 
display_mandelbrot.for.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
mandelbrot_main:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -27
	movi r3 240
	movi r4 0
	call write_text_tilemap
	sw r3  r2  -1
	call clear_screen
	sw r3  r2  -2
	movi r3 RESOLUTION_REG
	lw r3  r3  0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 0
	sw r3  r2  -5
	lw r3  r2  -4
	lw r4  r2  -5
	sw r4  r3  0
	movi r3 0
	sw r3  r2  -6
mandelbrot_main.for.0.start:
	movi r3 1
	sw r3  r2  -7
	lw r3  r2  -6
	movi r4 20
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 mandelbrot_main.end.14
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -7
mandelbrot_main.end.14:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_main.for.0.break
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -8
	lw r3  r2  -6
	movi r4 10
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 mandelbrot_main.end.5
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
mandelbrot_main.end.5:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_main.end.12
	jalr r0  r3 
	lw r3  r2  -6
	sw r3  r2  -9
	movi r3 colors
	sw r3  r2  -10
	lw r3  r2  -6
	movi r4 1
	call smul
	sw r3  r2  -11
	lw r3  r2  -10
	lw r4  r2  -11
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	lw r4  r3  0
	sw r4  r2  -13
	lw r3  r2  -9
	lw r4  r2  -13
	call write_solid_tile
	sw r3  r2  -14
mandelbrot_main.end.12:
mandelbrot_main.for.0.continue:
	lw r3  r2  -6
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -6
	movi r3 mandelbrot_main.for.0.start
	jalr r0  r3 
mandelbrot_main.for.0.break:
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -15
	lw r3  r2  -15
	sw r3  r2  -4
	movi r3 512
	sub r3  r0  r3 
	sw r3  r2  -16
	lw r3  r2  -16
	sw r3  r2  -17
	movi r3 272
	sw r3  r2  -18
	movi r3 9
	sw r3  r2  -19
	lw r3  r2  -17
	sw r3  r2  -20
	lw r3  r2  -18
	sw r3  r2  -21
	lw r3  r2  -19
	sw r3  r2  -22
	lw r3  r2  -20
	lw r4  r2  -21
	lw r5  r2  -22
	call display_mandelbrot
	sw r3  r2  -23
mandelbrot_main.while.1.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_main.while.1.break
	jalr r0  r3 
	lw r3  r2  -4
	lw r4  r3  0
	sw r4  r2  -24
	lw r3  r2  -24
	sw r3  r2  -25
	lw r3  r2  -25
	sw r3  r2  -26
	movi r3 1
	sw r3  r2  -27
	lw r3  r2  -26
	movi r4 113
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_main.end.24
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -27
mandelbrot_main.end.24:
	lw r3  r2  -27
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_main.end.25
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
mandelbrot_main.end.25:
	movi r3 mandelbrot_main.while.1.continue
	jalr r0  r3 
mandelbrot_main.while.1.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
