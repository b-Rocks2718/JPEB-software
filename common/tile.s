	movi r3 main
	jalr r0  r3 

# Data Section:

# Code Section:
write_solid_tile:
	# Function Prologue
	sw r7  r1  -1
	sw r2  r1  -2
	addi r1  r1  -2
	addi r2  r1  0
	# Function Body
	addi r1  r1  -12
	sw r3  r2  -1
	sw r4  r2  -2
	movi r3 49152
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
	lw r3  r2  -4
	sw r3  r2  -5
	lw r3  r2  -5
	sw r3  r2  -6
	movi r3 64
	sw r3  r2  -7
	lw r3  r2  -7
	lw r4  r2  -1
	call umul
	sw r3  r2  -8
	lw r3  r2  -6
	lw r4  r2  -8
	add r3  r3  r4 
	sw r3  r2  -6
	movi r3 0
	sw r3  r2  -9
write_solid_tile.for.0.start:
	movi r3 1
	sw r3  r2  -10
	lw r3  r2  -9
	movi r4 64
	cmp r3  r4 
	bl 1
	jmp 3
	movi r3 write_solid_tile.end.7
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -10
write_solid_tile.end.7:
	lw r3  r2  -10
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 write_solid_tile.for.0.break
	jalr r0  r3 
	lw r3  r2  -9
	movi r4 1
	call smul
	sw r3  r2  -11
	lw r3  r2  -6
	lw r4  r2  -11
	add r3  r3  r4 
	sw r3  r2  -12
	lw r3  r2  -12
	lw r4  r2  -2
	sw r4  r3  0
write_solid_tile.for.0.continue:
	lw r3  r2  -9
	movi r4 1
	add r3  r3  r4 
	sw r3  r2  -9
	movi r3 write_solid_tile.for.0.start
	jalr r0  r3 
write_solid_tile.for.0.break:
	movi r3 0
	# Function Epilogue
	mov r1  r2 
	lw r7  r2  1
	lw r2  r2  0
	addi r1  r1  2
	jalr r0  r7 
