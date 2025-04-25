	
getKey:
	movi r4 INPUT_STREAM
	lw r4 r4 0
	lw r4 r4 0
	mov r3 r0
	movi r5 0x00FF
	and r6 r4 r5
	bz skip_key
	movi r5 0xFF00
	and r6 r4 r5
	movi r5 0xF000
	cmp r6 r5
	bz skip_key
	mov r3 r4
skip_key:
	movi r5 0x00FF
	and r3 r3 r5
	jalr r0 r7

waitKey:
	sw r7 r1 -1 # push registers
waitKey_loop:
	call getKey
	cmp r3 r0
	bz wk.skip_key

	# call serialWrite # keylogging
	lw r7 r1 -1 # pop registers
	jalr r0 r7

wk.skip_key:
	movi r6 1000
wk.delay_loop:
	addi r6 r6 -1
	bnz wk.delay_loop
	jmp waitKey_loop


serialWrite:
	movi r4 UART_TX_REG
	lw r4 r4 0
	sw r3 r4 0
	jalr r0 r7

setResolution:
	movi r4 RESOLUTION_REG
	lw r4 r4 0
	sw r3 r4 0
	jalr r0 r7