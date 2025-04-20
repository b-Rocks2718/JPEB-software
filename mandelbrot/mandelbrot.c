
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;

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

int main(void){
  return 0;
} 