// imports
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;

unsigned putchar(unsigned n);
unsigned print(unsigned* p);
unsigned print_unsigned(unsigned n);
unsigned write_text_tilemap(void);
int write_solid_tile(unsigned tile_num, unsigned color);
int clear_screen(void);

unsigned math[14] = {0X4D,0X61,0X74,0X68,0X20,0X44,0X65,0X6D,0X6F,0X73,0X21, 0X0A, 0X0A, 0X00};
unsigned option1[21] = {32, 32, 0X43,0X6F,0X6C,0X6C,0X61,0X74,0X7A,0X20,0X53,0X65,0X71,0X75,0X65,0X6E,0X63,0X65,0X73,0X0A,0X00};
unsigned option2[17] = {32, 32, 0x4D,0X61,0X6E,0X64,0X65,0X6C,0X62,0X72,0X6F,0X74,0X20,0X53,0X65,0X74,0X00};

int mandelbrot_main(void);
int collatz_main(void);

int main(void){
  start:
  clear_screen();
  write_text_tilemap();
  unsigned *p = (unsigned*)RESOLUTION_REG;
  // lower resolution
  *p = 1;

  p = (unsigned*)INPUT_STREAM;

  int selector = 1;

  unsigned* fb = (unsigned*)FRAMEBUFFER_START;

  print(math);
  print(option1);
  print(option2);

  int d;
  while (1){
    if (selector){
      *(fb + 64 * 3) = 0x00;
      *(fb + 64 * 2) = 0x3E;
    } else {
      *(fb + 64 * 2) = 0x00;
      *(fb + 64 * 3) = 0x3E;
    }

    d = *p; // start over on next keypress
    if (d == 0x77 || d == 0x73) selector = !selector;
    if (d == 13) {
      if (selector){
        // collatz
        collatz_main();
        goto start;
      } else {
        // mandelbrot
        mandelbrot_main();
        goto start;
      }
    }
    if (d == 0x71) return 0; // this was a q
  }
}