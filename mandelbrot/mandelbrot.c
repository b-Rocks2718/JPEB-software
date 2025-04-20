
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;

unsigned putchar(unsigned n);
unsigned print_unsigned(unsigned n);
unsigned write_tilemap(void);

// we'll used 16 bit fixed point integers with this format: XXXX XXXX.XXXX XXXX
unsigned mul_fixed(unsigned x, unsigned y){
  unsigned result = 0;
  for (int i = 0; i < 16; ++i){
    if (y & (0x8000 >> i)){
      result += (x << (7 - i));
    }
  }
  return result;
}

unsigned mul_complex(unsigned x1, unsigned y1, unsigned x2, unsigned y2, 
                     unsigned* x3, unsigned* y3){
  unsigned real = mul_fixed(x1, x2) - mul_fixed(y1, y2);
  unsigned imag = mul_fixed(x1, y2) + mul_fixed(y1, x2);
  *x3 = real;
  *y3 = imag;
}

unsigned norm(unsigned x, unsigned y){
  return mul_fixed(x, x) + mul_fixed(y, y);
}

int mandelbrot_count(unsigned c_x, unsigned c_y){
  unsigned z_x = 0;
  unsigned z_y = 0;
  int i = 0;
  for (int i = 0; i < 100; ++i){
    mul_complex(z_x, z_y, z_x, z_y, &z_x, &z_y);
    z_x += c_x;
    z_y += c_y;
  }
  if (i == 100) i = -1;
  return i;
}

unsigned FIXED_ONE = 0x0100;

int main(void){
  write_tilemap();

  unsigned *p = (unsigned*)RESOLUTION_REG;
  // decrease resolution
  *p = 1;

  p = (unsigned*)INPUT_STREAM;

  print_unsigned(FIXED_ONE);
  putchar(10);
  print_unsigned(mul_fixed(FIXED_ONE, FIXED_ONE));

  int d;
  while (1){
    d = *p; // start over on next keypress
    if (d == 0x71) return 0; // this was a q
  }
} 