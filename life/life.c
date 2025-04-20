// imports
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;

unsigned putchar(unsigned n);
unsigned print_unsigned(unsigned n);
unsigned write_text_tilemap(void);
int write_solid_tile(unsigned tile_num, unsigned color);

int main(void){
  write_text_tilemap();
  write_solid_tile(1, 0xFFF);

  unsigned *p = (unsigned*)RESOLUTION_REG;
  // max resolution
  *p = 0;

  unsigned* input = (unsigned*)INPUT_STREAM;
  unsigned* fb = (unsigned*)FRAMEBUFFER_START;

  int cur_x = 5;
  int cur_y = 1;

  int keypress;
  while (1){
    *(fb + cur_x + cur_y * 64) = 1;
    keypress = *input; // start over on next keypress
    if (keypress == 0x71) return 0; // this was a q
  }
} 