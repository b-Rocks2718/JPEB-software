// imports
extern unsigned RESOLUTION_REG;
extern unsigned FRAMEBUFFER_START;
extern unsigned TILEMAP_START;

int write_solid_tile(unsigned tile_num, unsigned color){
  unsigned* p = (unsigned*)TILEMAP_START;
  p += 64 * tile_num;
  for (int i = 0; i < 64; ++i){
    p[i] = color;
  }
}

int draw_pixel(unsigned x, unsigned y, unsigned new){
  unsigned* p = (unsigned*) FRAMEBUFFER_START;

  unsigned old = *(p + x / 2 + 64 * y);
  if (x & 1){
    *(p + x / 2 + 64 * y) = (new << 8) | (old & 0xFF);
  } else {
    *(p + x / 2 + 64 * y) = (new & 0xFF) | (old & 0xFF00);
  }
  return 0;
}

unsigned read_pixel(unsigned x, unsigned y){
  unsigned* p = (unsigned*) FRAMEBUFFER_START;

  unsigned old = *(p + x / 2 + 64 * y);
  if (x & 1){
    int v = *(p + x / 2 + 64 * y);
    v >>= 8;
    return v;
  } else {
    int v = *(p + x / 2 + 64 * y);
    v &= 0xFF;
    return v;
  }
}