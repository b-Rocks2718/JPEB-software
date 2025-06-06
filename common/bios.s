	
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
	movi r6 100 # <====== changes made here: replaced delay cycles of 1000 with 100
wk.delay_loop:
	addi r6 r6 -1
	bnz wk.delay_loop
	jmp waitKey_loop

waitKeyFor:
	push r7
	push r4
	mov r4 r3
waitKeyFor_loop:
	push r4
	call getKey
	pop r4
	cmp r3 r0
	bz wkF.skip_key

wkF.exit:
	pop r4
	pop r7
	jalr r0 r7

wkF.skip_key:
	addi r4 r4 -1
	bz wkF.exit

	movi r6 100 # <====== changes made here: replaced delay cycles of 1000 with 100
wkF.delay_loop:
	addi r6 r6 -1
	bnz wkF.delay_loop
	jmp waitKeyFor_loop

serialWrite:
	movi r4 UART_TX_REG
	lw r4 r4 0
	sw r3 r4 0
	jalr r0 r7

serialRead:
	movi r3 UART_RX_REG
	lw r3 r3 0
	lw r3 r3 0
	jalr r0 r7

setResolution:
	movi r4 RESOLUTION_REG
	lw r4 r4 0
	sw r3 r4 0
	jalr r0 r7