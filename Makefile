# Need c-compiler and JPEB-emulator in root directory to use this makefile
CC = ../JPEB-compiler/dist-newstyle/build/x86_64-linux/ghc-9.4.8/c-compiler-0.1.0.0/x/c-compiler/build/c-compiler/c-compiler
AS = python3 ../JPEB-compiler/Assembler.py
EMU = ../JPEB-emulator/target/release/JPEB-emulator

COMMON_C := $(wildcard common/*.c)
MAPPED_S    := $(COMMON_C:.c=.s)                            
EXTRA_S     := $(filter-out $(MAPPED_S),$(wildcard common/*.s))
COMMON      := $(strip $(MAPPED_S) $(EXTRA_S))

.PRECIOUS: %.bin %.s

math_demos/math_demos.run: math_demos/math_demos.bin
	$(EMU) math_demos/math_demos.bin

math_demos/math_demos.bin: math_demos/math_demos.s mandelbrot/mandelbrot.s collatz/collatz.s life/life.s $(COMMON)
	rm -f $@
	$(AS) math_demos/math_demos.s mandelbrot/mandelbrot.s collatz/collatz.s life/life.s $(COMMON)

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

common/tile.s: common/tile.c
	rm -f common/tile.s
	$(CC) common/tile.c

clean:
	find . -type f -name "*.bin" -exec rm -f {} +
	find . -type f -name "*.out" -exec rm -f {} +
	rm -f collatz/collatz.s common/text.s mandelbrot/mandelbrot.s life/life.s common/text.s common/tile.s
