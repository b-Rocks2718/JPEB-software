	movi r3 main
	jalr r0  r3 

# Data Section:

# Code Section:
mul_fixed:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -12
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 0
	sw r3  r2  -5
mul_fixed.for.0.start:
	movi r3 1
	sw r3  r2  -6
	lw r3  r2  -5
	movi r4 16
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 mul_fixed.end.9
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -6
mul_fixed.end.9:
	lw r3  r2  -6
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mul_fixed.for.0.break
	jalr r0  r3 
	movi r3 32768
	lw r4  r2  -5
	call right_shift
	sw r3  r2  -7
	lw r3  r2  -7
	sw r3  r2  -8
	lw r3  r2  -2
	lw r4  r2  -8
	and r3  r3  r4 
	sw r3  r2  -9
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mul_fixed.end.7
	jalr r0  r3 
	movi r3 7
	lw r4  r2  -5
	sub r3  r3  r4 
	sw r3  r2  -10
	lw r3  r2  -10
	sw r3  r2  -11
	lw r3  r2  -1
	lw r4  r2  -11
	call left_shift
	sw r3  r2  -12
	lw r3  r2  -4
	lw r4  r2  -12
	add r3  r3  r4 
	sw r3  r2  -4
mul_fixed.end.7:
mul_fixed.for.0.continue:
	lw r3  r2  -5
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -5
	movi r3 mul_fixed.for.0.start
	jalr r0  r3 
mul_fixed.for.0.break:
	lw r3  r2  -4
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
	addi r1  r1  -5
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
	addi r1  r1  -14
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	movi r3 0
	sw r3  r2  -5
	lw r3  r2  -5
	sw r3  r2  -6
	movi r3 0
	sw r3  r2  -7
	movi r3 0
	sw r3  r2  -8
mandelbrot_count.for.0.start:
	movi r3 1
	sw r3  r2  -9
	lw r3  r2  -8
	movi r4 100
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 mandelbrot_count.end.6
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -9
mandelbrot_count.end.6:
	lw r3  r2  -9
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.for.0.break
	jalr r0  r3 
	addi r3  r2  -4
	sw r3  r2  -10
	addi r3  r2  -6
	sw r3  r2  -11
	lw r3  r2  -11
	push r3 
	lw r3  r2  -10
	push r3 
	lw r3  r2  -4
	lw r4  r2  -6
	lw r5  r2  -4
	lw r6  r2  -6
	call mul_complex
	addi r1  r1  2
	sw r3  r2  -12
	lw r3  r2  -4
	lw r4  r2  -1
	add r3  r3  r4 
	sw r3  r2  -4
	lw r3  r2  -6
	lw r4  r2  -2
	add r3  r3  r4 
	sw r3  r2  -6
mandelbrot_count.for.0.continue:
	lw r3  r2  -8
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -8
	movi r3 mandelbrot_count.for.0.start
	jalr r0  r3 
mandelbrot_count.for.0.break:
	movi r3 1
	sw r3  r2  -13
	lw r3  r2  -7
	movi r4 100
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.end.8
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -13
mandelbrot_count.end.8:
	lw r3  r2  -13
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 mandelbrot_count.end.10
	jalr r0  r3 
	movi r3 1
	sub r3  r0  r3 
	sw r3  r2  -14
	lw r3  r2  -14
	sw r3  r2  -7
mandelbrot_count.end.10:
	lw r3  r2  -7
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
main:
	movi r1 40959
	movi r2 40959
	movi r3 0
	# Function Epilogue
	sys EXIT
	movi r3 0
	# Function Epilogue
	sys EXIT
