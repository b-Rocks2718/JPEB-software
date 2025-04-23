# Need c-compiler and JPEB-emulator in root directory to use this makefile
CC = ../JPEB-compiler/dist-newstyle/build/x86_64-linux/ghc-9.4.8/c-compiler-0.1.0.0/x/c-compiler/build/c-compiler/c-compiler
AS = python3 ../JPEB-compiler/Assembler.py
EMU = ../JPEB-emulator/target/release/JPEB-emulator
SIM = ../JPEB-FPGA/build/cpu

SIM_DATA = ../JPEB-FPGA/data
DATA_DIR = ../data

COMMON_C := $(wildcard common/*.c)
MAPPED_S    := $(COMMON_C:.c=.s)                            
EXTRA_S     := $(filter-out $(MAPPED_S),$(wildcard common/*.s))
COMMON      := $(strip $(MAPPED_S) $(EXTRA_S))

.PRECIOUS: %.bin %.s

math_demos/math_demos.run: math_demos/math_demos.bin
	$(EMU) math_demos/math_demos.bin

math_demos/math_demos.bin: math_demos/math_demos.s math_demos/mandelbrot/mandelbrot.s math_demos/collatz/collatz.s math_demos/life/life.s $(COMMON)
	rm -f $@
	$(AS) math_demos/math_demos.s math_demos/mandelbrot/mandelbrot.s math_demos/collatz/collatz.s math_demos/life/life.s $(COMMON)

%.s: %.c
	rm -f $@
	$(CC) $<

%.bin: %.s
	rm -f $@
	$(AS) $<

%.run: %.bin
	$(EMU) $<

%.deploy: %.bin
	@cp ${DATA_DIR}/*.hex ${SIM_DATA}/
	@cp $*.hex ${SIM_DATA}/program.hex
	@sed -i '1s/^/@0\n/' ${SIM_DATA}/program.hex
	$(SIM) +DATAPATH=${SIM_DATA}/

common/text.s: common/text.c
	rm -f common/text.s
	$(CC) common/text.c

common/tile.s: common/tile.c
	rm -f common/tile.s
	$(CC) common/tile.c

clean:
	@find . -type f -name "*.bin" -exec rm -f {} +
	@find . -type f -name "*.out" -exec rm -f {} +
	@find . -type f -name "*.hex" -exec rm -f {} +
	@rm -f collatz/collatz.s common/text.s mandelbrot/mandelbrot.s life/life.s common/text.s common/tile.s
