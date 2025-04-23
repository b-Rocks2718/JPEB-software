// imports
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;
extern unsigned TILEMAP_START;
extern unsigned SCROLL_X;
extern unsigned SCROLL_Y;

unsigned putchar(unsigned n);
unsigned print_unsigned(unsigned n);
int write_text_tilemap(int text_color, int bg_color);
int write_solid_tile(unsigned tile_num, unsigned color);
int clear_screen(void);
unsigned read_pixel(unsigned x, unsigned y);
unsigned draw_pixel(unsigned x, unsigned y, unsigned color);

// constants
int FIXED_ONE = 0x0100;

// we'll used 16 bit fixed point integers with this format: XXXX XXXX.XXXX XXXX
int mul_fixed(int x, int y);

int mul_complex(int x1, int y1, int x2, int y2, 
                     int* x3, int* y3){
  int real = mul_fixed(x1, x2) - mul_fixed(y1, y2);
  int imag = mul_fixed(x1, y2) + mul_fixed(y1, x2);
  *x3 = real;
  *y3 = imag;
}

unsigned norm(int x, int y){
  return mul_fixed(x, x) + mul_fixed(y, y);
}

int mandelbrot_count(int c_x, int c_y){
  int z_x = 0;
  int z_y = 0;
  int i;
  for (i = 0; i < 100; ++i){
    int temp_x;
    int temp_y;
    mul_complex(z_x, z_y, z_x, z_y, &temp_x, &temp_y);
    z_x = temp_x + c_x;
    z_y = temp_y + c_y;
    int d = norm(z_x, z_y);
    if (d > 4 * FIXED_ONE) break;
  }
  if (i == 100) i = -1;
  return i;
}

unsigned colors[26] = 
  {0x000, 0x00F, 0x04F, 0x08F, 0x0CF,
   0x0FF, 0x0FC, 0x0F8, 0x0F4, 0x0F0,
   0x000, 0x4F0, 0x8F0, 0xCF0, 0xFF0,
   0xFC0, 0xF80, 0xF40, 0xF00, 0xF04,
   0xF08, 0xF0C, 0xF0F, 0xC0F, 0x80F,
   0x40F};

int display_mandelbrot(unsigned start_x, unsigned start_y, unsigned diff){
  for (int i = 0; i < 60; ++i){
    for (int j = 0; j < 80; ++j){
      int c_x = start_x + diff * j;
      int c_y = start_y - diff * i;
      int count = mandelbrot_count(c_x, c_y);
      if (count >= 0){
        count = count + 1;
        if (count >= 10) count = count + 1;
        if (count > 25) count = 25;
        draw_pixel(j, i, count);
      } else {
        draw_pixel(j, i, 0);
      }
    }
  }
}

int main(void){
  write_text_tilemap(0x0F0, 0x000);
  clear_screen();

  unsigned *p = (unsigned*)RESOLUTION_REG;
  // max resolution
  *p = 0;
  
  // set up colors
  for (int i = 0; i < 20; ++i){
    if (i != 10) write_solid_tile(i, colors[i]);
  }

  int start_x = -0x0200;
  int start_y = 0x0110;

  int diff = 0x0009;

  display_mandelbrot(start_x, start_y, diff);

  return 0;
} 