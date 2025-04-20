# Makefile
CC = ./c-compiler
AS = python3 Assembler.py
EMU = ./JPEB-emulator

collatz.run: collatz.bin
	$(EMU) collatz/collatz.bin

collatz.bin: collatz/collatz.s asm_libraries/arithmetic.s asm_libraries/text_tile_loader.s common/text.s Assembler.py
	$(AS) collatz/collatz.s asm_libraries/arithmetic.s asm_libraries/text_tile_loader.s common/text.s

collatz/collatz.s: collatz/collatz.c
	$(CC) collatz/collatz.c

common/text.s: common/text.c
	$(CC) common/text.c

clean:
	rm -f collatz/collatz.s common/text.s collatz/collatz.out collatz/collatz.bin