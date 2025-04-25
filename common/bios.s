	
getKey:
	movi r4 INPUT_STREAM
	lw r4 r4 0
	mov r3 r0
	lw r4 r4 0 # Load key
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