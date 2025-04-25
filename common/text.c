unsigned ZERO_CHAR = 48;

extern unsigned FRAMEBUFFER_START;
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;

static unsigned cursor_index = 0;
static unsigned line_index = 0;

unsigned clear_screen(void);

unsigned putchar (unsigned c){
  unsigned* p = (unsigned*)FRAMEBUFFER_START + 64 * line_index + cursor_index / 2;

  if (c == 10 || c == 13){
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

  p = (unsigned*)RESOLUTION_REG;
  int resolution = *p;
  int max = 60 >> resolution;

  if (cursor_index >= max){
    cursor_index = 0; // go to next line
    line_index++;
  }
}

unsigned print_unsigned(unsigned x){
  unsigned d = x % 10;
  x = x / 10;
  if (x != 0){
    print_unsigned(x);
  } 
  putchar(ZERO_CHAR + d);
}

unsigned reset_cursor(void){
  cursor_index = 0;
  line_index = 0;
}

unsigned clear(void){
  reset_cursor();
  clear_screen();
}

unsigned print(unsigned* string){
  for (unsigned* i = string; *i != 0; ++i){
    putchar(*i);
  }
}