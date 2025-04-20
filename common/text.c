unsigned ZERO_CHAR = 48;

unsigned FRAMEBUFFER_START = 0xE000;
unsigned RESOLUTION_REG = 0xFFFC;
unsigned INPUT_STREAM = 0xFFFF;

static unsigned cursor_index = 0;
static unsigned line_index = 0;

unsigned putchar (unsigned c){
  unsigned* p = (unsigned*)FRAMEBUFFER_START + 64 * line_index + cursor_index / 2;

  if (c == 10){
    cursor_index = 0;
    line_index++;
    return 0;
  }

  if (cursor_index & 1) {
    *p = *p | (c << 8);
  } else {
    *p = c;
  }
  cursor_index++;

  if (cursor_index >= 40){
    cursor_index = 0; // go to next line
    line_index++;
  }
}

unsigned print_unisgned(unsigned x){
  unsigned d = x % 10;
  x = x / 10;
  if (x != 0){
    print_unisgned(x);
  } 
  putchar(ZERO_CHAR + d);
}

unsigned clear_screen(void){
  cursor_index = 0;
  line_index = 0;
  for (int i = 0; i < 60 * 80; ++i){
    putchar(0);
  }
  cursor_index = 0;
  line_index = 0;
}

unsigned print(unsigned* string){
  for (unsigned* i = string; *i != 0; ++i){
    putchar(*i);
  }
}