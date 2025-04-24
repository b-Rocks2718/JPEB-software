	movi r3 main
	jalr r0  r3 

# Data Section:

# Code Section:
main:
	movi r1 40959
	movi r2 40959
	addi r1  r1  -20
	movi r3 UART_TX_REG
	lw r3  r3  0
	sw r3  r2  -1
	lw r3  r2  -1
	sw r3  r2  -2
	movi r3 INPUT_STREAM
	lw r3  r3  0
	sw r3  r2  -3
	lw r3  r2  -3
	sw r3  r2  -4
main.while.0.continue:
	movi r3 1
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.while.0.break
	jalr r0  r3 
	lw r3  r2  -4
	lw r4  r3  0
	sw r4  r2  -5
	lw r3  r2  -5
	sw r3  r2  -6
	movi r3 0
	sw r3  r2  -7
	movi r3 1
	sw r3  r2  -8
	movi r3 255
	sw r3  r2  -9
	lw r3  r2  -6
	lw r4  r2  -9
	and r3  r3  r4 
	sw r3  r2  -10
	movi r3 0
	sw r3  r2  -11
	lw r3  r2  -10
	lw r4  r2  -11
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.7
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -8
main.end.7:
	lw r3  r2  -8
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.14
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -12
	movi r3 65280
	sw r3  r2  -13
	lw r3  r2  -6
	lw r4  r2  -13
	and r3  r3  r4 
	sw r3  r2  -14
	movi r3 61440
	sw r3  r2  -15
	lw r3  r2  -14
	lw r4  r2  -15
	cmp r3  r4 
	bnz 1
	jmp 3
	movi r3 main.end.12
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -12
main.end.12:
	lw r3  r2  -12
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.14
	jalr r0  r3 
	movi r3 1
	sw r3  r2  -7
main.end.14:
	lw r3  r2  -7
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.end.15
	jalr r0  r3 
	lw r3  r2  -2
	lw r4  r2  -6
	sw r4  r3  0
main.end.15:
	movi r3 0
	sw r3  r2  -16
	lw r3  r2  -16
	sw r3  r2  -17
main.for.1.start:
	movi r3 1
	sw r3  r2  -18
	movi r3 100
	sw r3  r2  -19
	lw r3  r2  -17
	lw r4  r2  -19
	cmp r3  r4 
	bb 1
	jmp 3
	movi r3 main.end.19
	jalr r0  r3 
	movi r3 0
	sw r3  r2  -18
main.end.19:
	lw r3  r2  -18
	movi r4 0
	cmp r3  r4 
	bz 1
	jmp 3
	movi r3 main.for.1.break
	jalr r0  r3 
main.for.1.continue:
	movi r3 1
	sw r3  r2  -20
	lw r3  r2  -17
	lw r4  r2  -20
	add r3  r3  r4 
	sw r3  r2  -17
	movi r3 main.for.1.start
	jalr r0  r3 
main.for.1.break:
	movi r3 main.while.0.continue
	jalr r0  r3 
main.while.0.break:
	movi r3 0
	# Function Epilogue
	sys EXIT
