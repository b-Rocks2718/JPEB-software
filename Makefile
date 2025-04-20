
CC = ./c-compiler
AS = python3 Assembler.py
EMU = ./JPEB-emulator

COMMON_C := $(wildcard common/*.c)
COMMON := $(COMMON_C:.c=.s) $(wildcard common/*.s)

.PRECIOUS: %.bin %.s

%.run: %.bin
	$(EMU) $<

%.bin: %.s $(COMMON)
	rm -f $@
	$(AS) $< $(COMMON)

%.s: %.c
	rm -f $@
	$(CC) $<

common/text.s: common/text.c
	rm -f common/text.s
	$(CC) common/text.c

clean:
	rm -f collatz/collatz.s common/text.s collatz/collatz.out collatz/collatz.bin \
		mandelbrot/mandelbrot.bin mandelbrot/mandelbrot.out mandelbrot/mandelbrot.s