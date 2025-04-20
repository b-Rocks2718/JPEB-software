	movi r3 main
	jalr r0  r3 

# Data Section:

# Code Section:
main:
	movi r1 40959
	movi r2 40959
	addi r1  r1  -23
	call write_text_tilemap
	sw r3  r2  -1
	movi r3 1
	sw r3  r2  -2
	movi r3 4095
	sw r3  r2  -3
	lw r3  r2  -2
	lw r4  r2  -3
	call write_solid_tile
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
	sw r3  r2  -9
	movi r3 FRAMEBUFFER_START
	lw r3  r3  0
	sw r3  r2  -10
	lw r3  r2  -10
	sw r3  r2  -11
	movi r3 5
	sw r3  r2  -12
	movi r3 1
	sw r3  r2  -13
main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.0.break
	jalr r0  r3 
	lw r3  r2  -12
	movi r4 1
	call smul
	sw r3  r2  -14
	lw r3  r2  -11
	lw r4  r2  -14
	add r3  r3  r4 
	sw r3  r2  -15
	lw r3  r2  -13
	movi r4 64
	call smul
	sw r3  r2  -16
	lw r3  r2  -16
	movi r4 1
	call smul
	sw r3  r2  -17
	lw r3  r2  -15
	lw r4  r2  -17
	add r3  r3  r4 
	sw r3  r2  -18
	movi r3 1
	sw r3  r2  -19
	lw r3  r2  -18
	lw r4  r2  -19
	sw r4  r3  0
	lw r3  r2  -9
	lw r4  r3  0
	sw r4  r2  -20
	lw r3  r2  -20
	sw r3  r2  -21
	lw r3  r2  -21
	sw r3  r2  -22
	movi r3 1
	sw r3  r2  -23
	lw r3  r2  -22
	movi r4 113
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.17
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -23
main.end.17:
	lw r3  r2  -23
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.18
	jalr r0  r3 
	movi r3 0
	# Function Epilogue
	sys EXIT
main.end.18:
	movi r3 main.while.0.continue
	jalr r0  r3 
main.while.0.break:
	movi r3 0
	# Function Epilogue
	sys EXIT
