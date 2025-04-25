
	# Set stack pointer
	movi r1 0x9fff
	movi r2 0x9fff

	movi r3 0x0F0
	movi r4 0x000
	call write_text_tilemap

	movi r3 0
	movi r4 0
	call write_solid_tile

	call clear_screen

	movi r3 1
	call setResolution

	movi r3 62
	call serialWrite
	movi r3 62
    call putchar

update_loop:

	call getKey

	cmp r3 r0
	bz skip_key2

	mov r2 r3
	call putchar

	mov r3 r2
	call serialWrite

skip_key2:

	movi r6 1000
delay_loop:
	addi r6 r6 -1
	bnz delay_loop
	
	jmp update_loop
