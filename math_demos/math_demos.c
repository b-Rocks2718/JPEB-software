// imports
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;

unsigned putchar(unsigned n);
unsigned print(unsigned* p);
unsigned print_unsigned(unsigned n);
int write_text_tilemap_all(int text_color, int bg_color);
int write_solid_tile(unsigned tile_num, unsigned color);
int clear(void);
unsigned getKey(void);
unsigned waitKey(void);
int serialWrite(unsigned data);

unsigned math[14] = {0X4D,0X61,0X74,0X68,0X20,0X44,0X65,0X6D,0X6F,0X73,0X21, 0X0A, 0X0A, 0X00};
unsigned option1[21] = {32, 32, 0X43,0X6F,0X6C,0X6C,0X61,0X74,0X7A,0X20,0X53,0X65,0X71,0X75,0X65,0X6E,0X63,0X65,0X73,0X0A,0X00};
unsigned option2[18] = {32, 32, 0x4D,0X61,0X6E,0X64,0X65,0X6C,0X62,0X72,0X6F,0X74,0X20,0X53,0X65,0X74,0X0A,0X00};
unsigned option3[24] = {32, 32, 0x43,0X6F,0X6E,0X77,0X61,0X79,0X27,0X73,0X20,0X47,0X61,0X6D,0X65,0X20,0X6F,0X66,0X20,0X4C,0X69,0X66,0X65,0X00};

int mandelbrot_main(void);
int collatz_main(void);
int life_main(void);

int update_selector(int selector){
  unsigned* fb = (unsigned*)FRAMEBUFFER_START;
  if (selector == 0){
    *(fb + 64 * 2) = 0x3E;
    *(fb + 64 * 3) = 0x00;
    *(fb + 64 * 4) = 0x00;
  } else if (selector == 1){
    *(fb + 64 * 2) = 0x00;
    *(fb + 64 * 3) = 0x3E;
    *(fb + 64 * 4) = 0x00;
  } else if (selector == 2){
    *(fb + 64 * 2) = 0x00;
    *(fb + 64 * 3) = 0x00;
    *(fb + 64 * 4) = 0x3E;
  }
}

int main(void){
  start:
  clear();
  write_text_tilemap_all(0x0F0, 0x111);
  unsigned *p = (unsigned*)RESOLUTION_REG;
  // lower resolution
  *p = 1;

  p = (unsigned*)INPUT_STREAM;

  int selector = 0;

  unsigned* fb = (unsigned*)FRAMEBUFFER_START;

  print(math);
  print(option1);
  print(option2);
  print(option3);

  unsigned d = 0;
  while (1){
    update_selector(selector);

    d = waitKey();
    if (d == 0x73) selector = ((selector + 1) % 3);
    else if (d == 0x77) selector = ((selector - 1) % 3);
    if (d == 13 || d == 10) {
      if (selector == 0){
        // collatz
        collatz_main();
        goto start;
      } else if (selector == 1) {
        // mandelbrot
        mandelbrot_main();
        goto start;
      } else {
        life_main();
        goto start;
      }
    }
    if (d == 0x71) return 0; // this was a q
  }
}