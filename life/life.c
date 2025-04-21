// imports
extern unsigned RESOLUTION_REG;
extern unsigned INPUT_STREAM;
extern unsigned FRAMEBUFFER_START;
unsigned FRAMEBUFFER_BUFFER = 0x6000; // gonna hope this doesnt cause problems

unsigned putchar(unsigned n);
unsigned print_unsigned(unsigned n);
int write_text_tilemap(int text_color, int bg_color);
int write_solid_tile(unsigned tile_num, unsigned color);
unsigned draw_pixel(unsigned x, unsigned y, unsigned p);
unsigned read_pixel(unsigned x, unsigned y);
unsigned clear_screen(void);

int setup_loop(void){
  unsigned *p = (unsigned*)RESOLUTION_REG;
  // lower resolution
  *p = 1;

  unsigned* input = (unsigned*)INPUT_STREAM;

  int cur_x = 5;
  int cur_y = 1;
  int erase = 1;

  int keypress;
  while (1){
    draw_pixel(cur_x, cur_y, 1);
    keypress = *input; // start over on next keypress
    if (keypress == 0x71) return 0; // this was a q
    else if (keypress == 0x77 && cur_y > 0) {
      if (erase) draw_pixel(cur_x, cur_y, 0);
      cur_y--;
    }
    else if (keypress == 0x73 && cur_y < 59) {
      if (erase) draw_pixel(cur_x, cur_y, 0);
      cur_y++;
    }
    if (keypress == 0x61 && cur_x > 0) {
      if (erase)draw_pixel(cur_x, cur_y, 0);
      cur_x--;
    }
    else if (keypress == 0x64 && cur_x < 79) {
      if (erase) draw_pixel(cur_x, cur_y, 0);
      cur_x++;
    }
    else if (keypress == 32) erase = !erase;
    else if (keypress == 13) break;
  }
}

int draw_pixel_buffered(unsigned x, unsigned y, unsigned new){
  unsigned* p = (unsigned*) FRAMEBUFFER_BUFFER;

  unsigned old = *(p + x / 2 + 64 * y);
  if (x & 1){
    *(p + x / 2 + 64 * y) = (new << 8) | (old & 0xFF);
  } else {
    *(p + x / 2 + 64 * y) = (new & 0xFF) | (old & 0xFF00);
  }
  return 0;
}

unsigned read_pixel_buffered(unsigned x, unsigned y){
  unsigned* p = (unsigned*) FRAMEBUFFER_BUFFER;

  unsigned old = *(p + x / 2 + 64 * y);
  if (x & 1){
    int v = *(p + x / 2 + 64 * y);
    return v >> 8;
  } else {
    int v = *(p + x / 2 + 64 * y);
    return v & 0xFF;
  }
  return 0;
}

int count_neighbors(int j, int i){
  int neighbor_count = 0;
  int v;
  if (i < 29) {
    v = read_pixel(j, i + 1);
    neighbor_count += v;
  }
  if (i < 29 && j < 39) {
    v = read_pixel(j + 1, i + 1);
    neighbor_count += v;
  }
  if (j < 39) {
    v = read_pixel(j + 1, i);
    neighbor_count += v;
  }
  if (j < 39 && i > 0) {
    v = read_pixel(j + 1, i - 1);
    neighbor_count += v;
  }
  if (i > 0) {
    v = read_pixel(j, i - 1);
    neighbor_count += v;
  }
  if (j > 0 && i > 0) {
    v = read_pixel(j - 1, i - 1);
    neighbor_count += v;
  }
  if (j > 0) {
    v = read_pixel(j - 1, i);
    neighbor_count += v;
  }
  if (j > 0 && i < 29) {
    v = read_pixel(j - 1, i + 1);
    neighbor_count += v;
  }
  return neighbor_count;
}

int life_main(void){
  write_text_tilemap(0x0F0, 0x000);
  clear_screen();
  write_solid_tile(1, 0xFFF);

  unsigned *p = (unsigned*)RESOLUTION_REG;
  // max resolution
  *p = 0;

  unsigned* input = (unsigned*)INPUT_STREAM;

  int paused = 0;
  int keypress;

  setup_loop();

  while (1){
    
    if (!paused) {
      for (int i = 0; i < 30; ++i){
        for (int j = 0; j < 40; ++j){
          int neighbor_count = count_neighbors(j, i);
          int alive = read_pixel(j, i);

          if (alive && (neighbor_count == 2 || neighbor_count == 3)){
            // survival
            draw_pixel_buffered(j, i, 1);
          } else if (!alive && neighbor_count == 3){
            // birth
            draw_pixel_buffered(j, i, 1);
          } else {
            // death
            draw_pixel_buffered(j, i, 0);
          }
        }
      }

      for (int i = 0; i < 30; ++i){
        for (int j = 0; j < 40; ++j){
          int v = read_pixel_buffered(j, i);
          draw_pixel(j, i, v);
        }
      }
    }

    keypress = *input; // start over on next keypress
    if (keypress == 32) paused = !paused;
    else if (keypress == 0x71) return 0; // this was a q
  }
} 