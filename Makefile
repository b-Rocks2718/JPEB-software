# Need c-compiler and JPEB-emulator in root directory to use this makefile
CC = ./c-compiler
AS = python3 Assembler.py
EMU = ./JPEB-emulator

COMMON_C := $(wildcard common/*.c)
MAPPED_S    := $(COMMON_C:.c=.s)                            
EXTRA_S     := $(filter-out $(MAPPED_S),$(wildcard common/*.s))
COMMON      := $(strip $(MAPPED_S) $(EXTRA_S))

.PRECIOUS: %.bin %.s

math_demos/math_demos.run: math_demos/math_demos.bin
	$(EMU) math_demos/math_demos.bin

math_demos/math_demos.bin: math_demos/math_demos.s mandelbrot/mandelbrot.s collatz/collatz.s $(COMMON)
	rm -f $@
	$(AS) math_demos/math_demos.s mandelbrot/mandelbrot.s collatz/collatz.s $(COMMON)

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