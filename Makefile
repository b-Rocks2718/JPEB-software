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

math_demos/math_demos.bin: math_demos/math_demos.s math_demos/mandelbrot/mandelbrot.s math_demos/collatz/collatz.s math_demos/life/life.s $(COMMON)
	rm -f $@
	$(AS) math_demos/math_demos.s math_demos/mandelbrot/mandelbrot.s math_demos/collatz/collatz.s math_demos/life/life.s $(COMMON)

dino/dino.bin: dino/dino.s dino/dino_animations.s $(COMMON)
	rm -f $@
	$(AS) dino/dino.s dino/dino_animations.s $(COMMON)

mandelbrot/mandelbrot.bin: mandelbrot/mandelbrot.s
	rm -f $@
	$(AS) mandelbrot/mandelbrot.s $(COMMON)

ascii_mandelbrot/mandelbrot.bin: ascii_mandelbrot/mandelbrot.s
	rm -f $@
	$(AS) ascii_mandelbrot/mandelbrot.s $(COMMON)

snake/snake_test.bin: snake/snake_test.s
	rm -f $@
	$(AS) snake/snake_test.s $(COMMON)

snake/snake.bin: snake/snake.s
	rm -f $@
	$(AS) snake/snake.s $(COMMON)

snake/snake_low_res.bin: snake/snake_low_res.s
	rm -f $@
	$(AS) snake/snake_low_res.s $(COMMON)

console/console.bin: console/console.s
	rm -f $@
	$(AS) console/console.s $(COMMON)

%.s: %.c $(COMMON)
	rm -f $@
	$(CC) $<

%.bin: %.s $(COMMON)
	rm -f $@
	rm -f $*.hex
	$(AS) $< $(COMMON)

%.run: %.bin
	$(EMU) $<

%.deploy: %.bin
	@cp ${DATA_DIR}/*.hex ${SIM_DATA}/
	@cp $*.hex ${SIM_DATA}/program.hex
	@sed -i '1s/^/@0\n/' ${SIM_DATA}/program.hex
	# $(SIM) +DATAPATH=${SIM_DATA}/

common/text.s: common/text.c
	rm -f common/text.s
	$(CC) common/text.c

common/tile.s: common/tile.c
	rm -f common/tile.s
	$(CC) common/tile.c

common/io_addresses.s: common/io_addresses.c
	rm -f common/io_addresses.s
	$(CC) common/io_addresses.c

clean:
	@find . -type f -name "*.bin" -exec rm -f {} +
	@find . -type f -name "*.out" -exec rm -f {} +
	@find . -type f -name "*.hex" -exec rm -f {} +
	@rm -f collatz/collatz.s common/text.s mandelbrot/mandelbrot.s life/life.s common/tile.s math_demos/math_demos.s ascii_mandelbrot/mandelbrot.s
