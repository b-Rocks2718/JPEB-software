	movi r4 UART_TX_REG
	lw r4 r4 0
	movi r5 INPUT_STREAM
	lw r5 r5 0
	movi r7 0x00FF
	movi r2 0xFF00
	movi r1 0xF000
update_loop:
	lw r3 r5 0 # Load key
	and r6 r3 r7
	bz skip_key
	and r6 r3 r2
	cmp r6 r1
	bz skip_key
	sw r3 r4 0 # Output to TX
skip_key:

	movi r6 1000
delay_loop:
	addi r6 r6 -1
	bnz delay_loop
	
	jmp update_loop
